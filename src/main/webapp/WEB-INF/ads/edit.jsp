<%--
  Created by IntelliJ IDEA.
  User: amberjones
  Date: 1/22/20
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit ads" />
    </jsp:include>
    <title>Edit</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container p-5">

    <c:if test="${param.alert}">
        <h1>Title and Description Required</h1>
    </c:if>
    <h1>Edit Profile:</h1>

    <form action="/ads/edit" method="post">
        <input type="text" value="${ad.id}" name="id" hidden>
        <input type="text" value="${ad.userId}" name="userId" hidden>
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" type="text" value="${ad.description}"/>
        </div>
        <h4>Please re-select categories</h4>
        <div class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="clothes" id="clothes">
            <label for="clothes" class="form-check-label">Clothes </label>
        </div>
        <div class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="auto" id="auto">
            <label for="auto" class="form-check-label">Auto</label>
        </div>
        <div class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="children" id="children">
            <label for="children" class="form-check-label">Children</label>
        </div>
        <div class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="pets" id="pets">
            <label for="pets" class="form-check-label">Pets</label>
        </div>
        <div class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="miscellaneous" id="misc"
                       checked>
            <label for="misc" class="form-check-label">Miscellaneous</label>
        </div>
        <div  class="form-group form-check">
                <input type="checkbox" name="category" class="form-check-input"
                       value="home" id="home">
                <label for="home">Home</label>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

</body>
</html>
