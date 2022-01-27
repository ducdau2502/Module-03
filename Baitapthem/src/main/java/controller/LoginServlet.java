package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("login")) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            if ("admin".equals(id) && "admin".equals(password)) {
                request.setAttribute("login", id);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home");
                requestDispatcher.forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }
}
