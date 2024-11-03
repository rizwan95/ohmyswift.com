---
layout: default
title: Talks & Workshops
permalink: /talks/
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
    max-width: 1200px;
    padding: 0 20px;
  }

  /* Grid Layout */
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 2em;
    margin-top: 2em;
  }

  /* Card Styling */
  .card {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
  }

  .card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
  }

  .card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
  }

  .card-content {
    padding: 1.5em;
  }

  .card-title {
    margin: 0 0 1em;
    font-size: 1.2em;
    color: #333;
  }

  .card-location {
    margin-bottom: 1em;
    color: #666;
  }

  .card-description {
    color: #666;
    margin-bottom: 1.5em;
    line-height: 1.5;
  }

  /* Icon Styling */
  .fa-map-marker-alt,
  .fa-info-circle {
    margin-right: 0.5em;
    color: #0056b3;
  }

  /* Learn More Link */
  .learn-more {
    display: inline-flex;
    align-items: center;
    color: #0056b3;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
  }

  .learn-more:hover {
    color: #003d82;
  }

  .learn-more i {
    margin-left: 0.5em;
    transition: transform 0.3s ease;
  }

  .learn-more:hover i {
    transform: translateX(3px);
  }

  /* Section Titles */
  .section-title {
    font-size: 1.8rem;
    text-align: center;
    margin-bottom: 1rem;
    position: relative;
    font-weight: 500;
  }

  .section-title::after {
    content: '';
    display: block;
    width: 50px;
    height: 2px;
    background-color: #007BFF;
    margin: 0.5rem auto 0;
    border-radius: 2px;
  }

  /* Learn More Button */
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

  /* Year Title Styling */
  .year-title {
    font-size: 2rem;
    color: #0056b3;
    margin: 2.5rem 0 2rem;
    padding-left: 1rem;
    position: relative;
    font-weight: 500;
    border-left: 4px solid #0056b3;
  }

  /* Card Info Styling */
  .card-info {
    flex: 1;
    overflow: hidden;
    margin-bottom: 1em;
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
    font-size: 0.9em;
    margin-top: 0.3em;
  }

  .card-description {
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
  }

  /* Featured Card Styling */
  .featured-card {
    position: relative;
    border: none;
    background: linear-gradient(135deg, #7B4BFF, #4B9EFF);
    padding: 1px;
    animation: borderGlow 3s ease-in-out infinite; /* Always animate, not just on hover */
  }

  .featured-card > .card-content {
    background: white;
    border-radius: 8px;
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

  /* Remove the hover-specific animation */
  .featured-card:hover {
    /* removed animation property */
    transform: translateY(-5px); /* Keep the lift effect on hover */
  }

  /* Responsive Design */
  @media (max-width: 768px) {
    .grid {
      grid-template-columns: 1fr;
    }
    
    .section-title {
      font-size: 2em;
    }
    
    .year-title {
      font-size: 1.5em;
    }
  }
</style>

<div class="container">
  <!-- Talks & Workshops Section -->
  <h1 class="section-title">Talks & Workshops</h1>

  <!-- Featured Subsection -->
  <h2 class="year-title">Featured</h2>
  <div class="grid">
    <!-- iOSDevUK Conference Talk -->
    <div class="card featured-card">
      <img src="https://media.licdn.com/dms/image/v2/D4D22AQFY9rZ1zZT34A/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1695191821227?e=1733356800&v=beta&t=q73jRNlnCNWQ-7cKgMBx4IsADVE9fKRV8SeziThL1es" alt="iOSDevUK Conference Talk">
      <div class="card-content">
        <h4 class="card-title">
          Making iOS Apps Accessible for Everyone
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          iOSDevUK, Aberystwyth, United Kingdom - 2023
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          International conference talk on implementing accessibility features in iOS applications.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_iosdevuk-iosdevelopment-accessibilitymatters-activity-7110149872355278848-hOIo" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- SwiftUI Talk -->
    <div class="card featured-card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQGgCKz-ZYi0lw/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1723364769725?e=1732752000&v=beta&t=Zrh8m0iETzZMww70bFGXkbohSDK4eRux7JwkSqzYDao" alt="SwiftUI Talk">
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

    <!-- iOS Development Bootcamp Card -->
    <div class="card featured-card">
      <img src="https://media.licdn.com/dms/image/v2/D4D22AQHWYd9y-u_Hbw/feedshare-shrink_1280/feedshare-shrink_1280/0/1696233667609?e=1733356800&v=beta&t=vqBoJBD5HRCq_NHCPbrHQhdjkRV1TPnhbgmBtC3XEjo" alt="iOS Development Bootcamp - VIT">
      <div class="card-content">
        <h4 class="card-title">
          iOS Development & Design Thinking Bootcamp
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          SRM University, Chennai - 2023
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          A two-day iOS Development & Design Thinking workshop.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_humancentereddesign-iosdevelopment-workshop-activity-7114519717976928256-IWgU" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
  </div>

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

    <!-- UI/UX Design Bootcamp -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQEWXxZZMoUDFA/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1727082837052?e=1733356800&v=beta&t=I2iFNwbIxwiziQSF5N6xwrmYXU1NYjQbx_ETCdam5pU" alt="UI/UX Design Bootcamp  - VIT">
      <div class="card-content">
        <h4 class="card-title">
          UI/UX Design Bootcamp 
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          VIT University, Chennai - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           A two day bootcamp on UI/UX Design, Figma, and more!
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_technovit-technovit24-vitchennai-activity-7244044474819989505-Avml" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- iOS Roadmap Talk -->
    <div class="card">
      <img src="https://i3.ytimg.com/vi/NwX6BcQ2fSk/maxresdefault.jpg" alt="iOS Roadmap Talk">
      <div class="card-content">
        <h4 class="card-title">
          How to Get Started with iOS
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          Hitesh Kohli | The Commute (Online) - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          A comprehensive guide to starting your iOS development journey, covering career roadmap, emerging technologies like AR, and essential tips for beginners.
        </div>
        <a class="learn-more" href="https://youtu.be/NwX6BcQ2fSk" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- KPR iOS Bootcamp Card -->
    <div class="card">
      <img src="https://ik.imagekit.io/ogr1ppev3u/OhMySwift/Talks/rizwan_f-1zrNJNn.png?updatedAt=1730546169224" alt="iOS Bootcamp - KPR">
      <div class="card-content">
        <h4 class="card-title">
          iOS Bootcamp - KPR, Coimbatore
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          KPR, Coimbatore - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
           A two day bootcamp on Design Thinking and iOS Development, Swift, SwiftUI, and more!
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_ios-appdevelopment-designthinking-activity-7190993499939311616-qj0c" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- AI Future Card -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D5622AQEwfN6W5I10VA/feedshare-shrink_1280/feedshare-shrink_1280/0/1710401077889?e=1733356800&v=beta&t=pb0Iyzr_KaSmWqKYTe_3QmdlgtKqYcdeCxrHWdwM8Q0" alt="AI - The Future of Software Development">
      <div class="card-content">
        <h4 class="card-title">
          AI - The Future of Software Development
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          VIT University, Chennai - 2024
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          An introduction to AI, its impact on software development, and how to get started with it.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_industryexpert-guestspeaker-zoho-activity-7174100112418160640-B13h" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
  </div>

  <!-- 2023 Section -->
  <h2 class="year-title">2023</h2>
  <div class="grid">
    <!-- iOS Development Bootcamp Card -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D4D22AQHWYd9y-u_Hbw/feedshare-shrink_1280/feedshare-shrink_1280/0/1696233667609?e=1733356800&v=beta&t=vqBoJBD5HRCq_NHCPbrHQhdjkRV1TPnhbgmBtC3XEjo" alt="iOS Development Bootcamp - VIT">
      <div class="card-content">
        <h4 class="card-title">
          iOS Development & Design Thinking Bootcamp
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          SRM University, Chennai - 2023
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
            A two-day iOS Development & Design Thinking workshop.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_humancentereddesign-iosdevelopment-workshop-activity-7114519717976928256-IWgU" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- iOSDevUK Conference Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/D4D22AQFY9rZ1zZT34A/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1695191821227?e=1733356800&v=beta&t=q73jRNlnCNWQ-7cKgMBx4IsADVE9fKRV8SeziThL1es" alt="iOSDevUK Conference Talk">
      <div class="card-content">
        <h4 class="card-title">
          Making iOS Apps Accessible for Everyone
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          iOSDevUK, Aberystwyth, United Kingdom - 2023
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          International conference talk on implementing accessibility features in iOS applications.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_iosdevuk-iosdevelopment-accessibilitymatters-activity-7110149872355278848-hOIo" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- Swift Anytime Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/C4D22AQFC4LlTvxV9Bg/feedshare-shrink_800/feedshare-shrink_800/0/1677058511105?e=1733356800&v=beta&t=4GsnS96NfhsQaIRwHFxUq_JCED35dHOjw5XeS8sknNw" alt="Swift Anytime Accessibility Talk">
      <div class="card-content">
        <h4 class="card-title">
          Developing Accessible iOS Applications
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          Swift Anytime (Online) - 2023
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          A comprehensive session on implementing accessibility in iOS apps.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_iosdevelopment-iosdevelopers-swiftanytime-activity-7034463826494251009-c3q1" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
  </div>

  <!-- 2022 Section -->
  <h2 class="year-title">2022</h2>
  <div class="grid">
    <!-- Mobile App Development Lecture -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/C5622AQE2zjTllTfpOA/feedshare-shrink_1280/feedshare-shrink_1280/0/1669380721660?e=1733356800&v=beta&t=kMD3oMzFQUoc4hhIVxdWsV3ozcOiJv2O8ZgjDOTDsos" alt="Guest Lecture at RMKCET">
      <div class="card-content">
        <h4 class="card-title">
          Guest Lecture on Mobile Application Development
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          RMKCET, Chennai - 2022
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          A session on app development fundamentals and industry practices for engineering students.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/feed/update/urn:li:activity:7001890242181943296" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>

    <!-- Accessibility Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/C4E22AQEvtPXtCApQTA/feedshare-shrink_800/feedshare-shrink_800/0/1664467798836?e=1733356800&v=beta&t=fbpHidr1RwAEN-H3rTRL42nfT6wFI8nqKyMorDghzxQ" alt="Accessibility Talk">
      <div class="card-content">
        <h4 class="card-title">
          Making Apps more Accessible
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          CRED HQ, Bengaluru - 2022
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          A deep dive into iOS accessibility features and their implementation in real-world applications. Focused on creating inclusive experiences for users with different abilities.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_swift-ios-zoho-activity-6981283950941896704-OA3U" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
  </div>

  <!-- 2021 Section -->
  <h2 class="year-title">2021</h2>
  <div class="grid">
    <!-- Core Data Talk -->
    <div class="card">
      <img src="https://media.licdn.com/dms/image/v2/C5622AQGo8DWdmCu6xA/feedshare-shrink_1280/feedshare-shrink_1280/0/1614163682095?e=1733356800&v=beta&t=qq0ZXcy0NmVOmoNjeUepnPQEM6fHNrSCV6W1PZfl380" alt="Core Data Talk at Swift India">
      <div class="card-content">
        <h4 class="card-title">
          Making Core Data Easy and More Interesting
        </h4>
        <div class="card-location">
          <i class="fas fa-map-marker-alt"></i>
          Swift India (Online) - 2021
        </div>
        <div class="card-description">
          <i class="fas fa-info-circle"></i>
          Demystifying Core Data's complexities and transforming it from a dreaded framework to a developer's best friend. Packed with real-world examples and practical tips for efficient data management.
        </div>
        <a class="learn-more" href="https://www.linkedin.com/posts/rizwan95_join-us-at-swift-india-conference-2021-activity-6770296352510357504-2bfk" target="_blank">
          <i class="fas fa-arrow-right"></i> More Info
        </a>
      </div>
    </div>
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