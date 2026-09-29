<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
<xsl:template match="/feedbacks">
<html>
<head>
  <title>All Feedback - MallMate</title>
  <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
  <div class="container">
    <h2>Customer Feedback</h2>
    <table class="feedback-table">
      <tr><th>Name</th><th>Email</th><th>Message</th><th>Rating</th></tr>
      <xsl:for-each select="feedback">
        <tr>
          <td><xsl:value-of select="name"/></td>
          <td><xsl:value-of select="email"/></td>
          <td><xsl:value-of select="message"/></td>
          <td><xsl:value-of select="rating"/> / 5</td>
        </tr>
      </xsl:for-each>
    </table>
    <p><a href="home.jsp">Back to Home</a></p>
  </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>