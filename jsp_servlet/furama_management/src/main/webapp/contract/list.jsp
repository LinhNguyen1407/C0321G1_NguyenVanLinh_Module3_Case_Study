<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2 class="text-center mt-2">Contract List</h2>
    <p>
        <a href="/contract?action=create">Create new contract</a>
    </p>
    <c:if test="${empty contracts}">
        <h3>Contract List Empty</h3>
    </c:if>

    <c:if test="${not empty contracts}">
        <table id="tableContract" class="table table-striped table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Id Employee</th>
                <th>Id Customer</th>
                <th>Id Service</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Deposit</th>
                <th>Total Money</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contracts}" var="contract">
                <tr>
                    <td>${contract.id}</td>
                    <td>${contract.idEmployee}</td>
                    <td>${contract.idCustomer}</td>
                    <td>${contract.idService}</td>
                    <td>${contract.startDate}</td>
                    <td>${contract.endDate}</td>
                    <td>${contract.deposit}</td>
                    <td>${contract.totalMoney}</td>
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
        $('#tableContract').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>
