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
    <title>N.E.E 发贴</title>

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

                        <div class="widget wgreen">

                            <div class="widget-head">
                                <div class="pull-left">编辑新闻</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content">
                                <div class="padd">
                                    <!-- Form starts.  -->
                                    <form class="form-horizontal" action="${pageContext.request.contextPath}/news/editNews.do?id=${one.id}" method="post" >
                                        <div class="form-group">
                                            <label class="control-label col-lg-3" >新闻标题 </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" placeholder="输入标题" name="title">
                                                <br />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-lg-3" >正文 </label>
                                            <div class="col-lg-10">
                                                <div class="text-area">
                                                    <textarea class="form-control" name="content" placeholder="输入正文"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-lg-1">
                                            </div>
                                            <a href="#"><input type="submit" class="btn btn-success" value="提交"></a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="widget-foot">
                                <!-- Footer goes here -->
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