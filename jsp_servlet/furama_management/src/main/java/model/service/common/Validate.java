package model.service.common;

public class Validate {
    public static String validateCustomerCode(String code) {
        String message = null;
        String regex = "^KH-\\d{4}$";
        if (!code.matches(regex)) {
            message = "Not OK. Customer code invalid";
        }
        return message;
    }

    public static String validateServiceCode(String code) {
        String message = null;
        String regex = "^DV-\\d{4}$";
        if (!code.matches(regex)) {
            message = "Not OK. Service code invalid";
        }
        return message;
    }

    public static String validatePhone(String phone) {
        String message = null;
        String regex = "^(09\\d{8})|(\\(84\\)\\+9\\d{8})$";
        if (!phone.matches(regex)) {
            message = "Not OK. Phone invalid";
        }
        return message;
    }

    public static String validateIdCard(String idCard) {
        String message = null;
        String regex = "^\\d{9}$";
        if (!idCard.matches(regex)) {
            message = "Not OK. Id Card invalid";
        }
        return message;
    }

    public static String validateEmail(String email) {
        String message = null;
        String regex = "^[A-Za-z0-9]+@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        if (!email.matches(regex)) {
            message = "Not OK. Email invalid";
        }
        return message;
    }

    public static String validateFilled(String value) {
        String message = null;
        String regex = "^.*[^\\s]+.*$";
        if (value == null || !value.matches(regex)) {
            message = "Not OK. Data invalid";
        }
        return message;
    }

    public static String validateFilled1(String value) {
        String message = null;
//        String regex = "^[^\\s]+.*$";
        if (value.equals("")) {
            message = "Not OK. Data invalid";
        }
        return message;
    }

    public static String validateGender(String value) {
        String message = null;
//        String regex = "^[^\\s]+.*$";
        if (value == null) {
            message = "Not OK. Data invalid";
        }
        return message;
    }

    public static String validateInteger(int value) {
        String message = null;
        if (value <= 0) {
            message = "Not OK. Data invalid";
        }
        return message;
    }

    public static String validateDate(String date) {
        String message = null;
//        String regex = "^\\d{2}/\\d{2}/\\d{4}$";
        if (date == null) {
            message = "Not OK. Birthday code invalid";
        }
        return message;
    }

}
