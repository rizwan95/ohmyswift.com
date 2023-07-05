---
layout: default
title: Social Media
permalink: /social/

---


<!-- Custom CSS -->
<style>
  .card {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    border-radius: 10px;
    transition: transform 0.5s;
  }
  .card:hover {
    transform: scale(1.05);
  }
  .social-link {
    text-decoration: none;
    color: inherit;
    padding: 5px 10px;
  }
  .social-link:hover {
    color: inherit;
  }
  .card-content {
    padding-top: 10px;
    text-align: center;
  }
  .email {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 100%;
  }
</style>

<div class="container" style="margin-top: 2em;">
  <h1 class="title is-1 has-text-centered">Join Our Social Media Channels</h1>
  <div class="columns is-multiline is-centered">
    <!-- Email -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up">
        <a class="social-link" href="mailto:hey@ohmyswift.com">
          <i class="fas fa-envelope fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Email</h4>
          <p class="email">hey@ohmyswift.com</p>
        </div>
      </div>
    </div>

    <!-- Twitter -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="100">
        <a class="social-link" href="https://twitter.com/ohmyswiftblog/" target="_blank">
          <i class="fab fa-twitter fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Twitter</h4>
          <a class="social-link" href="https://twitter.com/ohmyswiftblog/" target="_blank">@ohmyswiftblog</a>
        </div>
      </div>
    </div>

    <!-- Github -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="200">
        <a class="social-link" href="https://github.com/rizwan95" target="_blank">
          <i class="fab fa-github fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Github</h4>
          <a class="social-link" href="https://github.com/rizwan95" target="_blank">rizwan95</a>
        </div>
      </div>
    </div>

    <!-- Reddit -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="300">
        <a class="social-link" href="https://www.reddit.com/r/ohmyswift/" target="_blank">
          <i class="fab fa-reddit fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Reddit</h4>
          <a class="social-link" href="https://www.reddit.com/r/ohmyswift/" target="_blank">r/ohmyswift</a>
        </div>
      </div>
    </div>

    <!-- Slack -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="400">
        <a class="social-link" href="https://ohmyswift.slack.com" target="_blank">
          <i class="fab fa-slack fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Slack</h4>
          <a class="social-link" href="https://ohmyswift.slack.com" target="_blank">ohmyswift.slack.com</a>
        </div>
      </div>
    </div>

    <!-- Facebook -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="500">
        <a class="social-link" href="https://www.facebook.com/ohmyswift/" target="_blank">
          <i class="fab fa-facebook fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Facebook</h4>
          <a class="social-link" href="https://www.facebook.com/ohmyswift/" target="_blank">ohmyswift</a>
        </div>
      </div>
    </div>
  </div>

  <h1 class="title is-1 has-text-centered">Get in Touch with the Creator</h1>
  <div class="columns is-multiline is-centered">
    <!-- Twitter -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="600">
        <a class="social-link" href="https://twitter.com/rizwanasifahmed/" target="_blank">
          <i class="fab fa-twitter fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Twitter</h4>
          <a class="social-link" href="https://twitter.com/rizwanasifahmed/" target="_blank">@rizwanasifahmed</a>
        </div>
      </div>
    </div>

    <!-- Reddit -->
    <div class="column is-3">
      <div class="card animate__animated animate__fadeIn" data-aos="fade-up" data-aos-delay="700">
        <a class="social-link" href="https://www.reddit.com/user/rizwan95" target="_blank">
          <i class="fab fa-reddit fa-2x"></i>
        </a>
        <div class="card-content">
          <h4 class="title is-4">Reddit</h4>
          <a class="social-link" href="https://www.reddit.com/user/rizwan95" target="_blank">rizwan95</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Custom JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.js"></script>
<script>
  AOS.init();
</script>
