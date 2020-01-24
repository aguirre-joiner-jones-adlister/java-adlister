<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

    <div class="container p-5">
        <h1>Create Ad:</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group form-check">
                    <input type="checkbox" name="category" value="clothes" id="clothes" class="form-check-input">
                    <label for="clothes" class="form-check-label">Clothes</label>
            </div>
            <div class="form-group form-check">
                    <input type="checkbox" name="category" value="auto" id="auto" class="form-check-input">
                    <label for="auto" class="form-check-label">Auto</label>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" name="category" value="children" id="children" class="form-check-input">
                <label for="children" class="form-check-label">Children</label>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" name="category" value="pets" id="pets" class="form-check-input">
                <label for="pets" class="form-check-label">Pets</label>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" name="category" value="home" id="misc" class="form-check-input">
                <label for="home" class="form-check-label">Home</label>
            </div>
            <div class="form-group form-check">
                    <input type="checkbox" name="category" value="miscellaneous" id="home" class="form-check-input">
                <label for="misc" class="form-check-label">Miscellaneous</label>
            </div>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
