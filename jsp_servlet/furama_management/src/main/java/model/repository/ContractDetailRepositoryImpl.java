package model.repository;

import model.bean.ContractDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository{
    private static final String INSERT = "INSERT INTO contract_detail (contract_id, " +
            "attach_service_id, quantity) VALUES (?, ?, ?);";
    private static final String SELECT_ALL= "select * from contract_detail";

    @Override
    public List<ContractDetail> showListContractDetails() {
        List<ContractDetail> contractDetails = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("contract_detail_id");
                int idContract = resultSet.getInt("contract_id");
                int idService = resultSet.getInt("attach_service_id");
                int quantity = resultSet.getInt("quantity");
                contractDetails.add(new ContractDetail(id, idContract, idService, quantity));
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
        return contractDetails;
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(INSERT);
            statement.setInt(1, contractDetail.getIdContract());
            statement.setInt(2, contractDetail.getIdService());
            statement.setInt(3, contractDetail.getQuantity());
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
