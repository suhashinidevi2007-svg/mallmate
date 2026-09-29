package com.mallmate.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.xpath.*;
import org.w3c.dom.*;

@WebServlet("/feedbackSearch")
public class FeedbackSearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String minRating = request.getParameter("minRating");
        if (minRating == null || minRating.isEmpty()) minRating = "1";

        String xmlPath = getServletContext().getRealPath("/data/feedback.xml");
        StringBuilder json = new StringBuilder("[");

        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(new File(xmlPath));

            XPath xpath = XPathFactory.newInstance().newXPath();
            String expr = "//feedback[number(rating) >= " + minRating + "]";
            NodeList nodes = (NodeList) xpath.evaluate(expr, doc, XPathConstants.NODESET);

            for (int i = 0; i < nodes.getLength(); i++) {
                Element el = (Element) nodes.item(i);
                String name = el.getElementsByTagName("name").item(0).getTextContent();
                String message = el.getElementsByTagName("message").item(0).getTextContent();
                String rating = el.getElementsByTagName("rating").item(0).getTextContent();

                if (i > 0) json.append(",");
                json.append("{\"name\":\"").append(escape(name))
                    .append("\",\"message\":\"").append(escape(message))
                    .append("\",\"rating\":\"").append(escape(rating)).append("\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        json.append("]");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }

    private String escape(String s) {
        return s == null ? "" : s.replace("\"", "'").replace("\n", " ");
    }
}
