---
layout: default
title: Social Media
permalink: /social/
---

<!-- Include Font Awesome CDN -->
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  integrity="sha512-pIVP5jLYG5VYZmZmC61A5ivEjkFvBk7EAPKJpe+A5T0iyy/NkEaCOkOREpDf1GqXYGkeTM45lY6xQf3nrd" 
  crossorigin="anonymous" 
  referrerpolicy="no-referrer"
/>

<!-- Custom CSS -->
<style>
  /* Container Styling */
  .container {
    margin: 2em auto;
    padding: 0 1em;
    max-width: 1200px;
  }

  /* Section Titles */
  .section-title {
    font-size: 2rem;
    text-align: center;
    margin-bottom: 1rem;
    position: relative;
  }

  .section-title::after {
    content: '';
    display: block;
    width: 50px;
    height: 3px;
    background-color: #007BFF;
    margin: 0.5rem auto 0;
    border-radius: 2px;
  }

  /* Grid Layout */
  .grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
    justify-content: center;
    max-width: 1200px;
    margin: 0 auto;
  }

  /* Card Styling */
  .card {
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    width: 300px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
  }

  .card:hover {
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
  }

  .card img {
    width: 300px;  /* Fixed width */
    height: 200px; /* Fixed height */
    object-fit: cover;
  }

  .card-content {
    padding: 1em;
  }

  .card-info {
    flex: 1;
    overflow: hidden; /* Prevents content from pushing button out */
    margin-bottom: 1em; /* Add space between content and button */
  }

  .card-title, .card-location, .card-description {
    font-size: 0.95rem;
    color: #555;
    display: flex;
    align-items: flex-start;
    gap: 0.5em;
    margin-bottom: 0.75em;
  }

  .card-title {
    font-size: 1.2rem;
    color: #333;
    font-weight: bold;
  }

  .card-title i, .card-location i, .card-description i {
    font-size: 0.9em; /* Slightly smaller icon */
    margin-top: 0.3em; /* Adjust this value to align with the first line of text */
  }

  .card-description {
    /* Ensure long descriptions don't push the button out */
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* Limit to 3 lines */
    -webkit-box-orient: vertical;
  }

  .learn-more {
    display: inline-block;
    text-decoration: none;
    background-color: #0056b3;
    color: #ffffff;
    padding: 0.5em 1em;
    border-radius: 5px;
    transition: background-color 0.3s;
    align-self: flex-start;
  }

  .learn-more:hover {
    background-color: #003d80;
  }

  .learn-more:visited {
    background-color: #000000;
    color: #ffffff;
  }

  .learn-more:visited:hover {
    background-color: #363666;
  }

  /* Responsive Adjustments */
  @media (max-width: 1200px) {
    .grid {
      grid-template-columns: repeat(2, 1fr);
    }
  }

  @media (max-width: 768px) {
    .grid {
      grid-template-columns: 1fr;
    }
    
    .card {
      width: 300px;
      margin: 0 auto;
    }
  }

  /* Year Title Styling */
  .year-title {
    font-size: 2.5rem;
    color: #0056b3;
    margin: 3rem 0 2rem;
    padding-left: 1rem;
    position: relative;
    font-weight: bold;
    border-left: 6px solid #0056b3;
  }

  .featured-card {
    position: relative;
    border: none;
    background: linear-gradient(135deg, #7B4BFF, #4B9EFF);
    padding: 1px;
    animation: borderGlow 3s ease-in-out infinite;
  }

  .featured-card > .card-content {
    background: white;
    border-radius: 8px;
  }

  .featured-card img {
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
  }

  @keyframes borderGlow {
    0% {
      box-shadow: 0 0 5px rgba(123, 75, 255, 0.3),
                  0 0 15px rgba(75, 158, 255, 0.2);
    }
    50% {
      box-shadow: 0 0 20px rgba(123, 75, 255, 0.5),
                  0 0 30px rgba(75, 158, 255, 0.3);
    }
    100% {
      box-shadow: 0 0 5px rgba(123, 75, 255, 0.3),
                  0 0 15px rgba(75, 158, 255, 0.2);
    }
  }

  .featured-card:hover {
    animation: borderGlow 1.5s ease-in-out infinite;
  }

  .social-links {
    display: flex;
    justify-content: center;
    gap: 1.5rem;
    margin-top: 1.5rem;
  }

  .social-icon {
    color: #333;
    font-size: 1.5rem;
    transition: color 0.3s ease;
  }

  .social-icon:hover {
    color: #007BFF;
  }

  /* Platform-specific colors on hover */
  .fa-twitter:hover {
    color: #1DA1F2;
  }

  .fa-linkedin:hover {
    color: #0077B5;
  }

  .fa-instagram:hover {
    color: #E4405F;
  }

  .fa-mastodon:hover {
    color: #6364FF;
  }

  .fa-reddit:hover {
    color: #FF4500;
  }

  .fa-envelope:hover {
    color: #D44638;
  }
</style>

<div class="container">
  <!-- Who Am I Section -->
  <h1 class="section-title">Let's Connect!</h1>
  <div class="content text-center">
    <p>Hey there! 👋 I'm Rizwan Ahmed, an iOS developer who believes great software is born where code meets creativity. With over 9 years of bringing ideas to life through iOS development, I've discovered my true passion lies not just in coding, but in sharing that knowledge with developers like you.</p>
    <p>You'll find me speaking at international tech conferences and meetups, breaking down complex iOS concepts into digestible insights. My expertise spans across:</p>

    <div style="text-align: left; max-width: 600px; margin: 1.5em auto; padding: 1em; background: #f8f9fa; border-radius: 8px;">
        <ul style="list-style-type: none; padding: 0;">
            <li style="margin: 0.5em 0;">🚀 iOS Development Mastery</li>
            <li style="margin: 0.5em 0;">⚡ SwiftUI & Modern App Architecture</li>
            <li style="margin: 0.5em 0;">🎯 Test-Driven Development</li>
            <li style="margin: 0.5em 0;">♿ Accessibility-First Design</li>
            <li style="margin: 0.5em 0;">🤖 AI Integration in Mobile Apps</li>
            <li style="margin: 0.5em 0;">💡 Design Thinking for Developers</li>
        </ul>
    </div>
    <p>What drives me? Making technology more accessible and empowering developers to create apps that truly make a difference. Whether you're starting your iOS journey or looking to level up your skills, I'm here to help you navigate the path.</p>

    <div style="max-width: 600px; margin: 1.5em auto; padding: 1em; background: #f8f9fa; border-radius: 8px;">
        
        <!-- Option 2: Centered (uncomment this and remove Option 1 if preferred) -->
        <h3 style="color: #0056b3; margin-bottom: 1em; text-align: center;">Let's Collaborate ✨</h3>

        <ul style="list-style-type: none; padding: 0; text-align: left;">
            <li style="margin: 0.5em 0;">🎤 Need a speaker for your tech event?</li>
            <li style="margin: 0.5em 0;">👨‍🏫 Looking to organize a workshop?</li>
            <li style="margin: 0.5em 0;">💭 Have questions about iOS development?</li>
            <li style="margin: 0.5em 0;">🤝 Want to collaborate on a project?</li>
            <li style="margin: 0.5em 0;">Find me around the web:</li>

        </ul>
        
        <div class="social-links" style="margin-top: 1.5em;">
            <a href="mailto:rizwan.ahmed95@gmail.com" title="Email" class="social-icon">
                <i class="fas fa-envelope"></i>
            </a>
            <a href="https://twitter.com/rizwanasifahmed" title="Twitter" class="social-icon" target="_blank">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="https://linkedin.com/in/rizwan95" title="LinkedIn" class="social-icon" target="_blank">
                <i class="fab fa-linkedin"></i>
            </a>
            <a href="https://instagram.com/ohmyswiftblog" title="Instagram" class="social-icon" target="_blank">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="https://mastodon.social/deck/@rizwanahmed" title="Mastodon" class="social-icon" target="_blank">
                <i class="fab fa-mastodon"></i>
            </a>
            <a href="https://reddit.com/user/rizwan95" title="Reddit" class="social-icon" target="_blank">
                <i class="fab fa-reddit"></i>
            </a>
        </div>
    </div>
  </div>

  <!-- Add link to talks page -->
  <div style="text-align: center; margin: 3em 0;">
    <a href="/blog/talks/" style="display: inline-block; padding: 1em 2em; background-color: #0056b3; color: white; text-decoration: none; border-radius: 8px; font-weight: bold; transition: background-color 0.3s;">
      View my Talks & Workshops <i class="fas fa-arrow-right" style="margin-left: 0.5em;"></i>
    </a>
  </div>
</div>

<!-- Custom JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.js"></script>
<script>
  AOS.init({
    duration: 800,
    easing: 'ease-in-out',
    once: true
  });
</script>
