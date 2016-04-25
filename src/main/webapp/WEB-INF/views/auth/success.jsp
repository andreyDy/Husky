<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/head.jsp"/>

<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>

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