
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Users Index</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <h1>Here are all of our users!</h1>

    <c:forEach var="user" items="${users}">

        <div class="col-md-6 card">
            <h2><c:out value="${user.username}"/></h2>
            <img src="<c:out value="${user.avatar}"/>" alt="avatar" class="img-thumbnail rounded" style="height: 50px; width: 50px">
            <c:if test="${sessionScope.user.id eq user.id}">
                <a href="/update">Edit Profile</a>
                <a href="/delete">Delete Profile</a>
            </c:if>
        </div>
    </c:forEach>


</body>
</html>
