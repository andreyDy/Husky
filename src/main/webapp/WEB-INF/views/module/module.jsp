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
                <div class="col-md-8 col-md-offset-2 module">
                    <div class="module-number-container">
                        <span>Module 1</span>
                    </div>

                    <article>
                        <h2>${module.name}</h2>
                        <hr>
                        <br />
                        ${module.article}
                        <hr>
                    </article>

                    <h2>Video Lectures</h2>
                    <hr>
                    <br />

                    <div class="col-md-12">

                        <c:forEach items="${module.videos}" var="video" varStatus="vs">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Video ${vs.index + 1}</h3>
                                    <span class="pull-right clickable panel-collapsed"><i class="glyphicon glyphicon-chevron-down"></i></span>
                                </div>
                                <div class="panel-body" style="display: none">
                                    <div class="embed-responsive embed-responsive-4by3">
                                        <iframe class="embed-responsive-item" width="" src="//${video.link}"></iframe>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <div class="text-center">
                        <a href="#" class="btn btn-lg btn-success"><span class="glyphicon glyphicon-check"></span> Test 1</a>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $(document).on('click', '.panel-heading span.clickable', function(e){
        var $this = $(this);
        if(!$this.hasClass('panel-collapsed')) {
            $this.parents('.panel').find('.panel-body').slideUp();
            $this.addClass('panel-collapsed');
            $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
        } else {
            $this.parents('.panel').find('.panel-body').slideDown();
            $this.removeClass('panel-collapsed');
            $this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
        }
    })
</script>

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>