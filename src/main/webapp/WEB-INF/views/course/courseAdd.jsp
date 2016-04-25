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
                    <h1 class="page-header">Create course</h1>
                </div>
            </div>
            <div class="row">
                <form:form modelAttribute="courseForm"  action="/settings/course/add" enctype="multipart/form-data" method="post">
                    <div class="col-xs-6 col-md-offset-3">

                        <div class="form-group">
                            <label class="control-label">Course name</label>
                            <form:input path="name" cssClass="form-control" placeholder="Enter course name" required="required"/>
                            <form:errors path="name" cssClass="alert alert-danger" element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Short description</label>
                            <form:input path="shortDescription" cssClass="form-control"  placeholder="Enter short description"  required="required"/>
                            <form:errors path="shortDescription" cssClass="alert alert-danger" element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Description</label>
                            <form:textarea path="description" cssClass="form-control"  placeholder="Enter description"
                                           required="required" style="resize:none" rows="3" id="textarea" maxlength="250"/>
                            <form:errors path="description" cssClass="alert alert-danger" element="div"/>
                            <div id="textarea_feedback"></div>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Cover</label>
                            <input name="cover" type="file" class="form-control" required="required">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Start date</label>
                            <form:input path="startDate" cssClass="form-control" placeholder="dd/MM/yyyy" pattern="\d{1,2}/\d{1,2}/\d{4}" required="required"/>
                            <form:errors path="startDate" cssClass="alert alert-danger" element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">End date</label>
                            <form:input path="endDate" cssClass="form-control" placeholder="dd/MM/yyyy" pattern="\d{1,2}/\d{1,2}/\d{4}" required="required"/>
                            <form:errors path="endDate" cssClass="alert alert-danger" element="div"/>
                        </div>
                        <div class="form-group">
                            <form:button class="btn btn-success btn-lg pull-right">Create course</form:button>
                        </div>
                    </div>
                </form:form>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $(document).ready(function() {
        var text_max = 250;
        $('#textarea_feedback').html(text_max + ' characters remaining');

        $('#textarea').keyup(function() {
            var text_length = $('#textarea').val().length;
            var text_remaining = text_max - text_length;

            $('#textarea_feedback').html(text_remaining + ' characters remaining');
        });
    });
</script>

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>