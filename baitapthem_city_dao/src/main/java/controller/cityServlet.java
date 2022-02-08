package controller;

import model.City;
import model.Country;
import service.CityServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "cityServlet", urlPatterns = "/home")
public class cityServlet extends HttpServlet {

    private final CityServiceImpl cityService = new CityServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "all";
        }

        switch (action) {
            case "creatGet":
                creatGet(request, response);
                break;
            case "creatPost":
                creatPost(request, response);
                break;
            case "editGet":
                editGet(request, response);
                break;
            case "editPost":
                editPost(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "all":
            default:
                displayAll(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        cityService.deleteCity(id);

        List<City> cities = cityService.selectAllCities();
        request.setAttribute("listCity", cities);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double popular = Double.parseDouble(request.getParameter("popular"));
        double area = Double.parseDouble(request.getParameter("area"));
        double GDP = Double.parseDouble(request.getParameter("GDP"));
        int country = Integer.parseInt(request.getParameter("country"));

        City city = new City(id, name, popular, area, GDP);

        cityService.updateCity(city, country);
        displayAll(request, response);
    }

    private void creatPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            double popular = Double.parseDouble(request.getParameter("popular"));
            double area = Double.parseDouble(request.getParameter("area"));
            double GDP = Double.parseDouble(request.getParameter("GDP"));
            int country = Integer.parseInt(request.getParameter("country"));
            cityService.insertCity(new City(name, popular, area, GDP), country);
            List<City> cities = cityService.selectAllCities();
            request.setAttribute("listCity", cities);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            String errorMess = "Lỗi rồi! Nhập lại đê";
            request.setAttribute("errorMes", errorMess);
            List<Country> countries = cityService.selectAllCountries();
            request.setAttribute("country", countries);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
            requestDispatcher.forward(request, response);
            System.out.println(e.getMessage());
        }
    }

    private void editGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        City city = cityService.selectCity(id);
        List<Country> countries = cityService.selectAllCountries();
        request.setAttribute("country", countries);
        request.setAttribute("city", city);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void creatGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countries = cityService.selectAllCountries();
        request.setAttribute("country", countries);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       List<City> cities = cityService.selectAllCities();
       request.setAttribute("listCity", cities);
       RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
       requestDispatcher.forward(request, response);
    }

}
