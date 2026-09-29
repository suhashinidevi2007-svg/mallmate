<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Order Confirmed - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div><a href="home.jsp">Home</a></div>
  </div>
  <div class="page-banner">
    <h1>Order Confirmed 🎉</h1>
    <p>Thanks for shopping with MallMate.</p>
  </div>
  <div class="container" style="text-align:center;">
    <h2 class="success" style="display:inline-block;">Order placed successfully!</h2>
    <p style="font-size:19px;margin:14px 0;">Total charged: <strong>&#8377; <%= request.getAttribute("orderTotal") %></strong></p>
    <a class="btn" href="home.jsp">Continue Shopping</a>
  </div>
</body>
</html>