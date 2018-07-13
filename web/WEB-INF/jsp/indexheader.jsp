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
            <%--<form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>--%>
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown pull-right">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-user"></i> 你好,${one.name} <b class="caret"></b>
                    </a>

                    <!-- Dropdown menu -->
                    <ul class="dropdown-menu">
                        <%--<li><a href="#"><i class="icon-user"></i> 资料</a></li>--%>
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
                    <h1><a href="${pageContext.request.contextPath}/user/login.do">应急化<span class="bold"></span></a></h1>
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
                                    <h6><a href="${pageContext.request.contextPath}/comments/getPostComments.do?pID=${temp.pID}&ismodified=0">${temp.content}</a> <span class="label label-warning pull-right">${temp.time}</span></h6>
                                    <div class="clearfix"></div>
                                    <hr>
                                </li>
                            </c:forEach>
                            <li>
                                <div class="drop-foot">
                                    <a href="${pageContext.request.contextPath}/post/getPosts.do?&query=&ismodified=0">查看所有</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                        <li class="dropdown dropdown-big">
                            <a href="${pageContext.request.contextPath}/homeworks/gethomeworks.do?&query=&id=${one.id}">
                                <i class="icon-envelope-alt"></i> 新的作业 <span class="label label-primary">${unDoneCount}</span>
                            </a>
                    </li>
                        <li class="dropdown dropdown-big">
                            <a href="${pageContext.request.contextPath}/test/tests.do?&query=&id=${one.id}">
                                <i class="icon-envelope-alt"></i> 新的考试 <span class="label label-success">${unExamCount}</span>
                            </a>

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
                                        <h6><a href="${pageContext.request.contextPath}/comments/getPostComments.do?pID=${temp.pID}&ismodified=0">${temp.content}</a> <span class="label label-warning pull-right">${temp.time}</span></h6>
                                        <div class="clearfix"></div>
                                        <hr>
                                    </li>
                                </c:forEach>
                                <li>
                                    <div class="drop-foot">
                                        <a href="${pageContext.request.contextPath}/post/getPosts.do?&query=&ismodified=0">查看所有</a>
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