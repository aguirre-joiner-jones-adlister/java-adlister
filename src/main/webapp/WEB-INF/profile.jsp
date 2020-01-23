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
        <img src="<c:out value="${user.avatar}"/>" alt="avatar" class="img-thumbnail rounded" style="height: 100px; width: 100px">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <a href="/update">Update Profile</a>
        <a href="/delete">Delete Profile</a>
    </div>
    <h2>Here Are Your Current Ads</h2>
<c:forEach var="ad" items="${userAds}">
    <div style="border: 2px solid black">
        <h1>${ad.title}</h1>
        <h2>${ad.description}</h2>
        <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
        <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>


        <c:forEach var="category" items="${ad.categories}">
            <p>${category}</p>
        </c:forEach>
    </div>
</c:forEach>
</body>
</html>
