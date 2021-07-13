package model.service;

import model.bean.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {

    List<Employee> showListEmployees();

    Map<String, String> insertEmployee(Employee employee);

    Employee findEmployeeById(int id);

    void updateEmployee(Employee employee, String oldUserName);

    void deleteEmployee(int id);

}
