<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/4/2021
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <h2 class="mt-2">Customer List</h2>
<%--    <p>--%>
<%--        <a href="/customer?action=create">Create new customer</a>--%>
<%--    </p>--%>
    <div class="form-row">
        <div class="col-md-5">
            <a href="/customer?action=create">Create new customer</a>
        </div>
        <div class="col-md-7">
            <form class="form-inline" action="/customer" method="post">
                <input type="hidden" name="action" value="search">
                <p class="mr-2">Input Birthday</p>
                <input class="form-control mr-sm-2" type="search" name="birthday" placeholder="Search" aria-label="Search">
                <p class="mr-2 ml-5">Input Name</p>
                <input class="form-control mr-sm-2" type="search" name="name" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </div>

    <div>
    <c:if test="${empty customers}">
        <h3>Customer List Empty</h3>
    </c:if>
    <c:if test="${not empty customers}">
        <table id="tableCustomer" class="table table-striped table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Customer Type</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customers}" var="customer">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.code}</td>
                    <td>${customer.idType}</td>
                    <td>${customer.name}</td>
                    <td>${customer.birthday}</td>
                    <td>${customer.gender}</td>
                    <td>${customer.idCard}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>
                        <a class="btn btn-success" href="/customer?action=edit&id=${customer.id}" role="button">Edit</a>
                        <button onclick="deleteCustomer(${customer.id})" type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#modalDel">Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    </div>
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
            <form action="/customer" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="customerDel">
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
    function deleteCustomer(id) {
        document.getElementById("customerDel").value = id;
    }

</script>

<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable ( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>
