package model.repository;

import model.bean.Customer;
import model.bean.CustomerType;

import java.util.List;

public interface CustomerRepository {

    List<Customer> showListCustomers();

    void insertCustomer(Customer customer);

    Customer findCustomerById(int id);

    void updateCustomer(Customer customer);

    void deleteCustomer(int id);

    List<Customer> showListCustomersUseService();

    List<Customer> findCustomerByName(String name);

    List<Customer> findCustomerByNameBirthday(String name, String birthday);

    List<CustomerType> showListCustomerTypes();
}
