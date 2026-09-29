package com.mallmate.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class VisitCounterFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) { }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String uri = request.getRequestURI();

        // Skip static assets so the counter only increments on real page/servlet hits
        if (uri.matches(".*\\.(css|js|png|jpg|jpeg|gif|ico|php)$")) {
            chain.doFilter(req, res);
            return;
        }

        int visitCount = 0;
        Cookie[] cookies = request.getCookies();
        Cookie visitCookie = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("visitCount".equals(c.getName())) {
                    visitCookie = c;
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        visitCount++;
        Cookie newCookie = new Cookie("visitCount", String.valueOf(visitCount));
        newCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
        newCookie.setPath("/");
        response.addCookie(newCookie);

        request.setAttribute("visitCount", visitCount);
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() { }
}