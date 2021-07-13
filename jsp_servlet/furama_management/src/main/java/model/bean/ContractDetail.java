package model.bean;

public class ContractDetail {
    private int id;
    private int idContract;
    private int idService;
    private int quantity;

    public ContractDetail(int idContract, int idService, int quantity) {
        this.idContract = idContract;
        this.idService = idService;
        this.quantity = quantity;
    }

    public ContractDetail(int id, int idContract, int idService, int quantity) {
        this.id = id;
        this.idContract = idContract;
        this.idService = idService;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdContract() {
        return idContract;
    }

    public void setIdContract(int idContract) {
        this.idContract = idContract;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
