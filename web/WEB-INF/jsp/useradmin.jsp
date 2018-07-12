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
    <title>N.E.E 用户管理员主页</title>
    <script language="JavaScript">
        function addrow() {
            //添加一行
            var i = parseInt(userlist.rows.length);
            var newTr = userlist.insertRow();
            //添加列
            var newTdVoid = newTr.insertCell();
            var newTdId = newTr.insertCell();
            var newTdPassword = newTr.insertCell();
            var newTdName = newTr.insertCell();
            var newTdGender = newTr.insertCell();
            var newTdRole = newTr.insertCell();
            var newSubject = newTr.insertCell();
            var newTdOp = newTr.insertCell();
            //设置列内容和属性

            newTdId.innerHTML = '<input type="text" class="form-control" id="id1" name="addid" placeholder="ID" ">';
            newTdPassword.innerHTML = '<input type="text" class="form-control" id="password1" name="addpassword" placeholder="密码" >';
            newTdName.innerHTML = '<input type="text" class="form-control" id="name1" name="addname" placeholder="姓名">';
            newTdGender.innerHTML = '<input type="text" class="form-control" id="gender" name="addgender" placeholder="性别" >';
            newTdRole.innerHTML = '<input type="text" class="form-control" id="role" name="addrole" placeholder="角色" ">';
            newSubject.innerHTML='<input type="text" class="form-control" id="subject" name="addsubject" placeholder="*仅教师">';
            newTdOp.innerHTML = '<input type="submit" class="btn btn-mini btn-success" id="confirm" onclick="add()" value="确认"/> '+' <input type="button" class="btn btn-mini btn-warning" value="取消" onclick="delrow()"/> ';

        }


        function delrow(){
            var cGetRow = window.event.srcElement.parentElement.parentElement.rowIndex;
            userlist.deleteRow(cGetRow);

        }
        
        function add() {
            document.addAndDel.action="${pageContext.request.contextPath}/user/add.do";
            document.addAndDel.submit();
        }

        function del() {
            document.addAndDel.action="${pageContext.request.contextPath}/user/delUsers.do";
            document.addAndDel.submit();
        }

        function search() {
            document.search.action="${pageContext.request.contextPath}";
            document.search.submit();
        }
    </script>

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
                        <div class="pull-left">用户管理</div>
                        <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget-content medias">
                        <form name="addAndDel" class="form-horizontal" action="" method="post">
                        <table class="table table-striped table-bordered table-hover" id="userlist" style="table-layout:fixed;word-break:break-all;">
                            <thead>
                            <tr>
                                <th>
                                </th>
                                <th>ID</th>
                                <th>密码</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>角色</th>
                                <th>学科(仅教师)</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="temp" begin="0" end="100">
                                <c:if test="${temp.id ne one.id}">
                                    <tr>
                                        <td>
                                        <span class="uni">
                                            <input type='checkbox' value='${temp.id}' name="boxes" />
                                        </span>
                                        </td>
                                        <td>${temp.id}</td>
                                        <td>${temp.password}</td>
                                        <td>${temp.name}</td>
                                        <td>${temp.gender}</td>
                                        <td>${temp.role}</td>
                                        <td>${temp.subject}</td>
                                        <td>
                                            <a><button  type="button" class="btn btn-xs btn-default" onclick="window.open('${pageContext.request.contextPath}/user/edit.do?id=${temp.id}')" id="edit"><i class="icon-pencil"></i> </button></a>
                                            <a href="${pageContext.request.contextPath}/user/delete.do?id=${temp.id}"><button type="button" class="btn btn-xs btn-danger" value="delete"><i class="icon-remove"></i></button></a>
                                        </td>
                                    </tr>
                                </c:if>


                            </c:forEach>



                            </tbody>
                        </table>
                            <div class="widget-foot">

                                <div class="uni pull-left">
                                    <button type="button" class="btn btn-xs btn-success" onclick="addrow()">添加用户</button>
                                    <button class="btn btn-xs btn-danger" onclick="del()">批量删除</button>
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

</body>

</html>
