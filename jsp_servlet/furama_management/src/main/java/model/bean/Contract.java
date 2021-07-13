package model.bean;

public class Contract {
    private int id;
    private int idEmployee;
    private int idCustomer;
    private int idService;
    private String startDate;
    private String endDate;
    private double deposit;
    private double totalMoney;

    public Contract(int idEmployee, int idCustomer, int idService, String startDate, String endDate,
                    double deposit, double totalMoney) {
        this.idEmployee = idEmployee;
        this.idCustomer = idCustomer;
        this.idService = idService;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
    }

    public Contract(int id, int idEmployee, int idCustomer, int idService, String startDate, String endDate,
                    double deposit, double totalMoney) {
        this.id = id;
        this.idEmployee = idEmployee;
        this.idCustomer = idCustomer;
        this.idService = idService;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
}
