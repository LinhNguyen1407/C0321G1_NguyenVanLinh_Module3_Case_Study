package model.service;

import model.bean.Contract;
import model.repository.ContractRepository;
import model.repository.ContractRepositoryImpl;

import java.util.List;

public class ContractServiceImpl implements ContractService {

    private ContractRepository repository = new ContractRepositoryImpl();

    @Override
    public List<Contract> showListContracts() {
        return repository.showListContracts();
    }

    @Override
    public void insertContract(Contract contract) {
        repository.insertContract(contract);
    }
}
