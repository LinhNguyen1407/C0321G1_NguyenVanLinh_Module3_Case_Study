package model.service;

import model.bean.Contract;

import java.util.List;

public interface ContractService {

    List<Contract> showListContracts();

    void insertContract(Contract contract);
}
