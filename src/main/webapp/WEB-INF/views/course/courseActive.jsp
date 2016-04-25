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

            <div class="page-header text-center">
                <h1>${course.name}</h1>
            </div>

            <!-- COURSE PROFILE-->
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="user-wrapper">
                        <%--<img src="/resources/images/user/cover.png" class="img-responsive" />--%>
                        <img src="/resources/images/user/${course.name.trim()}.jpg" class="img-responsive" />
                        <div class="description">
                            <br/>
                            <h5><strong>Teacher</strong></h5>
                            <h5><a href="#">
                                ${course.teacher.firstName} ${course.teacher.lastName}
                            </a></h5>
                            <p><i class="glyphicon glyphicon-envelope"></i>${course.teacher.email}
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-9  user-wrapper">
                    <div class="description">
                        <h3> About the Course</h3>
                        <hr/>
                        ${course.description}
                        <p>
                    </div>
                </div>
            </div>
            <!-- COURSE PROFILE END-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-heading">
                            <span class="module-plan">Curriculum</span>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <c:forEach items="${course.modules}" var="module">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default module-panel">
                            <div class="panel-body">
                                <div class="col-lg-10 text-left">
                                    <div class="module-name">${module.name}</div>
                                </div>
                                <div class="col-lg-2">
                                    <a href="/course/${course.id}/module/${module.id}" class="btn btn-block btn-success">
                                        Learn
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </c:forEach>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>
