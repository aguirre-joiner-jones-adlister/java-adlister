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
                <label for="clothes">Clothes<input type="checkbox" name="category" value="1" id="clothes">
                </label>
                <br>
                <label for="auto">Auto<input type="checkbox" name="category" value="2" id="auto">
                </label>
                <br>
                <label for="children">Childen<input type="checkbox" name="category" value="3" id="children">
                </label>
                <br>
                <label for="pets">Pets<input type="checkbox" name="category" value="4" id="pets">
                </label>
                <label for="home">Home<input type="checkbox" name="category" value="5" id="home">
                </label>
                <label for="misc">Miscellaneous<input type="checkbox" name="category" value="6" id="misc">
                </label>
                <br>
            </label>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
