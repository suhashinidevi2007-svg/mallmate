<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login - MallMate</title>
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
    <div><a href="index.jsp">Home</a><a href="register.jsp">Register</a></div>
  </div>
  <div class="page-banner">
    <h1>Welcome Back</h1>
    <p>Log in to continue browsing floors and shops.</p>
  </div>
  <div class="container" style="max-width:480px;">
    <h2>Login</h2>
    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
    <% if ("true".equals(request.getParameter("registered"))) { %>
      <p class="success">Registration successful! Please login.</p>
    <% } %>
    <form action="login" method="post">
      <label>Username</label>
      <input type="text" name="username" required>
      <label>Password</label>
      <input type="password" name="password" required>
      <button type="submit">Login</button>
    </form>
  </div>
</body>
</html>