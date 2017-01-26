<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/head.jsp"/>

<body>

<header class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a id="logo" class="pull-left" href="/"></a>
            <div class="nav-collapse collapse pull-right">
                <ul class="nav">
                    <li><a href="/">Home</a></li>
                    <li class="active" ><a href="/registration">Sign Up</a></li>
                    <li class="login">
                        <a href="/login"><i class="icon-lock"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="title">
    <div class="container">
        <div class="row-fluid">
            <div class="span6">
                <h1>Registration</h1>
            </div>
        </div>
    </div>
</section>
<!-- / .title -->

<section class="main-info">
    <div class="container">
        <div class="row-fluid">
            <div class="span9">
                <h4>Registration successful !</h4>
            </div>
            <div class="span3">
                <a class="btn btn-success btn-large pull-right" href="/login">Log In</a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</body>
</html>