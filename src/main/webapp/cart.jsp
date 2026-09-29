<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Cart - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div><a href="home.jsp">Home</a><a href="logout" class="pill-btn">Logout</a></div>
  </div>
  <div class="page-banner">
    <h1>Your Cart</h1>
    <p>Review your items before checkout.</p>
  </div>
  <div class="container">
    <c:set var="total" value="0"/>
    <c:if test="${not empty sessionScope.cart}">
      <table>
        <tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th></th></tr>
        <c:forEach var="item" items="${sessionScope.cart}">
          <tr>
            <td>${item.product.name}</td>
            <td>&#8377; ${item.product.price}</td>
            <td>
              <form action="cart" method="get" style="display:flex;gap:8px;margin:0;">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="productId" value="${item.product.id}">
                <input type="number" name="qty" value="${item.quantity}" min="1" style="width:70px;margin:0;">
                <button type="submit" style="margin:0;padding:10px 16px;font-size:13px;">Update</button>
              </form>
            </td>
            <td>&#8377; ${item.subtotal}</td>
            <td><a href="cart?action=remove&productId=${item.product.id}">Remove</a></td>
          </tr>
          <c:set var="total" value="${total + item.subtotal}"/>
        </c:forEach>
        <tr class="total-row"><td colspan="3">Total</td><td colspan="2">&#8377; ${total}</td></tr>
      </table>
      <a class="btn" href="checkout.jsp">Proceed to Checkout</a>
    </c:if>

    <c:if test="${empty sessionScope.cart}">
      <p>Your cart is empty. <a href="home.jsp">Browse shops</a></p>
    </c:if>
  </div>
</body>
</html>