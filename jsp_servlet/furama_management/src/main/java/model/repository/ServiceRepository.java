package model.repository;

import model.bean.Service;

import java.util.List;

public interface ServiceRepository {

    List<Service> showListServices();

    void insertService(Service service);
}
