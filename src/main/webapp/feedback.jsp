<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback - MallMate</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script src="js/validate.js"></script>
  <script src="js/ajax.js"></script>
</head>
<body>
  <div class="navbar">
    <strong>Mall<span class="mate">Mate</span></strong>
    <div><a href="home.jsp">Home</a><a href="logout" class="pill-btn">Logout</a></div>
  </div>
  <div class="page-banner">
    <h1>Share Your Feedback</h1>
    <p>Tell us about your experience or browse what others said.</p>
  </div>
  <div class="container">
    <% if (request.getAttribute("success") != null) { %>
      <p class="success"><%= request.getAttribute("success") %></p>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <form name="feedbackForm" action="feedback" method="post" onsubmit="return validateFeedbackForm();">
      <label>Name</label>
      <input type="text" name="name" required>
      <label>Email</label>
      <input type="email" id="fbEmail" name="email" required onblur="checkEmailWithPhp();">
      <span id="emailCheckMsg" style="font-size:14px;"></span>
      <label>Message</label>
      <textarea name="message" rows="4" required></textarea>
      <label>Rating</label>
      <select name="rating">
        <option value="5">5 - Excellent</option>
        <option value="4">4 - Good</option>
        <option value="3">3 - Average</option>
        <option value="2">2 - Poor</option>
        <option value="1">1 - Very Poor</option>
      </select>
      <button type="submit">Submit Feedback</button>
    </form>

    <hr style="margin:32px 0;border:none;border-top:1px solid var(--border);">

    <h3>Search Feedback by Minimum Rating</h3>
    <label>Minimum rating</label>
    <select id="minRating">
      <option value="1">1+</option>
      <option value="2">2+</option>
      <option value="3">3+</option>
      <option value="4">4+</option>
      <option value="5">5</option>
    </select>
    <button type="button" onclick="searchFeedback();">Search</button>
    <div id="feedbackResults" style="margin-top:18px;"></div>

    <p style="margin-top:24px;"><a href="viewFeedback" target="_blank">View all feedback (XSLT rendered)</a></p>
  </div>
</body>
</html>