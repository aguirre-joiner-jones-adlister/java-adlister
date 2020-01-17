
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Users Index</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <h1>Here are all of our users!</h1>

    <c:forEach var="user" items="${users}">

        <div class="col-md-6 card">
            <h2><c:out value="${user.username}"/></h2>
            <img src="${user.avatar}"
                 alt="avatar" class="img-thumbnail rounded" style="height: 50px; width: 50px">
        </div>
    </c:forEach>


</body>
</html>
