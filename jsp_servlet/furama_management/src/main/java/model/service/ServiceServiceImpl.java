package model.service;

import model.bean.Service;
import model.repository.ServiceRepository;
import model.repository.ServiceRepositoryImpl;

import java.util.List;

public class ServiceServiceImpl implements ServiceService {

    private ServiceRepository repository = new ServiceRepositoryImpl();

    @Override
    public List<Service> showListServices() {
        return repository.showListServices();
    }

    @Override
    public void insertService(Service service) {
        repository.insertService(service);
    }
}
