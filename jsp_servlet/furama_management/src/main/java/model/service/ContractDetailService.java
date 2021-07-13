package model.service;

import model.bean.ContractDetail;

import java.util.List;

public interface ContractDetailService {

    List<ContractDetail> showListContractDetails();

    void insertContractDetail(ContractDetail contractDetail);
}
