package model.repository;

import model.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository{
    private static final String INSERT = "INSERT INTO employee" + "(employee_name, position_id, " +
            "education_degree_id, division_id, employee_birthday, employee_id_card, employee_salary, " +
            "employee_phone, employee_email, employee_address, username) VALUES " +
            " (?, ?, ?, ?, ? , ? , ?, ?, ?, ?, ?);";
    private static final String INSERT_USER = "INSERT INTO user VALUES (?, ?);";
    private static final String SELECT_BY_ID = "select * from employee where employee_id = ?;";
    private static final String SELECT_ALL= "select * from employee;";
    private static final String DELETE = "delete from employee where employee_id = ?;";
    private static final String DELETE_USER = "delete from user where username = ?;";
    private static final String UPDATE = "update employee set employee_name = ?, position_id = ?, " +
            "education_degree_id = ?, division_id = ?, employee_birthday = ?, employee_id_card = ?, " +
            "employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, " +
            "username = ? where employee_id = ?;";

    @Override
    public List<Employee> showListEmployees() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                int idPosition = resultSet.getInt("position_id");
                int idDegree = resultSet.getInt("education_degree_id");
                int idDivision= resultSet.getInt("division_id");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                int salary= resultSet.getInt("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                String userName = resultSet.getString("username");
                employees.add(new Employee(id, name, idPosition, idDegree, idDivision, birthday,
                        idCard, salary, phone, email, address, userName));
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
        return employees;
    }

    @Override
    public void insertEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT_USER);
            statement.setString(1, employee.getUserName());
            statement.setString(2, "123456");
            statement.executeUpdate();

            statement = connection.prepareStatement(INSERT);
            statement.setString(1, employee.getName());
            statement.setInt(2, employee.getIdPosition());
            statement.setInt(3, employee.getIdDegree());
            statement.setInt(4, employee.getIdDivision());
            statement.setString(5, employee.getBirthday());
            statement.setString(6, employee.getIdCard());
            statement.setInt(7, employee.getSalary());
            statement.setString(8, employee.getPhone());
            statement.setString(9, employee.getEmail());
            statement.setString(10, employee.getAddress());
            statement.setString(11, employee.getUserName());
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

    @Override
    public Employee findEmployeeById(int id) {
        Employee employee = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("employee_name");
                int idPosition = resultSet.getInt("position_id");
                int idDegree = resultSet.getInt("education_degree_id");
                int idDivision= resultSet.getInt("division_id");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                int salary= resultSet.getInt("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                String userName = resultSet.getString("username");
                employee = new Employee(id, name, idPosition, idDegree, idDivision, birthday,
                        idCard, salary, phone, email, address, userName);

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
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee, String oldUserName) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT_USER);
            statement.setString(1, employee.getUserName());
            statement.setString(2, "123456");
            statement.executeUpdate();

            statement = connection.prepareStatement(UPDATE);
            statement.setString(1, employee.getName());
            statement.setInt(2, employee.getIdPosition());
            statement.setInt(3, employee.getIdDegree());
            statement.setInt(4, employee.getIdDivision());
            statement.setString(5, employee.getBirthday());
            statement.setString(6, employee.getIdCard());
            statement.setInt(7, employee.getSalary());
            statement.setString(8, employee.getPhone());
            statement.setString(9, employee.getEmail());
            statement.setString(10, employee.getAddress());
            statement.setString(11, employee.getUserName());
            statement.setInt(12, employee.getId());
            statement.executeUpdate();

            statement = connection.prepareStatement(DELETE_USER);
            statement.setString(1, oldUserName);
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

    @Override
    public void deleteEmployee(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(DELETE);
            statement.setInt(1, id);
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
