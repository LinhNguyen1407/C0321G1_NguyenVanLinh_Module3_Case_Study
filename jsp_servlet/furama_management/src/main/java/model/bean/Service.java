package model.bean;

public class Service {
    private int id;
    private String code;
    private String name;
    private int area;
    private int numFloors;
    private int maxPeople;
    private double cost;
    private int idRentType;
    private int idType;
    private String standardRoom;
    private String descOthers;
    private double poorArea;

    public Service(String code, String name, int area, int numFloors, int maxPeople, double cost,
                   int idRentType, int idType, String standardRoom, String descOthers,
                   double poorArea) {
        this.code = code;
        this.name = name;
        this.area = area;
        this.numFloors = numFloors;
        this.maxPeople = maxPeople;
        this.cost = cost;
        this.idRentType = idRentType;
        this.idType = idType;
        this.standardRoom = standardRoom;
        this.descOthers = descOthers;
        this.poorArea = poorArea;
    }

    public Service(int id, String code, String name, int area, int numFloors, int maxPeople, double cost,
                   int idRentType, int idType, String standardRoom, String descOthers, double poorArea) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.area = area;
        this.numFloors = numFloors;
        this.maxPeople = maxPeople;
        this.cost = cost;
        this.idRentType = idRentType;
        this.idType = idType;
        this.standardRoom = standardRoom;
        this.descOthers = descOthers;
        this.poorArea = poorArea;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getNumFloors() {
        return numFloors;
    }

    public void setNumFloors(int numFloors) {
        this.numFloors = numFloors;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getIdRentType() {
        return idRentType;
    }

    public void setIdRentType(int idRentType) {
        this.idRentType = idRentType;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescOthers() {
        return descOthers;
    }

    public void setDescOthers(String descOthers) {
        this.descOthers = descOthers;
    }

    public double getPoorArea() {
        return poorArea;
    }

    public void setPoorArea(double poorArea) {
        this.poorArea = poorArea;
    }
}
