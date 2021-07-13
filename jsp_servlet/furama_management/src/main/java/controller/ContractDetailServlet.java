package controller;

import model.bean.ContractDetail;
import model.service.ContractDetailService;
import model.service.ContractDetailServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contract-detail")
public class ContractDetailServlet extends HttpServlet {

    private ContractDetailService contractDetailService = new ContractDetailServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            insertContractDetail(request, response);
        } else {
            showListContractDetails(request, response);
        }
    }

    private void insertContractDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        int idContract = Integer.parseInt(request.getParameter("idContract"));
        int idService = Integer.parseInt(request.getParameter("idService"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ContractDetail contractDetail = new ContractDetail(idContract, idService, quantity);
        contractDetailService.insertContractDetail(contractDetail);

        response.sendRedirect("/contract-detail");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            showNewContractDetail(request, response);
        } else {
            showListContractDetails(request, response);
        }
    }

    private void showNewContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/contract-detail/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showListContractDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contractDetails", contractDetailService.showListContractDetails());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/contract-detail/list.jsp");
        requestDispatcher.forward(request, response);
    }
}
