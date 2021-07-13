package controller;

import model.bean.Service;
import model.service.ServiceService;
import model.service.ServiceServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {

    private ServiceService serviceService = new ServiceServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            insertService(request, response);
        } else {
            showListServices(request, response);
        }
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        int numFloors = Integer.parseInt(request.getParameter("numFloors"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int idRentType = Integer.parseInt(request.getParameter("idRentType"));
        int idType = Integer.parseInt(request.getParameter("idType"));
        String standardRoom = request.getParameter("standardRoom");
        String descOthers = request.getParameter("descOthers");
        double poorArea = Double.parseDouble(request.getParameter("poorArea"));

        Service service = new Service(code, name, area, numFloors, maxPeople,
                cost, idRentType, idType, standardRoom, descOthers, poorArea);
        serviceService.insertService(service);

        response.sendRedirect("/service");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("create")) {
            showNewService(request, response);
        } else {
            showListServices(request, response);
        }
    }

    private void showNewService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showListServices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("services", serviceService.showListServices());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/service/list.jsp");
        requestDispatcher.forward(request, response);
    }
}
