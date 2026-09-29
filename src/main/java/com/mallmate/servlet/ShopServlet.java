package com.mallmate.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.mallmate.dao.DBConnection;
import com.mallmate.model.Shop;

@WebServlet("/shops")
public class ShopServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String floor = request.getParameter("floor");
        String search = request.getParameter("search");
        List<Shop> shopList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM shops WHERE 1=1");
        if (floor != null && !floor.isEmpty()) sql.append(" AND floor=?");
        if (search != null && !search.isEmpty()) sql.append(" AND name LIKE ?");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int idx = 1;
            if (floor != null && !floor.isEmpty()) ps.setInt(idx++, Integer.parseInt(floor));
            if (search != null && !search.isEmpty()) ps.setString(idx++, "%" + search + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Shop s = new Shop();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setFloor(rs.getInt("floor"));
                s.setCategory(rs.getString("category"));
                s.setDescription(rs.getString("description"));
                shopList.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("shopList", shopList);
        request.setAttribute("selectedFloor", floor);
        request.getRequestDispatcher("shops.jsp").forward(request, response);
    }
}