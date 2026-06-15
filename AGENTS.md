# Agent instructions for OhMySwift

Public guide for LLMs and contributors working on [ohmyswift.com](https://ohmyswift.com/blog/).  
**Do not add secrets, IPs, SSH keys, or credentials to this file.**

## Is this file a good idea?

Yes, for this repo. It documents a non-obvious production setup (Jekyll + GitHub Actions + VPS + Nginx Proxy Manager) so future agents do not:

- Restart `jekyll serve` on the VPS
- Break `/blog` URL routing
- Misconfigure deploy paths or YAML front matter
- Expose or rotate secrets in the repository

Keep this file updated when deployment changes. Never store real secret values here — only secret **names** and patterns.

---

## Project overview

| Item | Value |
|------|--------|
| Stack | Jekyll, `jekyll-whiteglass` theme, Ruby 3.2 |
| Content | Markdown posts in `_posts/` |
| Site URL | `https://ohmyswift.com` |
| Blog base URL | `/blog` (set in `_config.yml` as `baseurl`) |
| Default branch | `master` |
| Build output | `_site/` (static HTML) |

---

## Architecture

Production uses **two nginx layers** on the VPS. Do not confuse them.

```text
Visitor
  ↓
Cloudflare (DNS / CDN)
  ↓
Nginx Proxy Manager (NPM)     ← Layer 1: public-facing reverse proxy
  - Terminates SSL (Let's Encrypt)
  - Maps ohmyswift.com → host:<PROXY_PORT>
  ↓
Docker: nginx:alpine container  ← Layer 2: static file server (ohmyswift-static)
  - Serves pre-built HTML from <DEPLOY_PATH>
  - Must mount files under /blog (see below)
  ↓
Static files on disk at <DEPLOY_PATH>  ← written by GitHub Actions rsync
```

```text
Author machine                    GitHub Actions                 VPS
─────────────                    ──────────────                 ───
Write post  →  git push master  →  jekyll build  →  rsync _site/  →  <DEPLOY_PATH>/
```

**Production does not run `jekyll serve`.**  
GitHub Actions builds the site; the VPS serves pre-built static files only.

| Component | Runs where | Responsibility |
|-----------|------------|----------------|
| **GitHub Actions** | GitHub cloud | Build Jekyll → rsync `_site/` to VPS |
| **Nginx Proxy Manager** | VPS (Docker) | Domain, HTTPS, reverse proxy to backend port |
| **ohmyswift-static** (`nginx:alpine`) | VPS (Docker) | Serve static HTML/CSS/assets |
| **`jekyll serve`** | ~~VPS~~ **OFF** | Legacy dev-only; must not run in production |

---

## Publishing a new article

1. Create `_posts/YYYY-MM-DD-post-slug.md`
2. Use standard front matter (see existing posts)
3. **Quote YAML values that contain colons:**
   ```yaml
   title: "WWDC26 Platforms State of the Union: A Developer Recap"
   ```
   Unquoted colons break parsing and produce **empty titles** on the homepage.
4. Add images under `assets/images/<folder>/` when needed
5. Commit and push to `master`
6. GitHub Actions runs automatically (workflow: `.github/workflows/deploy.yml`)
7. Confirm green check in **Actions**; site updates in ~1–2 minutes

No VPS access is required to publish from a developer machine.

---

## Automated deploy (GitHub Actions)

Workflow file: `.github/workflows/deploy.yml`

| Trigger | `push` to `master`, or manual `workflow_dispatch` |
| Build | `JEKYLL_ENV=production bundle exec jekyll build` |
| Deploy | `rsync` of `_site/` to VPS over SSH |

### Required GitHub repository secrets

Configure in **Settings → Secrets and variables → Actions**. Use placeholders only in docs — never commit values.

| Secret name | Purpose |
|-------------|---------|
| `SSH_HOST` | VPS hostname or IP |
| `SSH_USER` | Dedicated deploy user (e.g. `deploy`) |
| `SSH_PRIVATE_KEY` | Deploy key (private half; public half on VPS `authorized_keys`) |
| `SSH_PORT` | SSH port (non-default if applicable) |
| `DEPLOY_PATH` | Absolute path where `_site/` contents are synced |

Helper script (local, one-time setup): `scripts/setup-deploy-secrets.sh`

---

## VPS production setup

### Deploy user (for GitHub Actions rsync)

- Create a limited `deploy` user for CI only
- Add the GitHub Actions **public** key to `~/.ssh/authorized_keys`
- `DEPLOY_PATH` must be writable by `deploy`
- Do **not** put private keys on the server

---

### Layer 2: Docker nginx static container

This container serves the built site. It is **separate** from Nginx Proxy Manager.

**Container name:** `ohmyswift-static`  
**Image:** `nginx:alpine`  
**Listens on:** `<PROXY_PORT>` on the VPS host (maps to port 80 inside the container)

#### Why the volume mount uses `/blog`

Jekyll `baseurl` is `/blog` in `_config.yml`. Built files sit at the root of `_site/` (e.g. `index.html`, `2026/`, `assets/`), but all public URLs start with `/blog/`.

Mount the deploy directory **into the container under `/blog`**:

```bash
docker run -d \
  --name ohmyswift-static \
  --restart unless-stopped \
  -p <PROXY_PORT>:80 \
  -v <DEPLOY_PATH>:/usr/share/nginx/html/blog:ro \
  nginx:alpine
```

| Host path | Container path | Serves URL |
|-----------|----------------|------------|
| `<DEPLOY_PATH>/index.html` | `/usr/share/nginx/html/blog/index.html` | `/blog/` |
| `<DEPLOY_PATH>/2026/...` | `/usr/share/nginx/html/blog/2026/...` | `/blog/2026/...` |

**Wrong mount (causes 404):** `<DEPLOY_PATH>` → `/usr/share/nginx/html` — nginx looks for `/blog/index.html` and does not find it.

#### Verify the static container

```bash
docker ps --filter name=ohmyswift-static
curl -I http://127.0.0.1:<PROXY_PORT>/blog/
curl -I http://127.0.0.1:<PROXY_PORT>/blog/2026/06/15/<post-slug>/
```

#### Restart or recreate (no secrets in commands)

```bash
docker start ohmyswift-static          # if stopped
docker logs ohmyswift-static           # debug
docker restart ohmyswift-static        # after config change
```

If recreating, use the same `-p`, `-v`, and `--name` as above. New deploys from GitHub Actions do **not** require a container restart — files update on disk immediately.

---

### Layer 1: Nginx Proxy Manager (NPM)

NPM is the **public entry point**. It does not serve blog files directly; it forwards traffic to the Docker nginx container.

Configure in the NPM web UI (**Hosts → Proxy Hosts**):

| NPM field | Value |
|-----------|--------|
| Domain names | `ohmyswift.com`, `www.ohmyswift.com` |
| Scheme | `http` |
| Forward hostname / IP | VPS localhost or host IP (e.g. `127.0.0.1`) |
| Forward port | `<PROXY_PORT>` (must match Docker `-p` mapping) |
| SSL | Let's Encrypt (NPM manages certificates) |

**Do not** point NPM at `jekyll serve` or a Ruby process. The backend must be the `ohmyswift-static` nginx container.

#### NPM vs Docker nginx — common mistakes

| Mistake | Result |
|---------|--------|
| NPM forwards to port 4000 but static container is stopped | **502 Bad Gateway** |
| NPM still points at old `jekyll serve` backend | **502** after Jekyll is killed |
| Static container running but volume not under `/blog` | **404** on `/blog/` |
| Only NPM running, no `ohmyswift-static` container | **502** |

#### Verify through NPM / public URL

```bash
curl -I https://ohmyswift.com/blog/
```

---

### One-time cleanup (if migrating from `jekyll serve`)

As root on the VPS:

```bash
# Stop old Jekyll process — do not restart it
sudo pkill -f "jekyll serve"

# Remove stale root-owned artifacts from old Docker/manual builds
sudo rm -rf <DEPLOY_PATH>/_site
sudo rm -rf <DEPLOY_PATH>/.jekyll-cache
sudo chown -R deploy:www-data <DEPLOY_PATH>
```

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---------|----------------|-----|
| **502 Bad Gateway** | NPM proxies to a dead or wrong backend | Start `ohmyswift-static`; confirm NPM Forward Port matches Docker `-p` |
| **404 on `/blog/`** | Static container volume not mounted under `/blog` | Remount `<DEPLOY_PATH>` → `/usr/share/nginx/html/blog` |
| **502 after killing Jekyll** | NPM still pointed at old `jekyll serve` port | Point NPM to `ohmyswift-static` on `<PROXY_PORT>` |
| **Empty post title on homepage** | Unquoted `:` in YAML `title` | Quote the title string |
| **Post 404, wrong URL** | Slug/title YAML parse issue | Fix front matter; rebuild via push |
| **Actions build OK, deploy fails** | SSH, permissions, or stale root-owned files | Check secrets, port, `authorized_keys`; cleanup `_site` / `.jekyll-cache` |
| **rsync permission denied** | `--delete` cannot remove root-owned old files | Fix ownership or remove stale dirs as root (see below) |
| **rsync `vendor/` delete failed** | Old `bundle install` on VPS left root-owned `vendor/` | As root: `rm -rf <DEPLOY_PATH>/vendor` — never run Bundler in deploy path |
| **Live site stale after push** | Workflow failed or wrong branch | Push to `master`; check Actions log |
| **Container running, NPM OK, still broken** | Test each layer: disk → Docker nginx → NPM | `curl` host port, then public URL |

---

## Local development (optional)

```bash
bundle install
bundle exec jekyll serve
# or
docker compose up
```

Open `http://localhost:4000/blog/`

Local preview is optional — pushing to `master` is enough to publish.

---

## Security rules for agents

- **Never** commit `.env`, SSH private keys, or secret values
- **Never** print or paste GitHub secret values into issues, PRs, or markdown
- **Never** re-enable `jekyll serve` on the production VPS
- **Never** change `baseurl` without understanding URL and nginx mount impact
- Prefer `bundle update <gem>` for Dependabot/CVE fixes; commit `Gemfile.lock`

---

## Key files

| File | Role |
|------|------|
| `_config.yml` | Site URL, `baseurl`, plugins, permalinks |
| `_posts/*.md` | Blog articles |
| `.github/workflows/deploy.yml` | CI build + deploy |
| `scripts/setup-deploy-secrets.sh` | One-time GitHub secrets + key setup |
| `Gemfile` / `Gemfile.lock` | Ruby dependencies |

---

## Git commit identity (this repo)

Use the blog owner identity for commits in this repository:

```bash
git config user.name "Rizwan Ahmed A"
git config user.email "rizwan@ohmyswift.com"
```

(Local repo config only — does not affect other projects.)
