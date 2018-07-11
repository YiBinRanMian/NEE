<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">

    <div class="container">
        <!-- Menu button for smallar screens -->
        <div class="navbar-header">
            <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span>菜单</span>
            </button>
            <!-- Site name for smallar screens -->
            <a href="${pageContext.request.contextPath}/user/login.do" class="navbar-brand hidden-lg">首页</a>
        </div>



        <!-- Navigation starts -->
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown pull-right">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-user"></i> 你好,${one.name} <b class="caret"></b>
                    </a>

                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="icon-user"></i> 资料</a></li>
                        <!--
                                      <li><a href="#"><i class="icon-cogs"></i> 设置</a></li>
                        -->
                        <li><a href="../../login.html"><i class="icon-off"></i> 退出</a></li>
                    </ul>
                </li>

            </ul>
        </nav>
    </div>
</div>
<!-- Header starts -->
<header>
    <div class="container">
        <div class="row">

            <!-- Logo section -->
            <div class="col-md-4">
                <!-- Logo. -->
                <div class="logo">
                    <h1><a href="#">应急化<span class="bold"></span></a></h1>
                    <p class="meta">培训平台</p>
                </div>
                <!-- Logo ends -->
            </div>
            <div class="col-md-4">

                <!-- Buttons -->
                <ul class="nav nav-pills">

                    <!-- Comment button with number of latest comments count -->
                    <c:if test="${one.role eq 'student'}">
                        <li class="dropdown dropdown-big">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                            <i class="icon-comments"></i> 发帖留言 <span class="label label-info">${commentCount}</span>
                        </a>

                        <ul class="dropdown-menu">
                            <li>
                                <!-- Heading - h5 -->
                                <h5><i class="icon-comments"></i> 留言</h5>
                                <!-- Use hr tag to add border -->
                                <hr>
                            </li>
                            <c:forEach items="${comments}" var="temp" begin="0" end="2">
                                <li>
                                    <!-- List item heading h6 -->
                                    <h6><a href="#">${temp.content}</a> <span class="label label-warning pull-right">${temp.time}</span></h6>
                                    <div class="clearfix"></div>
                                    <hr>
                                </li>
                            </c:forEach>
                            <li>
                                <div class="drop-foot">
                                    <a href="#">查看所有</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                        <li class="dropdown dropdown-big">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                            <i class="icon-envelope-alt"></i> 新的作业 <span class="label label-primary">${unDoneCount}</span>
                        </a>

                        <ul class="dropdown-menu">
                            <li>
                                <!-- Heading - h5 -->
                                <h5><i class="icon-envelope-alt"></i> 作业</h5>
                                <!-- Use hr tag to add border -->
                                <hr>
                            </li>
                            <c:forEach items="${dos}" var="temp" begin="0" end="3">
                                <li>
                                    <c:if test="${temp.grade==-1}">
                                        <c:set var="str"><c:out value="${temp.hom_id}"/></c:set>
                                        <h6><a href="#">${doTeacherMap[str].subject}
                                        </a></h6>
                                        <!-- List item para -->
                                        <p>
                                            <!-- Task -->
                                                ${doTeacherMap[str].name}
                                        </p>
                                        <hr>

                                    </c:if>
                                </li>
                            </c:forEach>
                            <li>
                                <div class="drop-foot">
                                    <a href="#">查看所有</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                        <li class="dropdown dropdown-big">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                            <i class="icon-envelope-alt"></i> 新的考试 <span class="label label-success">${unExamCount}</span>
                        </a>

                        <ul class="dropdown-menu">
                            <c:forEach items="${exams}" var="temp" begin="0" end="3">
                                <li>
                                    <!-- Heading - h5 -->
                                    <h5><i class="icon-envelope-alt"></i> 考试</h5>
                                    <!-- Use hr tag to add border -->
                                    <hr>
                                </li>
                                <li>
                                    <c:if test="${temp.grade==-1}">
                                        <c:set var="str"><c:out value="${temp.tes_id}"/></c:set>
                                        <h6><a href="#">${examTgroupMap[str].subject}
                                        </a></h6>
                                        <!-- List item para -->
                                        <p>
                                            <!-- Task -->
                                                ${examTgroupMap[str].name}
                                        </p>
                                        <hr>

                                    </c:if>
                                    <!-- List item heading h6 -->

                                </li>
                            </c:forEach>
                            <li>
                                <div class="drop-foot">
                                    <a href="#">查看所有</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    </c:if>

                    <c:if test="${one.role eq 'teacher'}">
                        <li class="dropdown dropdown-big">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="icon-comments"></i> 发帖留言 <span class="label label-info">${commentCount}</span>
                            </a>

                            <ul class="dropdown-menu">
                                <li>
                                    <!-- Heading - h5 -->
                                    <h5><i class="icon-comments"></i> 留言</h5>
                                    <!-- Use hr tag to add border -->
                                    <hr>
                                </li>
                                <c:forEach items="${comments}" var="temp" begin="0" end="2">
                                    <li>
                                        <!-- List item heading h6 -->
                                        <h6><a href="#">${temp.content}</a> <span class="label label-warning pull-right">${temp.time}</span></h6>
                                        <div class="clearfix"></div>
                                        <hr>
                                    </li>
                                </c:forEach>
                                    <%--<li>
                                      <!-- List item heading h6 -->
                                      <h6><a href="#">你好 :)</a> <span class="label label-warning pull-right">10:42</span></h6>
                                      <div class="clearfix"></div>
                                      <hr>
                                    </li>
                                    <li>
                                      <h6><a href="#">你怎么样?</a> <span class="label label-warning pull-right">20:42</span></h6>
                                      <div class="clearfix"></div>
                                      <hr>
                                    </li>
                                    <li>
                                      <h6><a href="#">你在干撒呢?</a> <span class="label label-warning pull-right">14:42</span></h6>
                                      <div class="clearfix"></div>
                                      <hr>
                                    </li>--%>
                                <li>
                                    <div class="drop-foot">
                                        <a href="#">查看所有</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>

            </div>

        </div>



    </div>
    </div>
</header>