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
    <title>N.E.E 编辑用户</title>

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
                <div class="col-md-12">
                    <div class="widget wred">
                        <div class="widget-head">
                            <div class="pull-left">用户信息</div>
                            <div class="widget-icons pull-right">
                                <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="widget-content">
                            <div class="padd">

                                <!-- Profile form -->

                                <div class="form profile">
                                    <!-- Edit profile form (not working)-->
                                    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/esubmit.do?id=${edited.id}" method="post">
                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="password1">密码</label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="password1" value="${edited.password}" name="password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="name1">姓名</label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="name1" value="${edited.name}" name="name">
                                            </div>
                                        </div>
                                        <!-- Address -->
                                        <div class="form-group">
                                            <label class="control-label col-lg-3" >性别</label>
                                            <div class="col-lg-6">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="male">male
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="female">female
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-lg-3">role</label>
                                            <div class="col-lg-6">
                                                <select class="form-control" name="role">
                                                    <option value=""> --- Please Select --- </option>
                                                    <option value="student">student</option>
                                                    <option value="teacher">teacher</option>
                                                    <option value="group">group</option>
                                                    <option value="editor">editor</option>
                                                    <option value="reviewer">reviewer</option>
                                                    <option value="useradmin">useradmin</option>
                                                    <option value="postadmin">postadmin</option>
                                                </select>
                                            </div>
                                        </div>
                                        <c:if test="${edited.role eq 'teacher'}">
                                            <div class="form-group">
                                                <label class="control-label col-lg-3" for="name1">学科</label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="subject1" value="${edited.subject}" name="subject">
                                                </div>
                                            </div>
                                        </c:if>
                                        <!-- Checkbox -->
                                        <div class="form-group">
                                            <div class="col-lg-6 col-lg-offset-1">

                                                <label class="checkbox inline">
                                                    <input type="checkbox" name="confirm" id="inlineCheckbox3" value="agree"> 确认修改
                                                </label>
                                            </div>
                                        </div>

                                        <!-- Buttons -->
                                        <div class="form-group">
                                            <!-- Buttons -->
                                            <div class="col-lg-6 col-lg-offset-1">
                                                <button type="submit" class="btn btn-success">更改</button>
                                            </div>
                                        </div>
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
<jsp:include page="footer.jsp"/>
</body>
</html>