package controller;

import module.Student;
import service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentServlet", urlPatterns = "/home")
public class StudentServlet extends HttpServlet {

    private final StudentService studentService = new StudentService();

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
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createGet":
                createGet(request, response);
                break;
            case "createPost":
                createPost(request, response);
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
            case "search":
                searchStudent(request, response);
                break;
            case "sort":
                sortStudent(request, response);
                break;
            case "displayAll":
            case "login":
            default:
                displayStudent(request, response);
                break;
        }
    }

    private void sortStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = studentService.sortStudent();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }
    private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        ArrayList<Student> students = studentService.searchStudent(searchName);
            request.setAttribute("students", students);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
            requestDispatcher.forward(request, response);
    }


    private void editGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(id);
        if (student != null) {
            request.setAttribute("student", student);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void editPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int updateId = Integer.parseInt(request.getParameter("updateId"));
        String updateName = request.getParameter("updateName");
        int updateAge = Integer.parseInt(request.getParameter("updateAge"));
        String updateAddress = request.getParameter("updateAddress");
        double updateAvgPoint = Double.parseDouble(request.getParameter("updateAvgPoint"));

        Student student = studentService.getStudent(updateId);
        if (student != null) {
            student.setId(updateId);
            student.setName(updateName);
            student.setAge(updateAge);
            student.setAddress(updateAddress);
            student.setAvgPoint(updateAvgPoint);
        }

        int index = -1;
        ArrayList<Student> students = studentService.displayAllStudent();
        for (int i = 0; i < students.size(); i++) {
            assert student != null;
            if (students.get(i).getId() == student.getId()) {
                index = i;
            }
        }
        studentService.editStudent(index, student);
        students = studentService.displayAllStudent();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    public void displayStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = studentService.displayAllStudent();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    public void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }

    public void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        double avgPoint = Double.parseDouble(request.getParameter("avgPoint"));
        studentService.addStudent(new Student(id, name, age, address, avgPoint));
        ArrayList<Student> students = studentService.displayAllStudent();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(id);
        if (student != null) {
            studentService.deleteStudent(student);
        }
        ArrayList<Student> students = studentService.displayAllStudent();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }
}
