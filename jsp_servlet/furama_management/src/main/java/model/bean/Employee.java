package model.bean;

public class Employee {
    private int id;
    private String name;
    private int idPosition;
    private int idDegree;
    private int idDivision;
    private String birthday;
    private String idCard;
    private int salary;
    private String phone;
    private String email;
    private String address;
    private String userName;

    public Employee(String name, int idPosition, int idDegree, int idDivision, String birthday,
                    String idCard, int salary, String phone, String email, String address,
                    String userName) {
        this.name = name;
        this.idPosition = idPosition;
        this.idDegree = idDegree;
        this.idDivision = idDivision;
        this.birthday = birthday;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
    }

    public Employee(int id, String name, int idPosition, int idDegree, int idDivision,
                    String birthday, String idCard, int salary, String phone, String email,
                    String address, String userName) {
        this.id = id;
        this.name = name;
        this.idPosition = idPosition;
        this.idDegree = idDegree;
        this.idDivision = idDivision;
        this.birthday = birthday;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(int idPosition) {
        this.idPosition = idPosition;
    }

    public int getIdDegree() {
        return idDegree;
    }

    public void setIdDegree(int idDegree) {
        this.idDegree = idDegree;
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
