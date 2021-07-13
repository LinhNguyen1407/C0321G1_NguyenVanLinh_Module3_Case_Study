<%--
  Created by IntelliJ IDEA.
  User: LINH NGUYEN
  Date: 7/7/2021
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract Detail</title>
</head>
<body>
<jsp:include page="/layouts/header-menu.jsp"></jsp:include>

<div class="container-fluid">
    <h3>Create new detail contract</h3>
    <form action="/contract-detail" method="post" class="w-50">
        <input type="hidden" name="action" value="create">

        <div class="form-group">
            <label for="idContract">Contract</label>
            <input type="text" class="form-control" name="idContract" id="idContract" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="idService">Attach Service</label>
            <select name="idService" id="idService">
                <option value="1">Massage</option>
                <option value="2">Karaoke</option>
                <option value="3">Food</option>
                <option value="4">Drink</option>
                <option value="5">Car</option>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" class="form-control" name="quantity" id="quantity" aria-describedby="emailHelp">
        </div>

        <button type="submit" class="btn btn-primary">Create</button>
    </form>
</div>

<jsp:include page="/layouts/footer.jsp"></jsp:include>
</body>
</html>

