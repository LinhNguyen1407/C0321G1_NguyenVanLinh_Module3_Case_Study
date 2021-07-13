<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 4:28 PM
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
    <h2>Create new customer</h2>
    <form action="/customer" method="post" class="w-50">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" name="code" id="code" aria-describedby="code_desc" value="${customer.code}">
            <c:if test="${messCode != null}">
                <small id="code_desc" class="form-text text-danger">${messCode}</small>
            </c:if>
        </div>

<%--        <div class="form-group">--%>
<%--            <label for="idType">Customer Type</label>--%>
<%--            <select name="idType" id="idType">--%>
<%--                <option value="1" ${customer.idType == 1 ? 'selected': ''}>Diamond</option>--%>
<%--                <option value="2" ${customer.idType == 2 ? 'selected': ''}>Platinium</option>--%>
<%--                <option value="3" ${customer.idType == 3 ? 'selected': ''}>Gold</option>--%>
<%--                <option value="4" ${customer.idType == 4 ? 'selected': ''}>Silver</option>--%>
<%--                <option value="5" ${customer.idType == 5 ? 'selected': ''}>Member</option>--%>
<%--            </select>--%>
<%--        </div>--%>

        <div class="form-group">
            <label for="idType">Customer Type</label>
            <select name="idType" id="idType">
                <c:forEach items="${customerTypes}" var="customerType">
                    <option value="${customerType.id}" ${customer.idType == customerType.id ? 'selected': ''}>${customerType.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" aria-describedby="name_desc" value="${customer.name}">
            <c:if test="${messName != null}">
                <small id="name_desc" class="form-text text-danger">${messName}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="birthday">Birthday</label>
            <input type="date" class="form-control" name="birthday" id="birthday" aria-describedby="birthday_desc" value="${customer.birthday}">
<%--            <c:if test="${messBirthday != null}">--%>
<%--                <small id="birthday_desc" class="form-text text-danger">${messBirthday}</small>--%>
<%--            </c:if>--%>
        </div>

        <div class="form-inline">
            <label>Gender  </label>
            <div class="form-check ml-3 mr-3">
                <input type="radio" name="gender" id="male" aria-describedby="gender_desc" value="1" ${customer.gender == 1 ? 'checked': ''}>
                <label for="male">Male</label>
            </div>
            <div class="form-check mr-3">
                <input type="radio" name="gender" id="female" value="0" ${customer.gender == 0 ? 'checked': ''}>
                <label for="female">Female</label>
            </div>
            <c:if test="${messGender != null}">
                <small id="gender_desc" class="form-text text-danger">${messGender}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="idCard">Id Card</label>
            <input type="text" class="form-control" name="idCard" id="idCard" aria-describedby="idCard_desc" value="${customer.idCard}">
            <c:if test="${messIdCard != null}">
                <small id="idCard_desc" class="form-text text-danger">${messIdCard}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="number" class="form-control" name="phone" id="phone" aria-describedby="phone_desc" value="${customer.phone}">
            <c:if test="${messPhone != null}">
                <small id="phone_desc" class="form-text text-danger">${messPhone}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" aria-describedby="email_desc" value="${customer.email}">
            <c:if test="${messEmail != null}">
                <small id="email_desc" class="form-text text-danger">${messEmail}</small>
            </c:if>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" name="address" id="address" aria-describedby="address_desc" value="${customer.address}">
            <c:if test="${messAddress != null}">
                <small id="address_desc" class="form-text text-danger">${messAddress}</small>
            </c:if>
        </div>
        <div class="form-inline">
            <button type="submit" class="btn btn-primary mr-4">Create</button>
            <a class="btn btn-dark" href="/customer" role="button">Back</a>
        </div>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>
