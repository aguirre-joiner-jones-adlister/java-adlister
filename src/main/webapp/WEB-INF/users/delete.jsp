
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Delete Your Profile" />
</jsp:include>

<html>
<head>
    <title>Delete</title>
    <style>
        body{background-color: #1d7097;
        text-align: center;
        margin-top: 15%;
        background-image: url("https://assets.pcmag.com/media/images/440226-take-it-back.jpg?thumb=y&width=810&height=456");
        background-size: cover;}
        h1{color: #b30d06;
        background-color: rgba(0,0,0,.6);}
    </style>
</head>
<body>
<h1>Are you sure you want to delete your awesome profile?!</h1>
<form method="post" action="/delete">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-danger">Click to Confirm Delete</button>
</form>
<form action="/profile">
    <input type="text" value="${sessionScope.user.id}" name="id" hidden>
    <button type="submit" class="btn btn-success">Click to Return to Profile</button>
</form>
</body>
</html>
