
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post" action="/delete">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-primary">Click to Confirm Delete</button>
</form>
<form action="/profile">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-primary">Click to Return to Profile</button>
</form>
</body>
</html>
