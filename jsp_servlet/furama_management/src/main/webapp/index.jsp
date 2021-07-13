<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/3/2021
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furama Management</title>
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
</head>
<body>

<%--<nav class="navbar navbar-light bg-light clearfix border-bottom border-dark">--%>
<%--    <img class="float-left" src="/assert/img/logo.jpg" width="80" height="80" alt="">--%>
<%--    <h2 class="text-center mt-3">WELCOME FURAMA RESORT DANANG</h2>--%>
<%--</nav>--%>

<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<%--<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom border-dark">--%>
<%--    &lt;%&ndash;  <a class="navbar-brand" href="#">Navbar</a>&ndash;%&gt;--%>
<%--    &lt;%&ndash;  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <span class="navbar-toggler-icon"></span>&ndash;%&gt;--%>
<%--    &lt;%&ndash;  </button>&ndash;%&gt;--%>

<%--    <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--        <ul class="navbar-nav mr-auto">--%>
<%--            <li class="nav-item active">--%>
<%--                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Employee</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Customer</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Service</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Contract</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <form class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="row">--%>
<%--    <div class="col-md-2">--%>
<%--        <ul class="list-group">--%>
<%--            <li class="list-group-item">An item</li>--%>
<%--            <li class="list-group-item">A second item</li>--%>
<%--            <li class="list-group-item">A third item</li>--%>
<%--            <li class="list-group-item">A fourth item</li>--%>
<%--            <li class="list-group-item">And a fifth one</li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--    <div class="col-md-10"></div>--%>
<%--</div>--%>

<jsp:include page="/layouts/sidebar.jsp"></jsp:include>

<%--<footer class="page-footer font-small bg-dark fixed-bottom">--%>
<%--    <div class="footer-copyright text-center py-3 text-white">© 2021 Edit by NVL--%>
<%--    </div>--%>
<%--</footer>--%>

<jsp:include page="/layouts/footer.jsp"></jsp:include>

<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
