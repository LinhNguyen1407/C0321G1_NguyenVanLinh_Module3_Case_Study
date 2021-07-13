package model.repository;

import model.bean.Customer;
import model.bean.CustomerType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository{
    private static final String INSERT = "INSERT INTO customer" + "(customer_code, customer_type_id, " +
            "customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, " +
            "customer_email, customer_address) VALUES " +
            " (?, ?, ?, ?, ? , ? , ?, ?, ?);";
    private static final String SELECT_BY_ID = "select * from customer where customer_id = ?";
    private static final String SELECT_ALL= "select * from customer";
    private static final String DELETE = "delete from customer where customer_id = ?;";
    private static final String UPDATE = "update customer set customer_code = ?, customer_type_id = ?, " +
            "customer_name = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?, " +
            "customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;";

    private static final String SELECT_BY_NAME = "select * from customer where customer_name like ?;";

    private static final String SELECT_BY_NAME_BIRTHDAY = "select * from customer where customer_name like ? and year(customer_birthday) < ?;";

    private static final String SELECT_CUS_TYPE= "select * from customer_type";

    @Override 
    public List<Customer> showListCustomers() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String code = resultSet.getString("customer_code");
                int idType = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customers.add(new Customer(id, code, idType, name, birthday, gender, idCard, phone,
                        email, address));
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
        return customers;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT);
            statement.setString(1, customer.getCode());
            statement.setInt(2, customer.getIdType());
            statement.setString(3, customer.getName());
            statement.setString(4, customer.getBirthday());
            statement.setString(5, customer.getGender());
            statement.setString(6, customer.getIdCard());
            statement.setString(7, customer.getPhone());
            statement.setString(8, customer.getEmail());
            statement.setString(9, customer.getAddress());
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
    public Customer findCustomerById(int id) {
        Customer customer = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String code = resultSet.getString("customer_code");
                int idType = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customer = new Customer(id, code, idType, name, birthday, gender, idCard, phone,
                        email, address);
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
        return customer;
    }

    @Override
    public List<Customer> findCustomerByName(String name_in) {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_BY_NAME);
            statement.setString(1, name_in + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String code = resultSet.getString("customer_code");
                int idType = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customers.add(new Customer(id, code, idType, name, birthday, gender, idCard, phone,
                        email, address));
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
        return customers;
    }

    @Override
    public List<Customer> findCustomerByNameBirthday(String name_in, String birthday_in) {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_BY_NAME_BIRTHDAY);
            statement.setString(1, name_in + "%");
            statement.setString(2, birthday_in + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String code = resultSet.getString("customer_code");
                int idType = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                customers.add(new Customer(id, code, idType, name, birthday, gender, idCard, phone,
                        email, address));
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
        return customers;
    }

    @Override
    public List<CustomerType> showListCustomerTypes() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_CUS_TYPE);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");
                customerTypes.add(new CustomerType(id, name));
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
        return customerTypes;
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(UPDATE);
            statement.setString(1, customer.getCode());
            statement.setInt(2, customer.getIdType());
            statement.setString(3, customer.getName());
            statement.setString(4, customer.getBirthday());
            statement.setString(5, customer.getGender());
            statement.setString(6, customer.getIdCard());
            statement.setString(7, customer.getPhone());
            statement.setString(8, customer.getEmail());
            statement.setString(9, customer.getAddress());
            statement.setInt(10, customer.getId());
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
    public void deleteCustomer(int id) {
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

    @Override
    public List<Customer> showListCustomersUseService() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        String query = "{call get_customers()}";
        CallableStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareCall(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                int idContract = resultSet.getInt("contract_id");
                String serviceName = resultSet.getString("service_name");
                int idContractDetail = resultSet.getInt("contract_detail_id");
                String attachServiceName = resultSet.getString("attach_service_name");
                customers.add(new Customer(id, name, idContract, serviceName, idContractDetail, attachServiceName));
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
        return customers;
    }
}
