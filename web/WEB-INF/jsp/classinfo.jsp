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
    <title>N.E.E 分班</title>

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
                                <div class="pull-left">未分配教师-学生</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content referrer">
                                <!-- Widget content -->
                                <form class="form-horizontal" action="${pageContext.request.contextPath}/teach/allocate.do" method="post" >

                                <table class="table table-striped table-bordered table-hover" style="table-layout:fixed;word-break:break-all;">
                                    <tbody>
                                    <tr>
                                        <th>教师</th>
                                        <th>学生</th>
                                        <th>操作</th>
                                    </tr>

                                    <c:forEach items="${teachers}" var="temp" begin="0" end="100">
                                        <tr>
                                            <td>${temp.name}</td>
                                            <td>
                                                <c:set var="str"><c:out value="${temp.id}"/></c:set>
                                                <select class="form-control" name="students" multiple="multiple">
                                                    <c:forEach items="${stringListMap[str]}" var="temp1" begin="0" end="100">
                                                        <option value="${temp1.id}">${temp1.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>
                                                <button type="submit" class="btn btn-xs btn-success" value="${temp.id}" name="tid"><i class="icon-save"></i></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                </form>
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
                                <div class="pull-left">已分配教师-学生</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content referrer">
                                <form class="form-horizontal" action="${pageContext.request.contextPath}/teach/del.do" method="post" >

                                    <table class="table table-striped table-bordered table-hover" style="table-layout:fixed;word-break:break-all;">
                                        <tbody>
                                        <tr>
                                            <th>教师</th>
                                            <th>学生</th>
                                            <th>操作</th>
                                        </tr>

                                        <c:forEach items="${teachers}" var="temp" begin="0" end="100">
                                            <tr>
                                                <td>${temp.name}</td>
                                                <td>
                                                    <c:set var="str"><c:out value="${temp.id}"/></c:set>
                                                    <select class="form-control" name="students" multiple="multiple">
                                                        <c:forEach items="${stringListMap1[str]}" var="temp1" begin="0" end="100">
                                                            <option value="${temp1.id}">${temp1.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td><button type="submit" class="btn btn-xs btn-danger" value="${temp.id}" name="tid"><i class="icon-remove"></i></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </form>
                                <!-- Widget content -->
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