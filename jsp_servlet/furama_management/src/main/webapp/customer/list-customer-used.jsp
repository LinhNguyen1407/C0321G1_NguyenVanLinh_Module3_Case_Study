<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/7/2021
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2 class="text-center mt-2">List Customers Use Service </h2>
    <table id="tableCustomerUsed" class="table table-striped table-bordered">
        <thead class="thead-light">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>ID Contract</th>
            <th>Service Name</th>
            <th>ID Contract Detail</th>
            <th>Attach Service Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.idContract}</td>
                <td>${customer.serviceName}</td>
                <td>${customer.idContractDetail}</td>
                <td>${customer.attachServiceName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#tableCustomerUsed').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>
