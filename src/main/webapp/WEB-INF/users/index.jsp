
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Users Index</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <h1>Here are all of our users!</h1>

    <c:forEach var="user" items="${users}">
        <div class="col-md-6">
            <h2><c:out value="${user.username}"/></h2>
            <img src="${user.avatar}" alt="avatar" class="img-thumbnail rounded w-25 h-25">
        </div>
    </c:forEach>


</body>
</html>
