<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/6/2021
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assert/datatables/css/dataTables.bootstrap4.css">
</head>
<body>
<nav class="navbar navbar-light bg-light clearfix border-bottom border-dark">
    <img class="float-left" src="/assert/img/logo.jpg" width="60" height="60" alt="">
    <h2 class="text-center mt-2">WELCOME FURAMA RESORT DANANG</h2>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom border-dark">
    <%--  <a class="navbar-brand" href="#">Navbar</a>--%>
    <%--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
    <%--    <span class="navbar-toggler-icon"></span>--%>
    <%--  </button>--%>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/employee">Employee</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/customer">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/service">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contract">Contract</a>
            </li>
        </ul>
<%--        <form class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        </form>--%>
    </div>
</nav>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.js"></script>
<script src="/assert/jquery/popper.min.js"></script>
<script src="/assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
