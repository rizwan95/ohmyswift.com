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
    font-style: italic;
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
</style>

<div class="container">
  <!-- Who Am I Section -->
  <h1 class="section-title">Who Am I</h1>
  <div class="content text-center">
    <p>Hello! I'm Rizwan, a passionate developer and speaker in the tech community. I love sharing knowledge and connecting with others.</p>
    <p>You can reach me via <a href="mailto:your-email@example.com">email</a> or connect with me on <a href="your-linkedin-profile" target="_blank">LinkedIn</a>.</p>
  </div>

  <!-- My Talks Section -->
  <h1 class="section-title">My Talks</h1>

  <!-- 2024 Section -->
  <h2 class="year-title">2024</h2>
  <div class="grid">
    <!-- iOS Development Bootcamp -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQF6FewqLDbx0g/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1730484379851?e=1733356800&v=beta&t=DykuXDsqtqFLWitFALrMVS-8tIlr_JpNA3E2zP51s9U" alt="iOS Development Bootcamp">
      <div class="card-content">
        <h4 class="card-title">
          iOS Development Bootcamp
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          SRM Institute of Science and Technology, Chennai - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           Introduction to iOS Development, Swift, SwiftUI, and more!
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_srm-ios-swift-activity-7258177574869073920-5Tkg" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
    <!-- Swift Testing Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQHRLmNXvEWq_w/feedshare-shrink_800/feedshare-shrink_800/0/1729823434562?e=1732752000&v=beta&t=1SFheBGxlX1oHtRuYeal6pbR8TrhZnVGSG7luG3aiWU" alt="Swift Testing Talk">
      <div class="card-content">
        <h4 class="card-title">
          Introduction to Swift Testing
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          Swift Bengaluru (Online) - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           Fundamentals of Swift Testing, TDD, suites, assertions, and much more!
        </div>
        <a class="learn-more" href="https://www.youtube.com/watch?t=2927&v=JjKk8e1_V38&feature=youtu.be" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
    <!-- SwiftUI Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQGgCKz-ZYi0lw/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1723364769725?e=1732752000&v=beta&t=Zrh8m0iETzZMww70bFGXkbohSDK4eRux7JwkSqzYDao" alt="Swift Testing Talk">
      <div class="card-content">
        <h4 class="card-title">
          SwiftUI - Bridging Perception and Reality
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          iOSKetchup2024 - Zomato, New Delhi - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           State of SwiftUI, navigation in SwiftUI, TCA, SwiftUI for designers, and more!
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_iosketchup2024-swiftui-swift-activity-7228315754343849984-9V2f" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
    <!-- AI Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQEWXxZZMoUDFA/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1727082837052?e=1733356800&v=beta&t=I2iFNwbIxwiziQSF5N6xwrmYXU1NYjQbx_ETCdam5pU" alt="AI and its impact on Software Development - VIT">
      <div class="card-content">
        <h4 class="card-title">
          AI and its impact on Software Development - VIT
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          VIT University, Chennai - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           The impact of AI on Software Development, and how to prepare for it!
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_iosketchup2024-swiftui-swift-activity-7228315754343849984-9V2f" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
  </div>

  <!-- 2023 Section -->
  <h2 class="year-title">2023</h2>
  <div class="grid">
    <!-- Add 2023 cards here -->
  </div>

  <!-- Add more years as needed -->
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
