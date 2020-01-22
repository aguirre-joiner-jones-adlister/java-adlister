<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 1/22/20
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post" action="/ads/delete">
    <input type="text" value="${param.adId}" name="id" hidden>
    <button type="submit" class="btn btn-primary">Click to Confirm Delete</button>
</form>
<form action="/profile">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-primary">Click to Return to Profile</button>
</form>

</body>
</html>
