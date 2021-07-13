<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service</title>
</head>
<body>
<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h3>Create new service</h3>
    <form action="/service" method="post" class="w-50">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" name="code" id="code" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idRentType">Rent Type</label>
            <select name="idRentType" id="idRentType">
                <option value="1">Năm</option>
                <option value="2">Tháng</option>
                <option value="3">Ngày</option>
                <option value="4">Giờ</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idType">Service Type</label>
            <select name="idType" id="idType">
                <option value="1">Vip</option>
                <option value="2">Standard</option>
            </select>
        </div>

        <div class="form-group">
            <label for="area">Area</label>
            <input type="number" class="form-control" name="area" id="area" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="numFloors">Number of Floors</label>
            <input type="number" class="form-control" name="numFloors" id="numFloors" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="maxPeople">Max People</label>
            <input type="number" class="form-control" name="maxPeople" id="maxPeople" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="cost">Cost</label>
            <input type="number" class="form-control" name="cost" id="cost" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="standardRoom">Standard Room</label>
            <input type="text" class="form-control" name="standardRoom" id="standardRoom" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="descOthers">Description Others</label>
            <input type="text" class="form-control" name="descOthers" id="descOthers" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="poorArea">Poor Area</label>
            <input type="number" class="form-control" name="poorArea" id="poorArea" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Create</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>
