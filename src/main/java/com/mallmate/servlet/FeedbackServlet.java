package com.mallmate.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        String rating = request.getParameter("rating");

        String xmlPath = getServletContext().getRealPath("/data/feedback.xml");

        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(new File(xmlPath));

            Element root = doc.getDocumentElement();

            Element feedback = doc.createElement("feedback");

            Element nameEl = doc.createElement("name");
            nameEl.setTextContent(name);
            Element emailEl = doc.createElement("email");
            emailEl.setTextContent(email);
            Element msgEl = doc.createElement("message");
            msgEl.setTextContent(message);
            Element ratingEl = doc.createElement("rating");
            ratingEl.setTextContent(rating);

            feedback.appendChild(nameEl);
            feedback.appendChild(emailEl);
            feedback.appendChild(msgEl);
            feedback.appendChild(ratingEl);
            root.appendChild(feedback);

            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(new DOMSource(doc), new StreamResult(new File(xmlPath)));

            request.setAttribute("success", "Thank you for your feedback!");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not save feedback: " + e.getMessage());
        }

        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }
}
