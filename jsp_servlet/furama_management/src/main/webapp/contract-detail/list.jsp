<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract Detail</title>
<%--    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">--%>
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2 class="text-center mt-2">Detail Contract List</h2>
    <p>
        <a href="/contract-detail?action=create">Create new detail contract</a>
    </p>
    <c:if test="${empty contractDetails}">
        <h3>Contract List Empty</h3>
    </c:if>

    <c:if test="${not empty contractDetails}">
        <table id="tableContractDetail" class="table table-striped table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Id Contract</th>
                <th>Id Service</th>
                <th>Quantity</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contractDetails}" var="contractDetail">
                <tr>
                    <td>${contractDetail.id}</td>
                    <td>${contractDetail.idContract}</td>
                    <td>${contractDetail.idService}</td>
                    <td>${contractDetail.quantity}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>

<%--<script src="assert/jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="assert/jquery/popper.min.js"></script>--%>
<%--<script src="assert/bootstrap4/js/bootstrap.js"></script>--%>
<script src="/assert/datatables/js/jquery.dataTables.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.js"></script>

<script>
    $(document).ready(function () {
        $('#tableContractDetail').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>


</body>
</html>
