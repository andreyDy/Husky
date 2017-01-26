<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                    <li><a href="/registration">Sign Up</a></li>
                    <li class="active login">
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
                <h1>Log In</h1>
            </div>
        </div>
    </div>
</section>
<!-- / .title -->

<section id="registration-page" class="container">
    <form class="center" action="login" method="post">
        <fieldset class="registration-form">

            <div class="control-group">
                <!-- E-mail -->
                <div class="controls">
                    <input type="text" id="email" name="email" placeholder="E-mail" class="input-xlarge">
                </div>
            </div>

            <div class="control-group">
                <!-- Password-->
                <div class="controls">
                    <input type="password" id="password" name="password" placeholder="Password" class="input-xlarge">
                </div>

            </div>
            <c:if test="${param.error != null}">
                <p class="alert alert-danger">
                    Invalid username or password.
                </p>
            </c:if>
            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-success btn-large btn-block">Log In</button>
                </div>
            </div>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        </fieldset>
    </form>
</section>


<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</body>
</html>
