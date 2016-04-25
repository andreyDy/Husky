<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

<jsp:include page="/WEB-INF/views/fragments/inner/headerIn.jsp"/>

<body>

<div id="wrapper">

    <jsp:include page="/WEB-INF/views/fragments/inner/navTeacher.jsp"/>

    <div id="page-wrapper">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Courses
                    </h1>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Short description</th>
                                <th>Start date</th>
                                <th>End date</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${courses}" var="course">
                                <tr>
                                    <td><a href="/course/${course.id}"><c:out value="${course.name}"/></a></td>
                                    <td><c:out value="${course.shortDescription}"/></td>
                                    <td><c:out value="${course.startDate}"/></td>
                                    <td><c:out value="${course.endDate}"/></td>
                                    <td>
                                        <a href="/settings/course/edit/${course.id}" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>