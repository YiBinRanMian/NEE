<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="scdx.group17.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <!-- Title and other stuffs -->

    <jsp:include page="staticinclude.jsp"/>
    <title>N.E.E 编辑主页</title>
</head>

<body>
<%

    User user = (User) request.getAttribute("one");
    session.setAttribute("one",user);
%>
<jsp:include page="header.jsp"/>


<!-- Header ends -->

<!-- Main content starts -->

<div class="content">

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Sidebar ends -->

    <!-- Main bar -->
    <div class="mainbar">


        <!-- Matter -->

        <div class="matter">
            <div class="container">
                <div class="widget">

                    <div class="widget-head">
                        <div class="pull-left">新闻审核</div>
                        <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="wclose"><i class="icon-remove"></i></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="widget-content">

                        <table class="table table-striped table-bordered table-hover" style="table-layout:fixed;word-break:break-all;">
                            <thead>
                            <tr>
                                <th>标题</th>
                                <th>编辑人</th>
                                <th>审核人</th>
                                <th>进程</th>
                                <th>编辑时间</th>
                                <th>审核时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${news}" var="temp" begin="0" end="100">
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/news/getOneNews.do?nID=${temp.nID}">${temp.title}</a></td>
                                    <td><c:set var="str"><c:out value="${temp.id}"/></c:set>${editorMap[str].name}</td>
                                    <td><c:set var="str"><c:out value="${temp.rev_id}"/></c:set>${reviewerMap[str].name}</td>
                                    <c:if test="${temp.isreleased eq 1}">
                                        <td><span class="label label-success">通过</span></td>
                                    </c:if>
                                    <c:if test="${temp.isreleased eq 0}">
                                        <td><span class="label label-default">待审核</span></td>
                                    </c:if>
                                    <c:if test="${temp.isreleased eq -1}">
                                        <td><span class="label label-danger">被驳回</span></td>
                                    </c:if>
                                    <td>${temp.etime}</td>
                                    <td>${temp.rtime}</td>
                                    <td>
                                        <c:if test="${temp.isreleased eq -1}">
                                            <a href="${pageContext.request.contextPath}/news/delete.do?nID=${temp.nID}"><button type="button" class="btn btn-xs btn-danger" value="delete"><i class="icon-remove"></i></button></a>
                                        </c:if>
                                    </td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="widget-foot">


             <%--               <ul class="pagination pull-right">
                                <li><a href="#">上一页</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">下一页</a></li>
                            </ul>--%>

                            <div class="clearfix"></div>

                        </div>

                    </div>

                </div>


            </div>
        </div>

        <!-- Matter ends -->

    </div>

    <!-- Mainbar ends -->
    <div class="clearfix"></div>

</div>
<jsp:include page="footer.jsp"/>

</body>

</html>
