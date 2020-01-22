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
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <a href="/update">Update Profile</a>
        <a href="/delete">Delete Profile</a>
    </div>
<c:forEach var="ad" items="${userAds}">
    <div style="border: 2px solid black">
        <h1>title = ${ad.title}</h1>
        <h2>description = ${ad.description}</h2>
        <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
        <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>


        <c:forEach var="category" items="${ad.categories}">
            <p>${category}</p>
        </c:forEach>
    </div>
</c:forEach>
</body>
</html>
