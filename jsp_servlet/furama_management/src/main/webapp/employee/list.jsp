<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Employee</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h2 class="text-center mt-2">Employee List</h2>
    <p>
        <a href="/employee?action=create">Create new employee</a>
    </p>
    <c:if test="${empty employees}">
        <h2>Employee List Empty</h2>
    </c:if>
    <c:if test="${not empty employees}">
        <table id="tableEmployee" class="table table-striped table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Id Position</th>
                <th>Id Degree</th>
                <th>Id Division</th>
                <th>Birthday</th>
                <th>Id Card</th>
                <th>Salary</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>User Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.idPosition}</td>
                    <td>${employee.idDegree}</td>
                    <td>${employee.idDivision}</td>
                    <td>${employee.birthday}</td>
                    <td>${employee.idCard}</td>
                    <td>${employee.salary}</td>
                    <td>${employee.phone}</td>
                    <td>${employee.email}</td>
                    <td>${employee.address}</td>
                    <td>${employee.userName}</td>
                    <td>
                        <a class="btn btn-success" href="/employee?action=edit&id=${employee.id}" role="button">Edit</a>
                        <button onclick="deleteEmployee(${employee.id})" type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#modalDel">Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<div class="modal fade" id="modalDel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="employeeDel">
                <div class="modal-body">
                    Are you sure ??
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancle</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>

<script>
    function deleteEmployee(id) {
        document.getElementById("employeeDel").value = id;
    }
</script>

<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>