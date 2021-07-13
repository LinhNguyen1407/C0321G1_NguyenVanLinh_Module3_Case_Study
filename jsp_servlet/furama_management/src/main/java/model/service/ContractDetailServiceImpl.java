package model.service;

import model.bean.ContractDetail;
import model.repository.ContractDetailRepository;
import model.repository.ContractDetailRepositoryImpl;

import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService {

    private ContractDetailRepository repository = new ContractDetailRepositoryImpl();

    @Override
    public List<ContractDetail> showListContractDetails() {
        return repository.showListContractDetails();
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) {
        repository.insertContractDetail(contractDetail);
    }
}
