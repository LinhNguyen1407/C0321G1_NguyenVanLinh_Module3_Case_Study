package controller;

import model.bean.Contract;
import model.service.ContractService;
import model.service.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {

    private ContractService contractService = new ContractServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            insertContract(request, response);
        } else {
            showListContracts(request, response);
        }
    }

    private void insertContract(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        int idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
        int idCustomer = Integer.parseInt(request.getParameter("idCustomer"));
        int idService = Integer.parseInt(request.getParameter("idService"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));

        Contract contract = new Contract(idEmployee, idCustomer, idService, startDate, endDate,
                deposit, totalMoney);
        contractService.insertContract(contract);

        response.sendRedirect("/contract");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            showNewContract(request, response);
        } else {
            showListContracts(request, response);
        }
    }

    private void showNewContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/contract/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showListContracts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contracts", contractService.showListContracts());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/contract/list.jsp");
        requestDispatcher.forward(request, response);
    }
}
