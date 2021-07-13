package model.repository;

import model.bean.Employee;

import java.util.List;

public interface EmployeeRepository {

    List<Employee> showListEmployees();

    void insertEmployee(Employee employee);

    Employee findEmployeeById(int id);

    void updateEmployee(Employee employee, String oldUserName);

    void deleteEmployee(int id);
}
