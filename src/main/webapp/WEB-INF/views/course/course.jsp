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
                        <c:choose>
                            <c:when test="${not empty added}">
                                <a href="/course/${course.id}/learn" class="btn btn-success btn-lg"> Learn </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/course/${course.id}/enroll" class="btn btn-success btn-lg"> Enroll </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-md-9 col-sm-9  user-wrapper">
                    <div class="description">
                        <h3> About the Course</h3>
                        <hr/>
                        ${course.description}
                        <p>
                        <h3> The course includes the following modules: </h3>
                        <hr/>
                        <div class="panel-group" id="accordion">
                            <c:forEach items="${course.modules}" var="module" varStatus="vs">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse${vs.index + 1}">
                                                    ${module.name}
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse${vs.index + 1}" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                                ${module.shortDescription}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!-- COURSE PROFILE END-->

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>
