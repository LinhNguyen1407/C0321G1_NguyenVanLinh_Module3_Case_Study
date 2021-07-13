package model.service;

import model.bean.Service;

import java.util.List;

public interface ServiceService {

    List<Service> showListServices();

    void insertService(Service service);

}
