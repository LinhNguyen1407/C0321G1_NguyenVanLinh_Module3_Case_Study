package model.repository;

import model.bean.Customer;
import model.bean.Employee;
import model.bean.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository{
    private static final String INSERT = "INSERT INTO service" + "(service_code, service_name, " +
            "service_area, number_of_floors, service_max_people, service_cost, rent_type_id, " +
            "service_type_id, standard_room, decs_other_convenience, poor_area) VALUES " +
            " (?, ?, ?, ?, ? , ? , ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL= "select * from service";

    @Override
    public List<Service> showListServices() {
        List<Service> services = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("service_id");
                String code = resultSet.getString("service_code");
                String name = resultSet.getString("service_name");
                int area = resultSet.getInt("service_area");
                int numFloors= resultSet.getInt("number_of_floors");
                int maxPeople = resultSet.getInt("service_max_people");
                double cost = resultSet.getDouble("service_cost");
                int idRentType= resultSet.getInt("rent_type_id");
                int idServiceType = resultSet.getInt("service_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String decsOther = resultSet.getString("decs_other_convenience");
                double poorArea = resultSet.getDouble("poor_area");
                services.add(new Service(id, code, name, area, numFloors, maxPeople,
                        cost, idRentType, idServiceType, standardRoom, decsOther, poorArea));

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            DBConnection.close();
        }
        return services;
    }

    @Override
    public void insertService(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT);
            statement.setString(1, service.getCode());
            statement.setString(2, service.getName());
            statement.setInt(3, service.getArea());
            statement.setInt(4, service.getNumFloors());
            statement.setInt(5, service.getMaxPeople());
            statement.setDouble(6, service.getCost());
            statement.setInt(7, service.getIdRentType());
            statement.setInt(8, service.getIdType());
            statement.setString(9, service.getStandardRoom());
            statement.setString(10, service.getDescOthers());
            statement.setDouble(11, service.getPoorArea());
            statement.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            DBConnection.close();
        }
    }
}
