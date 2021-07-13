package model.service;

import model.bean.Customer;
import model.bean.CustomerType;

import java.util.List;
import java.util.Map;

public interface CustomerService {

    List<Customer> showListCustomers();

    Map<String, String> insertCustomer(Customer customer);

    Customer findCustomerById(int id);

    void updateCustomer(Customer customer);

    void deleteCustomer(int id);

    List<Customer> showListCustomersUseService();

    List<Customer> findCustomerByName(String name);

    List<Customer> findCustomerByNameBirthday(String name, String birthday);

    List<CustomerType> showListCustomerTypes();

}
