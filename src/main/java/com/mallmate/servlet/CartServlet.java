package com.mallmate.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.mallmate.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        String action = request.getParameter("action");
        String productId = request.getParameter("productId");

        if (cart != null && action != null && productId != null) {
            int pid = Integer.parseInt(productId);

            if (action.equals("remove")) {
                cart.removeIf(item -> item.getProduct().getId() == pid);
            } else if (action.equals("update")) {
                int qty = Integer.parseInt(request.getParameter("qty"));
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == pid) {
                        item.setQuantity(qty);
                        break;
                    }
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }
}