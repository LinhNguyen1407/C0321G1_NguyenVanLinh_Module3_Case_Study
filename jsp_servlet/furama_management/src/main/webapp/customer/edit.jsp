<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
</head>
<body>
<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2>Update customer</h2>
    <form action="/customer" method="post" class="w-50">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${customer.id}">
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" name="code" id="code" value="${customer.code}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idType">Customer Type</label>
            <select name="idType" id="idType">
                <option value="1" ${customer.idType == 1 ? 'selected': ''}>Diamond</option>
                <option value="2" ${customer.idType == 2 ? 'selected': ''}>Platinium</option>
                <option value="3" ${customer.idType == 3 ? 'selected': ''}>Gold</option>
                <option value="4" ${customer.idType == 4 ? 'selected': ''}>Silver</option>
                <option value="5" ${customer.idType == 5 ? 'selected': ''}>Member</option>
            </select>
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" value="${customer.name}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="birthday">Birthday (format: YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="birthday" id="birthday" value="${customer.birthday}" aria-describedby="emailHelp">
        </div>

        <div class="form-inline">
            <label>Gender  </label>
            <div class="form-check ml-3 mr-3">
                <input type="radio" name="gender" id="male" value="1" ${customer.gender == 1 ? 'checked': ''}>
                <label for="male">Male</label>
            </div>
            <div class="form-check mr-3">
                <input type="radio" name="gender" id="female" value="0" ${customer.gender == 0 ? 'checked': ''}>
                <label for="female">Female</label>
            </div>
        </div>

        <div class="form-group">
            <label for="idCard">Id Card</label>
            <input type="text" class="form-control" name="idCard" id="idCard" value="${customer.idCard}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="number" class="form-control" name="phone" id="phone" value="${customer.phone}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" value="${customer.email}" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" name="address" id="address" value="${customer.address}" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>
