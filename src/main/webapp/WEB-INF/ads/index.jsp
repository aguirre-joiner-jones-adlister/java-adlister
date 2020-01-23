<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:choose>
        <c:when test="${not empty sessionScope.filtered}">
            <c:forEach var="ad" items="${sessionScope.filtered}">
                <h2>WHEN</h2>
                <div class="col-md-6">
                    <h2><c:out value="${ad.title}"/></h2>
                    <p> <c:out value="${ad.description}"/></p>
                    <c:forEach var="category" items="${ad.categories}">
                        <p> <c:out value="${category}"/></p>
                    </c:forEach>

                    <c:if test="${sessionScope.user.id eq ad.userId}">
                        <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
                        <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>

                    </c:if>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <h2>OTHERWISE</h2>
            <c:forEach var="ad" items="${ads}">
                <div class="col-md-6">
                    <h2><c:out value="${ad.title}"/></h2>
                    <p> <c:out value="${ad.description}"/></p>
                    <c:forEach var="category" items="${ad.categories}">
                        <p> <c:out value="${category}"/></p>
                    </c:forEach>

                        <%--            <p> <c:out value="${ad.categories}"/></p>--%>

                    <c:if test="${sessionScope.user.id eq ad.userId}">
                        <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
                        <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>

                    </c:if>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>


</div>

</body>
</html>
