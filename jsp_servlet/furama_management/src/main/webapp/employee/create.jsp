<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
</head>
<body>
<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h3>Create new employee</h3>
    <form action="/employee" method="post" class="w-50">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idPosition">Position</label>
            <select name="idPosition" id="idPosition">
                <option value="1">Lễ tân</option>
                <option value="2">Phục vụ</option>
                <option value="3">Chuyên viên</option>
                <option value="4">Giám sát</option>
                <option value="5">Quản lý</option>
                <option value="6">Giám đốc</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idDegree">Degree</label>
            <select name="idDegree" id="idDegree">
                <option value="1">Trung cấp</option>
                <option value="2">Cao đẳng</option>
                <option value="3">Đại học</option>
                <option value="4">Sau đại học</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idDivision">Division</label>
            <select name="idDivision" id="idDivision">
                <option value="1">Sale–marketing</option>
                <option value="2">Hành chính</option>
                <option value="3">phục vụ</option>
                <option value="4">Quản lý</option>
            </select>
        </div>

        <div class="form-group">
            <label for="birthday">Birthday (format: YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="birthday" id="birthday" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idCard">ID Card (format: XXX XXX XXX)</label>
            <input type="text" class="form-control" name="idCard" id="idCard" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" class="form-control" name="salary" id="salary" value="${employee.salary}" aria-describedby="salary_desc">
            <c:if test="${messSalary != null}">
                <small id="salary_desc" class="form-text text-danger">${messSalary}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="number" class="form-control" name="phone" id="phone" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" name="address" id="address" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="userName">User Name</label>
            <input type="text" class="form-control" name="userName" id="userName" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Create</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>
