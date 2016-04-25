<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

<jsp:include page="/WEB-INF/views/fragments/inner/headerIn.jsp"/>

<body>

<div id="wrapper">

    <jsp:include page="/WEB-INF/views/fragments/inner/nav.jsp"/>

    <div id="page-wrapper">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <div style="padding-top: 10px; padding-bottom: 60px;">
                        <h1 class="page-header">${user.firstName} ${user.lastName}</h1>
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="text-center">
                                    <img src="/resources/images/avatar.png" class="avatar img-circle img-thumbnail" alt="avatar">
                                </div>
                            </div>
                            <!-- edit form column -->
                            <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
                                <h3>Personal info</h3>
                                <!-- form -->
                                <form:form commandName="userForm" cssClass="form-horizontal" method="post">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">First name:</label>
                                        <div class="col-lg-8">
                                            <form:input path="firstName" cssClass="form-control"/>
                                            <form:errors path="firstName" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Last name:</label>
                                        <div class="col-lg-8">
                                            <form:input path="lastName" cssClass="form-control"/>
                                            <form:errors path="lastName" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Email:</label>
                                        <div class="col-lg-8">
                                            <span class="form-control">${user.email}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Birth date</label>
                                        <div class="col-lg-8">
                                            <form:input path="birthday" placeholder="dd/MM/yyyy" pattern="\d{1,2}/\d{1,2}/\d{4}" cssClass="form-control"/>
                                            <form:errors path="birthday" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Password:</label>
                                        <div class="col-md-8">
                                            <form:password path="password" cssClass="form-control" showPassword="true"/>
                                            <form:errors path="password" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-md-8">
                                            <form:button class="btn btn-primary">Save Changes</form:button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>