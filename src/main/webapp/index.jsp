<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <style>
        #border {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
        }
        .background {
            background: #efefef;
        }

    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">
    <div class="jumbotron jumbotron-fluid m-auto text-center bg-primary
        d-flex justify-content-center align-items-center"
         style="position: relative; z-index: 1;">
        <img src="/css-amber/img/tree-branches-frame-border-png-clipart-free.png" id="border" alt="">
        <img src="http://pngimg.com/uploads/turkey/turkey_PNG58593.png" alt="logo"
        style="height: 100px; width: 120px">
    </div>
    <%--        carousel--%>
    <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel" style="height: 550px;">
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval="10000">
                <img style="height: 100%; max-width: 100%"
                     src="https://images.unsplash.com/photo-1553451193-d4d44c036555?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1652&q=80"
                     class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block ">
                        <h2 class="text-primary">Classic Books</h2>
                        <p class="text-primary">Disney Legacy Classics</p>
                </div>
            </div>
            <div class="carousel-item" data-interval="2000">
                <img style="height: 100%; max-width: 100%"
                     src="https://images.unsplash.com/photo-1557176595-c6fce4b961e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3290&q=80"
                     class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="text-primary">Jewelry</h2>
                    <p class="text-primary">Free to all Ambers</p>
                </div>
            </div>
            <div class="carousel-item">
                <img style="height: 100%; max-width: 100%"
                     src="https://images.unsplash.com/photo-1474625121024-7595bfbc57ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2255&q=80"
                     class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="text-primary">Homemade Soap</h2>
                    <p class="text-primary">Lady Glitter Sparkles.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <%--        end carousel--%>
    <div class="jumbotron jumbotron-fluid m-auto text-center bg-secondary">
        <a href="/ads" class="btn btn-primary btn-lg">View All Ads</a>
    </div>
    <div class="row d-flex justify-content-around align-items-center">
        <span class="col3 card">
            <div class="card" style="width: 18rem;">
                  <img src="https://images.unsplash.com/photo-1579782191904-17237191de7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Honda Bike</h5>
                    <p class="card-text">The bike is in good condition and runs and rides very well.</p>
                    <a href="/ads" class="btn btn-primary">View Ads</a>
                  </div>
                </div>
        </span>
<%--        hi--%>

        <span class="col3 card">
            <div class="card" style="width: 18rem;">
                  <img src="https://images.unsplash.com/photo-1579741370033-29721093f49c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Coffee Homebrew</h5>
                    <p class="card-text">We Source All Our Coffees, We Are True Coffee HUNTERS</p>
                    <a href="/ads" class="btn btn-primary">View Ads</a>
                  </div>
                </div>
        </span>
        <span class="col3 card" >
            <div class="card" style="width: 18rem;">
                  <img src="https://images.unsplash.com/photo-1579632265767-258d131d2e85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">Converse</h5>
                    <p class="card-text">CONVERSE ALL STAR BABY BLUE & WHITE LO-TOPS SIZE 8</p>
                    <a href="/ads" class="btn btn-primary">View Ads</a>
                  </div>
                </div>
        </span>

    </div>

    <%--        end--%>

</div>
<div class="bg-secondary d-flex justify-content-around align-items-center" style="height: 100px;">
    <a href="/users">Users</a>
    <a href="/register">Register</a>
    <a href="/login">Login</a>
</div>




</body>
</html>
