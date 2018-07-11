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
    <title>N.E.E 新闻详情</title>

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
                            <div class="widget-head">
                                <div class="pull-left">新闻详情</div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content">
                                <div class="padd statement">
                                    <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8">
                                            <div class="well">
                                                <h2 class="center">${news.title}</h2>
                                                <p class="center">${editor.name} ${news.rtime}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-12">
                                            <hr />
                                            <pre>${news.content}</pre>
                                        </div>

                                    </div>

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