<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Products - MallMate</title>
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
    <div><a href="home.jsp">Home</a><a href="cart.jsp">Cart</a><a href="logout" class="pill-btn">Logout</a></div>
  </div>
  <div class="page-banner">
    <h1>Products</h1>
    <p>Everything available in this shop.</p>
  </div>
  <div class="container">
    <div class="floor-header">
      <a href="javascript:history.back()" class="floor-count">← Back to Shops</a>
      <div class="floor-count">${productList.size()} product(s)</div>
    </div>

    <div class="grid">
      <c:forEach var="p" items="${productList}">
        <div class="card">
          <div class="icon-circle">🛍️</div>
          <h3>${p.name}</h3>
          <p>${p.description}</p>
          <div class="price">&#8377; ${p.price}</div>
          <a class="btn" href="addToCart?productId=${p.id}&qty=1">Add to Cart 🛒</a>
        </div>
      </c:forEach>
    </div>

    <c:if test="${empty productList}">
      <div class="empty-state">
        <div class="icon">📦</div>
        <h3>No products found</h3>
        <p>This shop doesn't have any listed products yet.</p>
      </div>
    </c:if>
  </div>
</body>
</html>