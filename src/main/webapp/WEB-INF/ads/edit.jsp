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
    <title>Edit</title>
</head>
<body>
<c:if test="${param.alert}">
    <h1>Title and Description Required</h1>
</c:if>
<div class="container">
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
        <label>Categories<br>
            <label for="clothes">Clothes<input type="checkbox" name="category" value="clothes" id="clothes">
            </label>
            <br>
            <label for="auto">Auto<input type="checkbox" name="category" value="auto" id="auto">
            </label>
            <br>
            <label for="children">Childen<input type="checkbox" name="category" value="children" id="children">
            </label>
            <br>
            <label for="pets">Pets<input type="checkbox" name="category" value="pets" id="pets">
            </label>
            <label for="misc">Miscellaneous<input type="checkbox" name="category" value="miscellaneous" id="misc"
                                                 checked>
            </label>
            <label for="home">Home<input type="checkbox" name="category" value="home" id="home">
            </label>
            <br>
        </label>

        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

</body>
</html>
