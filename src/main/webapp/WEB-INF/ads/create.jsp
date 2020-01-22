<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
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
                <label for="home">Miscellaneous<input type="checkbox" name="category" value="miscellaneous" id="misc">
                </label>
                <label for="misc">Home<input type="checkbox" name="category" value="home" id="home">
                </label>
                <br>
            </label>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
