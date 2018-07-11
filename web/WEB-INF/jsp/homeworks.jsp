<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.lang.String" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Title and other stuffs -->
    <jsp:include page="staticinclude.jsp"/>
    <title>N.E.E 查看作业情况</title>

</head>

<body>

<jsp:include page="header.jsp"/>

<div class="content">

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Sidebar ends -->

    <!-- Main bar -->
    <div class="mainbar">


        <!-- Matter -->

        <div class="matter">
            <div class="container">



                <!-- Dashboard Graph starts -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="widget">
                            <!-- Widget title -->
                            <div class="widget-head">
                                <div class="pull-left">未完成作业</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content referrer">
                                <!-- Widget content -->
                                <table class="table table-striped table-bordered table-hover">
                                    <tbody><tr>
                                        <th>标题</th>
                                        <th>学科</th>
                                        <th>教师</th>
                                        <th>完成情况</th>
                                        <th>截止日期</th>
                                    </tr>
                                    <c:forEach items="${unDones}" var="temp" begin="0" end="10">
                                        <tr>
                                            <td><a href="${pageContext.request.contextPath}/homeworks/dohomework.do?hID=${temp.hID}">${temp.title}</a></td>
                                            <td><c:set var="str"><c:out value="${temp.hom_id}"/></c:set>${unTeacherMap[str].subject}</td>
                                            <td><c:set var="str"><c:out value="${temp.hom_id}"/></c:set>${unTeacherMap[str].name}</td>
                                            <td><c:if test="${temp.grade==-1}">
                            <span class="label label-danger">
                                  未完成
                            </span>
                                            </c:if>
                                                <c:if test="${temp.grade!=-1}">
                              <span class="label label-danger">
                                  已完成, 得分:${temp.grade}
                              </span>
                                                </c:if>
                                            </td>
                                            <td>${temp.deadline}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody></table>
                                <div class="widget-foot">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget">
                            <!-- Widget title -->
                            <div class="widget-head">
                                <div class="pull-left">已完成作业</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content referrer">
                                <!-- Widget content -->
                                <table class="table table-striped table-bordered table-hover">
                                    <tbody><tr>
                                        <th>标题</th>
                                        <th>学科</th>
                                        <th>教师</th>
                                        <th>完成情况</th>
                                        <th>截止日期</th>
                                    </tr>
                                    <c:forEach items="${Dones}" var="temp" begin="0" end="10">
                                        <tr>
                                            <td><a href="#">${temp.title}</a></td>
                                            <td>${teacherMap[str].subject}</td>
                                            <td><c:set var="str"><c:out value="${temp.hom_id}"/></c:set>${teacherMap[str].name}</td>
                                            <td><c:if test="${temp.grade==-1}">
                            <span class="label label-danger">
                                  未完成
                            </span>
                                            </c:if>
                                                <c:if test="${temp.grade!=-1}">
                              <span class="label label-danger">
                                  已完成, 得分:${temp.grade}
                              </span>
                                                </c:if>
                                            </td>
                                            <td>${temp.deadline}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody></table>
                                <div class="widget-foot">
                                </div>
                            </div>
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