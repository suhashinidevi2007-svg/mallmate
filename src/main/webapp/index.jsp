<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<footer class="site-footer">
  <div class="footer-grid">
    <div>
      <div class="footer-brand">Mall<span class="mate">Mate</span></div>
      <p>Your smart companion for exploring, shopping, and navigating the mall with ease.</p>
    </div>
    <div>
      <h4>Explore</h4>
      <a href="home.jsp">Floors</a>
      <a href="shops">Shops</a>
      <a href="cart.jsp">Cart</a>
    </div>
    <div>
      <h4>Account</h4>
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Register</a>
      <a href="feedback.jsp">Feedback</a>
    </div>
    <div>
      <h4>Support</h4>
      <a href="feedback.jsp">Contact Us</a>
      <a href="viewFeedback">Customer Reviews</a>
    </div>
  </div>
  <div class="footer-bottom">
    <span>&copy; 2026 MallMate. All rights reserved.</span>
    <span>Built with JSP, Servlets &amp; MySQL</span>
  </div>
</footer>
<body>
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div>
      <a href="home.jsp">Floors</a>
      <a href="home.jsp">Shops</a>
      <a href="feedback.jsp">Feedback</a>
      <a href="login.jsp" class="pill-btn">Log in</a>
    </div>
  </div>

  <div class="hero">
    <div class="hero-inner">
      <div class="eyebrow">4 floors &middot; 60+ shops &middot; one directory</div>
      <h1>Walk in knowing exactly where to go.</h1>
      <p>MallMate maps every floor of the mall, lets you search shops by name or category, and takes you from browsing to checkout without a single wrong turn.</p>
      <div class="btn-row">
        <a class="btn" href="register.jsp">Browse floors</a>
        <a class="btn btn-outline" href="register.jsp">Create an account</a>
      </div>
    </div>
  </div>

  <div class="stats-strip">
    <div>🧭 <strong>Floor-wise</strong> navigation</div>
    <div>🔍 <strong>Instant</strong> shop search</div>
    <div>🛒 <strong>Cart</strong> &amp; checkout</div>
    <div>⭐ <strong>Verified</strong> feedback</div>
  </div>

  <div class="container">
    <h2>Everything you need before you walk in</h2>
    <div class="grid">
      <div class="card"><h3>🧭 Floor Navigation</h3><p>Explore shops organized floor by floor with instant search.</p></div>
      <div class="card"><h3>🛍️ Product Browsing</h3><p>View products, prices and descriptions for every shop.</p></div>
      <div class="card"><h3>🛒 Cart & Checkout</h3><p>Add items to your cart and check out in a few clicks.</p></div>
      <div class="card"><h3>⭐ Feedback System</h3><p>Share and browse ratings from other shoppers.</p></div>
    </div>
  </div>
</body>
</html>