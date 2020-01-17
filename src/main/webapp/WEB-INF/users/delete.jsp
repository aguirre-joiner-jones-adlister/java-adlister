
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post" action="/delete">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-primary">Really?</button>
</form>
</body>
</html>
