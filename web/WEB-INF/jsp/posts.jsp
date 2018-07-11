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
    <title>N.E.E 讨论区</title>

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
                        <!-- Widget -->
                        <div class="widget">
                            <!-- Widget title -->
                            <div class="widget-head">
                                <div class="pull-left">Recent Posts</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content">
                                <!-- Widget content -->
                                <div class="padd">


                                    <ul class="recent">
                                        <c:forEach items="${posts}" var="temp" begin="0" end="10">

                                            <li>
                                                <div class="avatar pull-left">
                                                    <img src="../../static/img/user.jpg" alt=""/>
                                                </div>

                                                <div class="recent-content">
                                                    <div class="recent-meta">Posted on ${temp.updatetime} by <c:set var="str"><c:out value="${temp.id}"/></c:set>${userMap[str].name}</div>
                                                    <div><a href="${pageContext.request.contextPath}/comments/getPostComments.do?pID=${temp.pID}&ismodified=0">${temp.title}</a>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </li>


                                        </c:forEach>




                                    </ul>


                                </div>
                                <!-- Widget footer -->
                                <div class="widget-foot">


                                    <ul class="pagination pull-right">
                                        <li><a href="#">Prev</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">Next</a></li>
                                    </ul>

                                    <div class="clearfix"></div>

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
<!-- Content ends -->
<!-- Footer starts -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Copyright info -->
                <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
            </div>
        </div>
    </div>
</footer>
<jsp:include page="footer.jsp"/>


</body>
</html>