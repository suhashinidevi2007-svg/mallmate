package com.mallmate.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.mallmate.dao.DBConnection;
import com.mallmate.model.CartItem;
import com.mallmate.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        double grandTotal = 0;

        if (cart != null && !cart.isEmpty()) {
            String sql = "INSERT INTO orders (user_id, product_id, quantity, total) VALUES (?,?,?,?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                for (CartItem item : cart) {
                    ps.setInt(1, user.getId());
                    ps.setInt(2, item.getProduct().getId());
                    ps.setInt(3, item.getQuantity());
                    ps.setDouble(4, item.getSubtotal());
                    ps.executeUpdate();
                    grandTotal += item.getSubtotal();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            cart.clear();
        }

        request.setAttribute("orderTotal", grandTotal);
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}