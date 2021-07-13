package model.service;

import model.bean.Customer;
import model.bean.CustomerType;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {

    private CustomerRepository repository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> showListCustomers() {
        return repository.showListCustomers();
    }

    @Override
    public Map<String, String> insertCustomer(Customer customer) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateCustomerCode(customer.getCode()) != null
                || Validate.validateFilled(customer.getName()) != null
//                || Validate.validateDate(customer.getBirthday()) != null
                || Validate.validateFilled(customer.getGender()) != null
                || Validate.validatePhone(customer.getPhone()) != null
                || Validate.validateIdCard(customer.getIdCard()) != null
                || Validate.validateEmail(customer.getEmail()) != null
                || Validate.validateFilled(customer.getAddress()) != null) {
            mapMessage.put("code", Validate.validateCustomerCode(customer.getCode()));
            mapMessage.put("name", Validate.validateFilled(customer.getName()));
//            mapMessage.put("birthday", Validate.validateDate(customer.getBirthday()));
            mapMessage.put("gender", Validate.validateFilled(customer.getGender()));
            mapMessage.put("phone", Validate.validatePhone(customer.getPhone()));
            mapMessage.put("idCard", Validate.validateIdCard(customer.getIdCard()));
            mapMessage.put("email", Validate.validateEmail(customer.getEmail()));
            mapMessage.put("address", Validate.validateFilled(customer.getAddress()));
        } else {
            repository.insertCustomer(customer);
        }
        return mapMessage;
    }

    @Override
    public Customer findCustomerById(int id) {
        return repository.findCustomerById(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        repository.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        repository.deleteCustomer(id);
    }

    @Override
    public List<Customer> showListCustomersUseService() {
        return repository.showListCustomersUseService();
    }

    @Override
    public List<Customer> findCustomerByName(String name) {
        return repository.findCustomerByName(name);
    }

    @Override
    public List<Customer> findCustomerByNameBirthday(String name, String birthday) {
        return repository.findCustomerByNameBirthday(name, birthday);
    }

    @Override
    public List<CustomerType> showListCustomerTypes() {
        return repository.showListCustomerTypes();
    }
}
