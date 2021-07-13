package controller;

import model.bean.Employee;
import model.service.EmployeeService;
import model.service.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {

    private EmployeeService employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                showListEmployees(request, response);
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idDegree = Integer.parseInt(request.getParameter("idDegree"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        int salary = Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String userName = request.getParameter("userName");
        String oldUserName = request.getParameter("oldUserName");

        Employee employee = new Employee(id, name, idPosition, idDegree, idDivision, birthday,
                idCard, salary, phone, email, address, userName);
        employeeService.updateEmployee(employee, oldUserName);

        response.sendRedirect("/employee");
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idDegree = Integer.parseInt(request.getParameter("idDegree"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        int salary = Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String userName = request.getParameter("userName");

        Employee employee = new Employee(name, idPosition, idDegree, idDivision, birthday,
                idCard, salary, phone, email, address, userName);

        Map<String, String> mapMessage = employeeService.insertEmployee(employee);
        if (mapMessage.isEmpty()){
            showListEmployees(request, response);
        } else {
            request.setAttribute("messSalary", mapMessage.get("salary"));
            request.setAttribute("employee", employee);
            showNewEmployee(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewEmployee(request, response);
                break;
            case "edit":
                showEditEmployee(request, response);
                break;
            default:
                showListEmployees(request, response);
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        response.sendRedirect("/employee");
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findEmployeeById(id);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showListEmployees(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("employees", employeeService.showListEmployees());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/employee/list.jsp");
        requestDispatcher.forward(request, response);
    }
}
