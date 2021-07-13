<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2 class="text-center mt-2">Service List</h2>
    <p>
        <a href="/service?action=create">Create new service</a>
    </p>
    <c:if test="${empty services}">
        <h3>Service List Empty</h3>
    </c:if>

    <c:if test="${not empty services}">
        <table id="tableService" class="table table-striped table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Name</th>
                <th>Area</th>
                <th>Number of Floors</th>
                <th>Max People</th>
                <th>Cost</th>
                <th>Rent Type</th>
                <th>Service Type</th>
                <th>Standard Room</th>
                <th>Description Others</th>
                <th>Poor Area</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${services}" var="service">
                <tr>
                    <td>${service.id}</td>
                    <td>${service.code}</td>
                    <td>${service.name}</td>
                    <td>${service.area}</td>
                    <td>${service.numFloors}</td>
                    <td>${service.maxPeople}</td>
                    <td>${service.cost}</td>
                    <td>${service.idRentType}</td>
                    <td>${service.idType}</td>
                    <td>${service.standardRoom}</td>
                    <td>${service.descOthers}</td>
                    <td>${service.poorArea}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#tableService').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>
