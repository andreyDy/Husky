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
                        Edit / ${course.name}
                    </h1>

                </div>
            </div>

            <div class="btn-toolbar">
                <div class="btn-group">
                    <a href="/settings/module/add?courseId=${course.id}" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus"></span> Add Module</a>
                    <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus"></span> Add Test</a>
                </div>
                <div class="btn-group">
                    <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete Module</a>
                    <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete Test</a>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <h2>Modules</h2>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Number of videos</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${course.modules}" var="module" varStatus="vs">
                                <tr>
                                    <td>
                                        <a href="/course/${course.id}/module/${module.id}">${module.name}</a>
                                    </td>
                                    <td>${module.videos.size()}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-6">
                    <h2>Tests</h2>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Maximum score</th>
                                <th>Time</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Basics</td>
                                <td>15</td>
                                <td>30m</td>
                            </tr>
                            <tr>
                                <td>Patterns</td>
                                <td>30</td>
                                <td>120m</td>
                            </tr>
                            <tr>
                                <td>Collections</td>
                                <td>30</td>
                                <td>80m</td>
                            </tr>
                            </tbody>
                        </table>
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