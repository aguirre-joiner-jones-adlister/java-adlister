
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Users Index</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/partials/head.jsp" />

    <style>
        #border {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
        }
        .background {
            background: #efefef;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container p-3 text-center" >
    <div class="jumbotron jumbotron-fluid m-auto text-center bg-primary
        d-flex justify-content-center align-items-center"
         style="position: relative; z-index: 1;">
        <img src="/css-amber/img/tree-branches-frame-border-png-clipart-free.png" id="border" alt="">
        <img src="http://pngimg.com/uploads/turkey/turkey_PNG58593.png" alt="logo"
             style="height: 100px; width: 120px">
    </div>

    <h1 class="m-auto">Adlister Users:</h1>
        <div class="row d-flex justify-content-center">
    <c:forEach var="user" items="${users}">

        <div class="col col-5 card mx-3 my-3 ">
            <div class="card-body">
                <div class="card-title text-center">
            <h4 class="bg-primary"><c:out value="${user.username.toUpperCase()}"/></h4>
                </div>
                <div class="row">
                    <div class="col col-4">
            <img src="<c:out value="${user.avatar}"/>" alt="avatar" class="img-thumbnail rounded" style="height: 50px; width: 50px">
                    </div>
                    <div class="col col-7">
                        <c:if test="${sessionScope.user.id eq user.id}">
                            <a href="/update" class="mx-2">Edit Profile</a>
                            <a href="/delete" class="mx-2">Delete Profile</a>
                        </c:if>
                    </div>
                </div>

            </div>
            </div>
    </c:forEach>
        </div>
        </div>

</body>
</html>
