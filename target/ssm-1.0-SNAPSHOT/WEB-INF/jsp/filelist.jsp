<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.lang.String" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Title and other stuffs -->
    <jsp:include page="staticinclude.jsp"/>
    <title>N.E.E 上传文件</title>

</head>

<body>

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

                <div class="row">

                    <div class="col-md-8">
                        <div class="widget">
                            <!-- Widget title -->
                            <div class="widget-head">
                                <div class="pull-left">文件下载</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="widget-content">
                                <!-- Widget content -->
                                <ul class="file-upload">
                                    <c:forEach items="${fileNames}" var="temp" begin="0" end="100">

                                        <li>
                                            <strong><i class="icon-ok"></i><a href="${pageContext.request.contextPath}/FileUpload/download.do?filename=${temp}"> ${temp}</a></strong>
                                            <div class="file-meta"><c:set var="str"><c:out value="${temp}"/></c:set>     ${nameSizeMap[str]}</div>
                                        </li>

                                    </c:forEach>
                                </ul>

                                <div class="widget-foot">
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