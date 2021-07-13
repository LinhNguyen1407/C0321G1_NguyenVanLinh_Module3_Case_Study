package model.repository;

import model.bean.ContractDetail;

import java.util.List;

public interface ContractDetailRepository {

    List<ContractDetail> showListContractDetails();

    void insertContractDetail(ContractDetail contractDetail);
}
