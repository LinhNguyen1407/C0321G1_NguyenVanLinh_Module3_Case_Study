package model.repository;

import model.bean.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository{
    private static final String INSERT = "INSERT INTO contract" + "(employee_id, customer_id, " +
            "service_id, contract_start_date, contract_end_date, contract_deposit, contract_total_money) " +
            "VALUES " +
            " (?, ?, ? , ? , ?, ?, ?);";
    private static final String SELECT_ALL= "select * from contract";

    @Override
    public List<Contract> showListContracts() {
        List<Contract> contracts = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("contract_id");
                int idEmployee = resultSet.getInt("employee_id");
                int idCustomer = resultSet.getInt("customer_id");
                int idService = resultSet.getInt("service_id");
                String startDate = resultSet.getString("contract_start_date");
                String endDate = resultSet.getString("contract_end_date");
                Double deposit = resultSet.getDouble("contract_deposit");
                Double totalMoney = resultSet.getDouble("contract_total_money");
                contracts.add(new Contract(id, idEmployee, idCustomer, idService, startDate,
                        endDate, deposit, totalMoney));
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
        return contracts;
    }

    @Override
    public void insertContract(Contract contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT);
            statement.setInt(1, contract.getIdEmployee());
            statement.setInt(2, contract.getIdCustomer());
            statement.setInt(3, contract.getIdService());
            statement.setString(4, contract.getStartDate());
            statement.setString(5, contract.getEndDate());
            statement.setDouble(6, contract.getDeposit());
            statement.setDouble(7, contract.getTotalMoney());
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
