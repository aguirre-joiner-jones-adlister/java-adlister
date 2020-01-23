<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="jumbotron jumbotron-fluid m-auto text-center bg-primary">
            <h1 class="center m-auto">Welcome, ${sessionScope.user.username.toUpperCase()}!</h1>
        </div>

        <div class="row p-2">
            <div class="col col-4">
                <img src="<c:out value="${user.avatar}"/>" alt="avatar" class="img-thumbnail rounded" style="height: 100px; width: 100px">
            </div>
            <div class="col col-8">
                <a href="/update" class="btn btn-info" role="button">Update Profile</a>
                <a href="/delete" class="btn btn-warning" role="button">Delete Profile</a>
            </div>
        </div>


    <h2 class="text-primary">Current Ads:</h2>
<c:forEach var="ad" items="${userAds}">
    <div class="card">
        <div class="card-title"><h1>${ad.title}</h1></div>
        <div class="card-body">
        <div class="card-text"><h2>${ad.description}</h2></div>
            <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
            <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>
        </div>
        <c:forEach var="category" items="${ad.categories}">
            <span class="badge badge-pill badge-primary">${category}</span>
        </c:forEach>
    </div>
</c:forEach>
    </div>
</body>
</html>
