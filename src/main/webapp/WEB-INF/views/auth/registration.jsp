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

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>

<section class="title">
    <div class="container">
        <div class="row-fluid">
            <div class="span6">
                <h1>Registration!</h1>
            </div>
        </div>
    </div>
</section>
<!-- / .title -->

<section id="registration-page" class="container">
    <form:form modelAttribute="registrationForm" cssClass="center" action="registration" method="post">
        <fieldset class="registration-form">

            <div class="control-group">
                <!-- First name -->
                <div class="controls">
                    <form:input path="firstName" cssClass="input-xlarge" placeholder="First name" required="required"/>
                </div>
                <form:errors path="firstName" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="control-group">
                <!-- Last name -->
                <div class="controls">
                    <form:input path="lastName" cssClass="input-xlarge" placeholder="Last name" required="required"/>
                </div>
                <form:errors path="lastName" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="control-group">
                <!-- E-mail -->
                <div class="controls">
                    <form:input path="email" cssClass="input-xlarge" placeholder="E-mail" required="required"/>
                </div>
                <form:errors path="email" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="control-group">
                <!-- Password-->
                <div class="controls">
                    <form:password path="password" cssClass="input-xlarge" placeholder="Password" required="required"/>
                </div>
                <form:errors path="password" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <form:button class="btn btn-success btn-large btn-block">Register</form:button>
                </div>
            </div>
        </fieldset>
    </form:form>
</section>
<!-- /#register-page -->

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</body>
</html>
