package model.repository;

import model.bean.Contract;

import java.util.List;

public interface ContractRepository {

    List<Contract> showListContracts();

    void insertContract(Contract contract);
}
