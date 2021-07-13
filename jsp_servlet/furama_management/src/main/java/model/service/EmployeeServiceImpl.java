package model.service;


import model.bean.Employee;
import model.repository.EmployeeRepository;
import model.repository.EmployeeRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeRepository repository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> showListEmployees() {
        return repository.showListEmployees();
    }

    @Override
    public Map<String, String> insertEmployee(Employee employee) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateInteger(employee.getSalary()) != null) {
            mapMessage.put("salary", Validate.validateInteger(employee.getSalary()));
        } else {
            repository.insertEmployee(employee);
        }
        return mapMessage;
    }

    @Override
    public Employee findEmployeeById(int id) {
        return repository.findEmployeeById(id);
    }

    @Override
    public void updateEmployee(Employee employee, String oldUserName) {
        repository.updateEmployee(employee, oldUserName);
    }

    @Override
    public void deleteEmployee(int id) {
        repository.deleteEmployee(id);
    }
}
