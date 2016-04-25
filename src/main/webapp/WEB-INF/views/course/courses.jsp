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

            <c:forEach items="${courses}" var="course">
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="hovereffect">
                        <%--<img src="/resources/images/user/cover.png" class="img-responsive" alt=""/>--%>
                        <img src="/resources/images/user/${course.name.trim()}.jpg" class="img-responsive" alt=""/>
                        <div class="overlay">
                            <h2>${course.name}</h2>
                            <a class="info" href="/course/${course.id}">${course.shortDescription}</a>
                        </div>
                    </div>
                </div>
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
