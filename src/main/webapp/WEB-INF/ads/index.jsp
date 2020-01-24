<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        #ads-header{
        color:#276290;}
        body{background-image: url("https://wallstreetnation.com/wp-content/uploads/2017/01/wsnpic8-11.jpg");
        background-repeat: no-repeat;
        background-size: cover;}
        .card{background-color: rgba(0,0,0,.8);}
        .card-title{background-color: rgba(39, 98, 144, 0.8)
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

    <h1 id="ads-header" class="text-center">Here Are all of our ads!</h1>
<div class="container-fluid text-center row px-0 w-100 m-auto d-flex justify-content-center"
 >

    <c:choose>
        <c:when test="${not empty sessionScope.filtered}">
            <c:forEach var="ad" items="${sessionScope.filtered}">
                <div class="col-sm-3 mx-1 card ad-card text-center mb-3">
                    <h4 class="card-title h-50"><c:out value="${ad.title}"/></h4>
                    <p class="card-body"> <c:out value="${ad.description}"/></p>
                    <div class="d-flex flex-wrap">
                    <c:forEach var="category" items="${ad.categories}">
                        <span class="badge badge-pill badge-info mx-2">${category}</span>
                    </c:forEach>
                    </div>
                    <c:if test="${sessionScope.user.id eq ad.userId}">
                        <a href="/ads/edit?adId=${ad.id}">Edit Ad</a>
                        <a href="/ads/delete?adId=${ad.id}">Delete Ad</a>

                    </c:if>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:forEach var="ad" items="${ads}">
                <div class="col-sm-3 m-1 card ad-card">
                    <h2 class="card-title h-50"><c:out value="${ad.title}"/></h2>
                    <p class="card-body"> <c:out value="${ad.description}"/></p>
                    <div class="d-flex flex-wrap">
                    <c:forEach var="category" items="${ad.categories}">
                        <span class="badge badge-pill badge-info mx-2">${category}</span>
                    </c:forEach>
                    </div>
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
