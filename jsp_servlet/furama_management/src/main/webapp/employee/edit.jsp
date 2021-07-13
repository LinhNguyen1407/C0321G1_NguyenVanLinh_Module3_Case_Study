<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 9:17 PM
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
    <h3>Update employee</h3>
    <form action="/employee" method="post" class="w-50">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${employee.id}">
        <input type="hidden" name="oldUserName" value="${employee.userName}">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" value="${employee.name}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idPosition">Position</label>
            <select name="idPosition" id="idPosition">
                <option value="1" ${employee.idPosition == 1 ? 'selected': ''}>Lễ tân</option>
                <option value="2" ${employee.idPosition == 2 ? 'selected': ''}>Phục vụ</option>
                <option value="3" ${employee.idPosition == 3 ? 'selected': ''}>Chuyên viên</option>
                <option value="4" ${employee.idPosition == 4 ? 'selected': ''}>Giám sát</option>
                <option value="5" ${employee.idPosition == 5 ? 'selected': ''}>Quản lý</option>
                <option value="6" ${employee.idPosition == 6 ? 'selected': ''}>Giám đốc</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idDegree">Degree</label>
            <select name="idDegree" id="idDegree">
                <option value="1" ${employee.idDegree == 1 ? 'selected': ''}>Trung cấp</option>
                <option value="2" ${employee.idDegree == 2 ? 'selected': ''}>Cao đẳng</option>
                <option value="3" ${employee.idDegree == 3 ? 'selected': ''}>Đại học</option>
                <option value="4" ${employee.idDegree == 4 ? 'selected': ''}>Sau đại học</option>
            </select>
        </div>

        <div class="form-group">
            <label for="idDivision">Division</label>
            <select name="idDivision" id="idDivision">
                <option value="1" ${employee.idDivision == 1 ? 'selected': ''}>Sale–marketing</option>
                <option value="2" ${employee.idDivision == 2 ? 'selected': ''}>Hành chính</option>
                <option value="3" ${employee.idDivision == 3 ? 'selected': ''}>phục vụ</option>
                <option value="4" ${employee.idDivision == 4 ? 'selected': ''}>Quản lý</option>
            </select>
        </div>

        <div class="form-group">
            <label for="birthday">Birthday (format: YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="birthday" id="birthday" value="${employee.birthday}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idCard">ID Card (format: XXX XXX XXX)</label>
            <input type="text" class="form-control" name="idCard" id="idCard" value="${employee.idCard}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" class="form-control" name="salary" id="salary" value="${employee.salary}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="number" class="form-control" name="phone" id="phone" value="${employee.phone}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" value="${employee.email}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" name="address" id="address" value="${employee.address}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="userName">User Name</label>
            <input type="text" class="form-control" name="userName" id="userName" value="${employee.userName}" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>

