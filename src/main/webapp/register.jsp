<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script src="js/validate.js"></script>
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
    <div><a href="index.jsp">Home</a><a href="login.jsp">Login</a></div>
  </div>
  <div class="page-banner">
    <h1>Create Your Account</h1>
    <p>Join MallMate to shop, save carts, and leave feedback.</p>
  </div>
  <div class="container" style="max-width:480px;">
    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
    <form name="registerForm" action="register" method="post" onsubmit="return validateRegisterForm();">
      <label>Username</label>
      <input type="text" name="username" required>
      <label>Password</label>
      <input type="password" name="password" required>
      <label>Email</label>
      <input type="email" name="email" required>
      <label>Phone</label>
      <input type="text" name="phone">
      <button type="submit">Register</button>
    </form>
    <p style="margin-top:18px;">Already have an account? <a href="login.jsp">Login here</a></p>
  </div>
</body>
</html>