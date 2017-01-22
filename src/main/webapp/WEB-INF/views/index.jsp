<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/fragments/head.jsp"/>

<body>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>

<!--Slider-->
<section id="slide-show">
    <div id="slider" class="sl-slider-wrapper">

        <!--Slider Items-->
        <div class="sl-slider">
            <c:forEach items="${courses}" var="course" varStatus="vs" end="2">
                <div class="sl-slide item1" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                    <div class="sl-slide-inner">
                        <div class="container">
                            <img class="pull-right" src="/image/${course.id}" alt="" />
                            <h2>${course.name}</h2>
                            <h3 class="gap">${course.shortDescription}</h3>
                            <a class="btn btn-large btn-transparent" href="/course/${course.id}">Enroll</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!--/Slider Items-->

        <!--Slider Next Prev button-->
        <nav id="nav-arrows" class="nav-arrows">
            <span class="nav-arrow-prev"><i class="icon-angle-left"></i></span>
            <span class="nav-arrow-next"><i class="icon-angle-right"></i></span>
        </nav>
        <!--/Slider Next Prev button-->

    </div>
    <!-- /slider-wrapper -->
</section>
<!--/Slider-->

<section class="main-info">
    <div class="container">
        <div class="row-fluid">
            <div class="span9">
                <h4>More than 1000+ free online courses are available currently !</h4>
            </div>
            <div class="span3">
                <a class="btn btn-success btn-large pull-right" href="registration.html">JOIN NOW</a>
            </div>
        </div>
    </div>
</section>

<!--Services-->
<section id="services">
    <div class="container">
        <div class="center gap">
            <h3>Benefits of Online Learning</h3>
        </div>

        <div class="row-fluid">
            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-thumbs-up-alt icon-medium"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Free</h4>
                        <p>800 free online courses.</p>
                    </div>
                </div>
            </div>

            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-time icon-medium"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Anytime</h4>
                        <p>You can access course materials 24 hours a day, 7 days a week.</p>
                    </div>
                </div>
            </div>

            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-globe icon-medium icon-rounded"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Anywhere</h4>
                        <p>You can attend class anywhere you have Web access.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="gap"></div>

        <div class="row-fluid">
            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-male icon-medium"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">The Best Teachers</h4>
                        <p>The Best Teachers in the World.</p>
                    </div>
                </div>
            </div>

            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-phone icon-medium"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Online support</h4>
                        <p>Live online chat. Our teachers are ready to help.</p>
                    </div>
                </div>
            </div>

            <div class="span4">
                <div class="media">
                    <div class="pull-left">
                        <i class="icon-certificate icon-medium"></i>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Certificate</h4>
                        <p>After completion of the course you can get a certificate (only for some courses).</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!--/Services-->

<section id="recent-works">
    <div class="container">
        <div class="center">
            <h3>Some courses</h3>
            <p class="lead">Look at some courses, which we offer for you</p>
        </div>
        <div class="gap"></div>
        <ul class="gallery col-4">
            <c:forEach items="${courses}" var="course" end="3">
                <li>
                    <div class="preview">
                        <img alt=" " src="/resources/images/user/${course.name.trim()}.jpg">
                        <div class="overlay">
                        </div>
                        <div class="links">
                            <a href="/course/${course.id}"><i class="icon-link"></i></a>
                        </div>
                    </div>
                    <div class="desc">
                        <h5>${course.name}</h5>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>

</section>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</body>
</html>
