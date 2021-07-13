package controller;

import model.bean.Customer;
import model.service.CustomerService;
import model.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String birthday = request.getParameter("birthday");
        String name = request.getParameter("name");
        request.setAttribute("customers", customerService.findCustomerByNameBirthday(name, birthday));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/search.jsp");
        requestDispatcher.forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        int idType = Integer.parseInt(request.getParameter("idType"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(id, code, idType, name, birthday, gender, idCard, phone,
                email, address);
        customerService.updateCustomer(customer);

        response.sendRedirect("/customer");
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Customer> customers = customerService.showListCustomers();
//        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        for (Customer customer : customers) {
            if (customer.getCode().equals(code)) {
                request.setAttribute("messCode", "Duplicate code");
                showNewCustomer(request,response);
            }
        }
        int idType = Integer.parseInt(request.getParameter("idType"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(code, idType, name, birthday, gender, idCard, phone,
                email, address);
        Map<String, String> mapMessage = customerService.insertCustomer(customer);
        if (mapMessage.isEmpty()){
            showListCustomers(request, response);
        }else {
            request.setAttribute("messCode", mapMessage.get("code"));
            request.setAttribute("messName", mapMessage.get("name"));
//            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messGender", mapMessage.get("gender"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("messAddress", mapMessage.get("address"));
            request.setAttribute("customer", customer);
            showNewCustomer(request,response);
        }

//        customerService.insertCustomer(customer);
//
//        response.sendRedirect("/customer");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
//            case "delete":
//                deleteCustomer(request, response);
//                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        response.sendRedirect("/customer");
    }

//    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Customer customer = customerService.findCustomerById(id);
////        customerService.deleteCustomer(id);
//        List<Customer> newList = customerService.showListCustomers();
//        newList.remove(customer);
//        System.out.println(newList.size());
//        request.setAttribute("customers", newList);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
//        requestDispatcher.forward(request, response);
//    }

//    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Customer customer = customerService.findCustomerById(id);
//        request.setAttribute("customer", customer);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/edit.jsp");
//        dispatcher.forward(request, response);
//    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findCustomerById(id);
        request.setAttribute("customer_edit", customer);
        request.setAttribute("customers", customerService.showListCustomers());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/edit_new.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerTypes", customerService.showListCustomerTypes());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showListCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customers", customerService.showListCustomers());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        requestDispatcher.forward(request, response);
    }
}
