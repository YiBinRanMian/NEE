<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="sidebar">
    <div class="sidebar-dropdown"><a href="#">导航</a></div>

    <!--- Sidebar navigation -->
    <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
    <c:if test="${one.role eq 'teacher'}">
        <ul id="nav">
            <!-- Main menu with font awesome icon -->
            <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i> 首页</a>
            </li>
            <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 作业 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/homeworks/homeCompleteInfo.do?&query=&hom_id=${one.id}">完成情况</a></li>
                    <li><a href="${pageContext.request.contextPath}/homeworks/list.do">发布作业</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/news/getNews.do?&query="><i class="icon-bar-chart"></i>业界新闻</a></li>

            <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 论坛 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/post/getPosts.do?&query=&ismodified=0">查看消息</a></li>
                    <li><a href="${pageContext.request.contextPath}/post/addPost.do">发帖</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/FileUpload/uploadForm.do"><i class="icon-bar-chart"></i>发布课件</a></li>
            <li><a href="${pageContext.request.contextPath}/FileUpload/getAllFiles.do"><i class="icon-bar-chart"></i>查看课件</a></li>

        </ul>
    </c:if>
    <c:if test="${one.role eq 'student'}">
        <ul id="nav">
            <!-- Main menu with font awesome icon -->
            <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i> 首页</a>
            </li>
            <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 作业考试 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/homeworks/gethomeworks.do?&query=&id=${one.id}">家庭作业</a></li>
                    <li><a href="${pageContext.request.contextPath}/test/tests.do?&query=&id=${one.id}">考试</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/news/getNews.do?&query="><i class="icon-bar-chart"></i>业界新闻</a></li>

            <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 论坛 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/post/getPosts.do?&query=&ismodified=0">查看消息</a></li>
                    <li><a href="${pageContext.request.contextPath}/post/addPost.do">发帖</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/FileUpload/getAllFiles.do"><i class="icon-bar-chart"></i>查看课件</a></li>
        </ul>
    </c:if>

    <c:if test="${one.role eq 'useradmin'}">
        <ul id="nav">
            <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i> 用户管理</a>
        </ul>
    </c:if>
    <c:if test="${one.role eq 'editor'}">
        <ul id="nav">
            <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i>发布信息</a>
            <li><a href="${pageContext.request.contextPath}/news/new.do"><i class="icon-home"></i>发布新闻</a>
        </ul>
    </c:if>
    <c:if test="${one.role eq 'reviewer'}">
        <ul id="nav">
            <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i> 新闻审核</a>
        </ul>
    </c:if>
    <c:if test="${one.role eq 'group'}">
    <ul id="nav">
        <li><a href="${pageContext.request.contextPath}/user/login.do"><i class="icon-home"></i>命题</a>
        <li><a href="${pageContext.request.contextPath}/test/list.do"><i class="icon-home"></i>制卷</a>
        <li><a href="${pageContext.request.contextPath}/teach/getClassInfo.do"><i class="icon-home"></i>分班</a>
    </ul>
    </c:if>
</div>