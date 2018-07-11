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
    <title>N.E.E 详细评论</title>

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



                <!-- Dashboard Graph starts -->

                <div class="row">
                    <div class="col-md-12">
                        <!-- Widget -->
                        <div class="widget">
                            <!-- Widget title -->
                            <div class="widget-head">
                                <div class="pull-left">Chats</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="widget-content">
                                <!-- Widget content -->
                                <div class="padd">

                                    <ul class="chats">
                                        <li>
                                            <div class="avatar pull-left">
                                                <img src="../../static/img/user.jpg" alt=""/>
                                            </div>

                                            <div class="recent-content">
                                                <div class="recent-meta">    Posted on ${post.updatetime} by ${poster.name}</div>
                                                <br/>
                                                <h5>${post.title}</h5>
                                                <div>${post.content}
                                                </div>

<%--
                                                <div class="btn-group">
                                                    <button class="btn btn-xs btn-default"><i class="icon-ok"></i> </button>
                                                    <button class="btn btn-xs btn-default"><i class="icon-pencil"></i> </button>
                                                    <button class="btn btn-xs btn-default"><i class="icon-remove"></i> </button>
                                                </div>
--%>
                                                <div class="clearfix"></div>
                                            </div>
                                        </li>
                                        <hr>

                                        <c:forEach items="${comments}" var="temp" begin="0" end="10">
                                            <c:set var="str"><c:out value="${temp.id}"/></c:set>
                                            <c:choose>

                                                <c:when test="${one.id eq temp.id}">
                                                    <li class="by-me">
                                                        <!-- Use the class "pull-left" in avatar -->
                                                        <div class="avatar pull-left">
                                                            <img src="../../static/img/user.jpg" alt=""/>
                                                        </div>

                                                        <div class="chat-content">
                                                            <!-- In meta area, first include "name" and then "time" -->
                                                            <div class="chat-meta">${commenters[str].name} <span class="pull-right">${temp.time}</span></div>
                                                            ${temp.content}
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </li>
                                                </c:when>

                                                <c:otherwise>
                                                    <li class="by-other">
                                                        <!-- Use the class "pull-right" in avatar -->
                                                        <div class="avatar pull-right">
                                                            <img src="../../static/img/user.jpg" alt=""/>
                                                        </div>

                                                        <div class="chat-content">
                                                            <!-- In the chat meta, first include "time" then "name" -->
                                                            <div class="chat-meta">${temp.time} <span class="pull-right">${commenters[str].name}</span></div>
                                                            ${temp.content}
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </li>
                                                </c:otherwise>

                                            </c:choose>


                                        </c:forEach>


                                    </ul>

                                </div>
                                <!-- Widget footer -->
                                <div class="widget-foot">

                                    <form class="form-inline" action="${pageContext.request.contextPath}/comments/getPostComments.do?ismodified=1&pID=${post.pID}" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Type your message here..." name="commentText">
                                        </div>
                                        <button type="submit" class="btn btn-default">发送</button>
                                    </form>


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
<jsp:include page="footer.jsp"/>


</body>
</html>