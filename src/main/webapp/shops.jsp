<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap,java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
  <title>Shops - MallMate</title>
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
    <h1>Shops</h1>
    <p>Browse by floor or view everything at once.</p>
  </div>
  <div class="container">
    <div class="floor-header">
      <div class="floor-tabs">
        <a href="shops?floor=1" class="${selectedFloor == '1' ? 'active' : ''}">🧴 Floor 1 &mdash; Fashion</a>
        <a href="shops?floor=2" class="${selectedFloor == '2' ? 'active' : ''}">📱 Floor 2 &mdash; Electronics &amp; Books</a>
        <a href="shops?floor=3" class="${selectedFloor == '3' ? 'active' : ''}">🍽️ Floor 3 &mdash; Food &amp; Toys</a>
        <a href="shops" class="${empty selectedFloor ? 'active' : ''}">🏬 All Shops</a>
      </div>
      <div class="floor-count">${shopList.size()} shop(s) found</div>
    </div>

    <div class="grid">
      <c:forEach var="shop" items="${shopList}">
        <div class="card">
          <div class="icon-circle">
            <c:choose>
              <c:when test="${shop.category == 'Clothing'}">👕</c:when>
              <c:when test="${shop.category == 'Footwear'}">👟</c:when>
              <c:when test="${shop.category == 'Electronics'}">📱</c:when>
              <c:when test="${shop.category == 'Books'}">📚</c:when>
              <c:when test="${shop.category == 'Food'}">🍽️</c:when>
              <c:when test="${shop.category == 'Toys'}">🧸</c:when>
              <c:otherwise>🏬</c:otherwise>
            </c:choose>
          </div>
          <div class="badge">${shop.category}</div>
          <h3>${shop.name}</h3>
          <div class="floor-tag">📍 Floor ${shop.floor}</div>
          <p>${shop.description}</p>
          <a class="btn" href="products?shopId=${shop.id}">View Products →</a>
        </div>
      </c:forEach>
    </div>

    <c:if test="${empty shopList}">
      <div class="empty-state">
        <div class="icon">🔍</div>
        <h3>No shops found</h3>
        <p>Try a different floor or search term.</p>
      </div>
    </c:if>
  </div>
</body>
</html>