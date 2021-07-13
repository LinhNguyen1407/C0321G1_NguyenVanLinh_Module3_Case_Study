<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/7/2021
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract</title>
</head>
<body>
<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h3>Create new contract</h3>
    <form action="/contract" method="post" class="w-50">
        <input type="hidden" name="action" value="create">

        <div class="form-group">
            <label for="idEmployee">Employee</label>
            <select name="idEmployee" id="idEmployee">
                <option value="1">Trần Thị Ngọc</option>
                <option value="2">Nguyễn Thị An</option>
                <option value="3">Đỗ Thị Thu</option>
                <option value="4">Trần Văn Khánh</option>
                <option value="5">Nguyễn Hùng</option>
                <option value="6">Đỗ Hải</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idCustomer">Customer</label>
            <input type="text" class="form-control" name="idCustomer" id="idCustomer" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idService">Service</label>
            <select name="idService" id="idService">
                <option value="1">Villa01</option>
                <option value="2">House01</option>
                <option value="3">Room01</option>
                <option value="4">Villa02</option>
                <option value="5">House02</option>
                <option value="6">Room02</option>
            </select>
        </div>

        <div class="form-group">
            <label for="startDate">Start Date (format YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="startDate" id="startDate" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="endDate">End Date (format YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="endDate" id="endDate" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="deposit">Deposit</label>
            <input type="number" class="form-control" name="deposit" id="deposit" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="totalMoney">Total Money</label>
            <input type="number" class="form-control" name="totalMoney" id="totalMoney" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Create</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>
