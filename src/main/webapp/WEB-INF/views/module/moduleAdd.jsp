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
                    <h1 class="page-header">Add module</h1>
                </div>
            </div>

            <div class="btn-toolbar">
                <div class="btn-group">
                    <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus"></span> Add Module</a>
                    <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus"></span> Add Test</a>
                </div>
                <div class="btn-group">
                    <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete Module</a>
                    <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete Test</a>
                </div>
            </div>

            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">

                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-list-alt"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-facetime-video"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="controls">
                            <form:form modelAttribute="moduleForm" role="form"  action="/settings/module/add?courseId=${courseId}" method="post" autocomplete="off">
                                <div class="tab-content">
                                    <div class="tab-pane active" role="tabpanel" id="step1">
                                        <div class="step1">
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-2">
                                                    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
                                                    <div class="form-group">
                                                        <label class="control-label">Name</label>
                                                        <form:input path="name" cssClass="form-control" placeholder="Name" required="required"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Short description</label>
                                                        <form:input path="shortDescription" cssClass="form-control" placeholder="Short description" required="required"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Article</label>
                                                        <form:textarea path="article" cssClass="form-control" placeholder="Article" required="required" cssStyle="resize:none" rows="10"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="list-inline pull-right">
                                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane" role="tabpanel" id="step2">
                                        <div class="step2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h2 class="text-center">
                                                        Add your video lectures or just useful videos from Youtube
                                                    </h2>
                                                </div>
                                                <div class="entry input-group">
                                                    <div class="col-md-4 col-md-offset-4">
                                                        <form:input path="links" cssClass="form-control link-form" placeholder="Link" required="required"/>
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-success btn-add" type="button">
                                                                <span class="glyphicon glyphicon-plus"></span>
                                                            </button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="list-inline pull-right">
                                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                            <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                        </ul>
                                    </div>

                                    <div class="tab-pane" role="tabpanel" id="complete">
                                        <div class="step44">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h2 class="text-center">Ok, that's all</h2>
                                                </div>
                                                <div class="col-md-2 col-md-offset-5">
                                                    <form:button class="btn btn-lg btn-success">Create module</form:button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </section>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $(document).ready(function () {
        //Initialize tooltips
        $('.nav-tabs > li a[title]').tooltip();

        //Wizard
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

            var $target = $(e.target);

            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

        $(".next-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

        });
        $(".prev-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);

        });
    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }
    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }


    //according menu

    $(document).ready(function()
    {
        //Add Inactive Class To All Accordion Headers
        $('.accordion-header').toggleClass('inactive-header');

        //Set The Accordion Content Width
        var contentwidth = $('.accordion-header').width();
        $('.accordion-content').css({});

        //Open The First Accordion Section When Page Loads
        $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
        $('.accordion-content').first().slideDown().toggleClass('open-content');

        // The Accordion Effect
        $('.accordion-header').click(function () {
            if($(this).is('.inactive-header')) {
                $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
                $(this).toggleClass('active-header').toggleClass('inactive-header');
                $(this).next().slideToggle().toggleClass('open-content');
            }

            else {
                $(this).toggleClass('active-header').toggleClass('inactive-header');
                $(this).next().slideToggle().toggleClass('open-content');
            }
        });

        return false;
    });
</script>

<script type="text/javascript">
    $(function()
    {
        $(document).on('click', '.btn-add', function(e)
        {
            e.preventDefault();

            var controlForm = $('.controls form:first'),
                    currentEntry = $(this).parents('.entry:first'),
                    newEntry = $(currentEntry.clone());

            newEntry.insertAfter(currentEntry);

            newEntry.find('input').val('');
            controlForm.find('.entry:not(:last) .btn-add')
                    .removeClass('btn-add').addClass('btn-remove')
                    .removeClass('btn-success').addClass('btn-danger')
                    .html('<span class="glyphicon glyphicon-minus"></span>');
        }).on('click', '.btn-remove', function(e)
        {
            $(this).parents('.entry:first').remove();

            e.preventDefault();
            return false;
        });
    });

</script>

<jsp:include page="/WEB-INF/views/fragments/inner/footerIn.jsp"/>

</body>

</html>