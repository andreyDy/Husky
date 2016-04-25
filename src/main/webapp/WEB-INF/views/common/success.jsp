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

            <div class="alert alert-success" role="alert">
                <h2>Congratulations! ${msg}</h2>
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