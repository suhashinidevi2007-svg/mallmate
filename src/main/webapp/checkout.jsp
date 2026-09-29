<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Checkout - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div><a href="home.jsp">Home</a></div>
  </div>
  <div class="page-banner">
    <h1>Checkout</h1>
    <p>Confirm your order to complete the purchase.</p>
  </div>
  <div class="container">
    <c:set var="total" value="0"/>
    <table>
      <tr><th>Product</th><th>Qty</th><th>Subtotal</th></tr>
      <c:forEach var="item" items="${sessionScope.cart}">
        <tr>
          <td>${item.product.name}</td>
          <td>${item.quantity}</td>
          <td>&#8377; ${item.subtotal}</td>
        </tr>
        <c:set var="total" value="${total + item.subtotal}"/>
      </c:forEach>
      <tr class="total-row"><td colspan="2">Grand Total</td><td>&#8377; ${total}</td></tr>
    </table>
    <form action="checkout" method="post">
      <button type="submit">Confirm Order</button>
    </form>
  </div>
</body>
</html>