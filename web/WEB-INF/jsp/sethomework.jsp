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
    <title>N.E.E 布置作业</title>
    <script language="JavaScript">
        function add() {
            document.addAndDel.action="${pageContext.request.contextPath}/homeworks/set.do?id=${one.id}";
            document.addAndDel.submit();
        }

        /*function search() {
            document.search.action="${pageContext.request.contextPath}";
            document.search.submit();
        }*/
    </script>
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
                <div class="widget">
                    <div class="widget-head">
                        <div class="pull-left">题库</div>
                        <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget-content medias">
                        <form name="addAndDel" class="form-horizontal" action="" method="post">
                            <table class="table table-striped table-bordered table-hover" id="questionlist" style="table-layout:fixed;word-break:break-all;">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>命题人</th>
                                    <th>适用课程</th>
                                    <th>题目类型</th>
                                    <th>题目内容</th>
                                    <th>答案</th>
                                    <th>分值</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${questions}" var="temp" varStatus="status">
                                    <tr>
                                        <td>
                                        <span class="uni">
                                            <input type='checkbox' value='${temp.qID}' name="boxes" />
                                        </span>
                                        </td>
                                        <td><c:set var="str"><c:out value="${temp.id}"/></c:set>${stringUserMap[str].name}</td>
                                        <td>${temp.category}</td>
                                        <td>${temp.type}</td>
                                        <td>${temp.title}</td>
                                        <c:choose>
                                            <c:when test="${temp.type eq '判断题'}">
                                                <td>${temp.answer}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><button type="button" class="btn btn-success" title="A: ${temp.optionA} B: ${temp.optionB} C: ${temp.optionC} D: ${temp.optionD}">${temp.answer}</button></td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${temp.score}</td>
                                    </tr>
                                </c:forEach>



                                </tbody>
                            </table>
                            <div class="widget-foot">

                                <div class="uni pull-left">
                                    <input type='text' name="hID" placeholder="作业号 > ${max}"/>
                                    <hr/>
                                    <h6>deadline</h6>
                                    <input type='text' name="deadline" placeholder="yyyy-MM-dd hh:mm:ss"/>
                                    <hr/>
                                    <input type='text' name="title" placeholder="作业标题"/>
                                    <hr/>
                                    <button type="button" class="btn btn-xs btn-success" onclick="add()">生成作业</button>
                                    <%--<form action="" name="search" class="form-horizontal" method="post">
                                        <input type="text" class="form-control" placeholder="Search" onclick="search()">
                                    </form>--%>
                                </div>


                                <%--                        <ul class="pagination pull-right">
                                                            <li><a href="#">上一页</a></li>
                                                            <li><a href="#">1</a></li>
                                                            <li><a href="#">2</a></li>
                                                            <li><a href="#">3</a></li>
                                                            <li><a href="#">4</a></li>
                                                            <li><a href="#">下一页</a></li>
                                                        </ul>--%>

                                <div class="clearfix"></div>

                            </div>
                        </form>


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
<script>
    tippy('.btn',{
        placement: 'bottom',
        animation: 'scale',
        arrow: true})
</script>
</body>

</html>
