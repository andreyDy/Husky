
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" id="brand" href="/profile">Husky</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">

            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${user.firstName}<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="/profile"><i class="fa fa-fw fa-user"></i> Profile</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="/logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li>
                <a href="/courses"><i class="fa fa-fw fa-arrow-left"></i> Back</a>
            </li>
            <li>
                <a href="/settings/courses"><i class="fa fa-fw fa-list"></i> Courses</a>
            </li>
            <li>
                <a href="/settings/course/add"><i class="fa fa-fw fa-plus"></i> Create course</a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>