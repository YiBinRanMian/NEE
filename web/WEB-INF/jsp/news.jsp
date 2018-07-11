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
    <title>N.E.E 业界新闻</title>

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
                                <div class="pull-left">最新新闻</div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content referrer">
                                <!-- Widget content -->
                                <div class="padd">
                                    <ul class="latest-news">
                                        <c:forEach items="${list}" var="temp" begin="0" end="3">
                                            <li>
                                                <!-- Title and date -->
                                                <h6>
                                                    <c:set var="str"><c:out value="${temp.id}"/></c:set>
                                                        ${editorMap[str].name}
                                                    - <span>${temp.rtime}</span></h6>
                                                <p><a href="${pageContext.request.contextPath}/news/getOneNews.do?nID=${temp.nID}">${temp.title} </a></p>
                                            </li>

                                        </c:forEach>

                                    </ul>
                                </div>
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