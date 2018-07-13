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
    <title>N.E.E 考试</title>
    <style>
        *{margin:0;}
        label{vertical-align:middle}
        .inputcheckbox{vertical-align:middle;}
        body{font-family:tahoma;font-size:12px;}
    </style>
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

                <div class="row">

                    <div class="col-md-12">


                        <div class="widget wgreen">

                            <div class="widget-head">
                                <div class="pull-left">考试</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="widget-content">
                                <div class="padd">

                                    <h6>${stuDo.title}</h6> <h6 align="right">当前进度: ${step}/${size}</h6>
                                    <hr />
                                    <!-- Form starts.  -->

                                    <form class="form-horizontal" action="${pageContext.request.contextPath}/test/dotest.do?&tID=${tID}&qID=${qID}&step=${step}&size=${size}" method="post">
                                        <c:if test="${question.type eq '单选题'}">
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label"></label>
                                                <div class="col-lg-8">
                                                    <h5><c:out value="${step}"/>: ${question.title}</h5>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="A">
                                                        <label for="${question.optionA}">${question.optionA}</label>
                                                    </div>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="B">
                                                        <label for="${question.optionB}">${question.optionB}</label>
                                                    </div>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="C">
                                                        <label for="${question.optionC}">${question.optionC}</label>
                                                    </div>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="D">
                                                        <label for="${question.optionD}">${question.optionD}</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${question.type eq '多选题'}">
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label"></label>
                                                <div class="col-lg-8">
                                                    <h5><c:out value="${step}"/>: ${question.title}</h5>

                                                    <label class="inputcheckbox">
                                                        <input type="checkbox"  name="answer1" value="A"> ${question.optionA}
                                                    </label><br/>
                                                    <label class="inputcheckbox">
                                                        <input type="checkbox" name="answer1" value="B"> ${question.optionB}
                                                    </label><br/>
                                                    <label class="inputcheckbox">
                                                        <input type="checkbox" name="answer1" value="C"> ${question.optionC}
                                                    </label><br/>
                                                    <label class="inputcheckbox">
                                                        <input type="checkbox" name="answer1" value="D"> ${question.optionD}
                                                    </label> <br/>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${question.type eq '判断题'}">
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label"></label>
                                                <div class="col-lg-8">
                                                    <h5><c:out value="${step}"/>: ${question.title}</h5>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="A"> True
                                                    </div>
                                                    <div class="radio">
                                                        <input type="radio" class="inputcheckbox" name="answer" value="B"> False
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-lg-offset-1 col-lg-9">
                                                <c:if test="${step eq size}">
                                                    <button type="submit" class="btn btn-success">提交</button>
                                                </c:if>
                                                <c:if test="${step ne size}">
                                                    <button type="submit" class="btn btn-success">下一题</button>
                                                </c:if>
                                            </div>
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