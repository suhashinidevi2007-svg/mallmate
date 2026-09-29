<%@ page contentType="text/html;charset=UTF-8" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Home - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script src="js/ajax.js"></script>
</head>
<body onload="loadActiveUsers();">
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div>
      <a href="cart.jsp">Cart</a>
      <a href="feedback.jsp">Feedback</a>
      <a href="logout" class="pill-btn">Logout</a>
    </div>
  </div>
  <div class="page-banner">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
    <p>Pick a floor below or search for a shop directly.</p>
  </div>
  <div class="container">
    <div id="statsBox" class="stats-box">Loading stats...</div>

    <h2>Browse by Floor</h2>
    <div class="floor-tabs">
      <a href="shops?floor=1">Floor 1</a>
      <a href="shops?floor=2">Floor 2</a>
      <a href="shops?floor=3">Floor 3</a>
      <a href="shops">All Shops</a>
    </div>

    <form action="shops" method="get">
      <label>Search shops</label>
      <input type="text" name="search" placeholder="e.g. Gadget World">
      <button type="submit">Search</button>
    </form>
  </div>
</body>
</html>