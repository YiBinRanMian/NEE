<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="scdx.group17.entity.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <jsp:include page="staticinclude.jsp"/>
  <title>N.E.E 学生主页</title>
</head>

<body>
<%
  Student student = (Student) request.getAttribute("one");
  session.setAttribute("one",student);
%>
<jsp:include page="indexheader.jsp"/>
<div class="content">
  <jsp:include page="sidebar.jsp"/>
  	<div class="mainbar">
	    <div class="matter">
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="widget">
                <div class="widget-head">
                  <div class="pull-left">学习计划</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                  </div>
                  <div class="clearfix"></div>
                </div>             

                <div class="widget-content">
                  <div class="padd">
                    <!-- Visitors, pageview, bounce rate, etc., Sparklines plugin used -->
                    <ul class="current-status">
                      <li>
                        <span id="status1"></span> <span class="bold"><a href="${pageContext.request.contextPath}/homeworks/gethomeworks.do?&query=&id=${one.id}">待完成作业 : ${unDoneCount}</a></span>
                        <hr>
                      </li>
                      <li>
                        <span id="status2"></span> <span class="bold"><a href="${pageContext.request.contextPath}/homeworks/gethomeworks.do?&query=&id=${one.id}">已完成作业 : ${doneCount}</a></span>
                        <hr>
                      </li>
                      <li>
                        <span id="status3"></span> <span class="bold"><a href="${pageContext.request.contextPath}/test/tests.do?&query=&id=${one.id}">待完成考试 : ${unExamCount}</a></span>
                        <hr>
                      </li>
                      <li>
                        <span id="status4"></span> <span class="bold"><a href="${pageContext.request.contextPath}/test/tests.do?&query=&id=${one.id}">已完成考试 : ${examCount}</a></span>
                        <hr>
                      </li>
                      <li>
                        <span id="status5"></span> <span class="bold"><a href="${pageContext.request.contextPath}/post/addPost.do">论坛发帖 : ${postCount}</a></span>
                      </li>
                    </ul>

                  </div>
                  <div class="widget-foot">
                  </div>
                </div>

              </div>

          </div>
              <%--新闻浏览--%>
            <div class="col-md-9">
              <div class="widget">
                <!-- Widget title -->
                <div class="widget-head">
                  <div class="pull-left">最新新闻</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content referrer">
                  <!-- Widget content -->
                  <div class="padd">
                    <ul class="latest-news">
                      <c:forEach items="${news}" var="temp" begin="0" end="3">
                        <li>
                          <!-- Title and date -->
                          <h6>
                            <c:set var="str"><c:out value="${temp.id}"/></c:set>
                            ${editorMap[str].name}
                            - <span>${temp.rtime}</span></h6>
                          <p><a href="${pageContext.request.contextPath}/news/getOneNews.do?nID=${temp.nID}">${temp.title} </a></p>
                        </li>

                      </c:forEach>


                      <%--<li>
                        <!-- Title and date -->
                        <h6><a href="#">Aac felis nec imperdiet</a> - <span>Jan 1, 2012</span></h6>
                        <p>Suspendisse potenti. Morbi ac felis fermentum. Aenean lacus hendrerit sed rhoncus erat hendrerit. </p>
                      </li>

                      <li>
                        <!-- Title and date -->
                        <h6><a href="#">Felis nec imperdiet</a> - <span>Jan 1, 2012</span></h6>
                        <p>Suspendisse potenti. Morbi ac felis fermentum. Aenean hendrerit sed rhoncus erat hendrerit. </p>
                      </li>

                      <li>
                        <!-- Title and date -->
                        <h6><a href="#">Felis nec imperdiet</a> - <span>Jan 1, 2012</span></h6>
                        <p>Suspendisse potenti. Morbi ac felis fermentum. Aenean hendrerit sed rhoncus erat hendrerit. </p>
                      </li>--%>
                    </ul>
                  </div>
                  <div class="widget-foot">
                  </div>
                </div>
              </div>
            </div>
          </div>
            <div class="row">
              <%--考试情况--%>
              <div class="col-md-6">
                <div class="widget">
                  <!-- Widget title -->
                  <div class="widget-head">
                    <div class="pull-left">考试</div>
                    <div class="widget-icons pull-right">
                      <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget-content referrer">
                    <!-- Widget content -->
                    <table class="table table-striped table-bordered table-hover">
                      <tbody><tr>
                        <th>教学组</th>
                        <th>考试</th>
                        <th>完成情况</th>
                        <th>考试时间</th>
                      </tr>
                      <c:forEach items="${exams}" var="temp" begin="0" end="5">
                        <tr>
                          <td><c:set var="str"><c:out value="${temp.tes_id}"/></c:set>${examTgroupMap[str].name}</td>
                          <td>${temp.title}</td>
                          <td><c:if test="${temp.grade==-1}">
                            <span class="label label-danger">
                                  未完成
                            </span>
                          </c:if>
                            <c:if test="${temp.grade!=-1}">
                              <span class="label label-danger">
                                  已完成, 得分:${temp.grade}
                              </span>
                            </c:if>
                          </td>
                          <td>${temp.deadline}</td>
                        </tr>
                      </c:forEach>
                      </tbody></table>

                    <div class="widget-foot">
                    </div>

                  </div>
                </div>
              </div>
                <%--作业情况--%>
              <div class="col-md-6">
                <div class="widget">
                  <!-- Widget title -->
                  <div class="widget-head">
                    <div class="pull-left">作业</div>
                    <div class="widget-icons pull-right">
                      <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget-content referrer">
                    <!-- Widget content -->
                    <table class="table table-striped table-bordered table-hover">
                      <tbody><tr>
                        <th>教师</th>
                        <th>学科</th>
                        <th>完成情况</th>
                        <th>截止日期</th>
                      </tr>
                      <c:forEach items="${dos}" var="temp" begin="0" end="5">
                        <tr>
                          <td><c:set var="str"><c:out value="${temp.hom_id}"/></c:set>${doTeacherMap[str].name}</td>
                          <td>${doTeacherMap[str].subject}</td>
                          <td><c:if test="${temp.grade==-1}">
                            <span class="label label-danger">
                                  未完成
                            </span>
                          </c:if>
                            <c:if test="${temp.grade!=-1}">
                              <span class="label label-danger">
                                  已完成, 得分:${temp.grade}
                              </span>
                            </c:if>
                          </td>
                          <td>${temp.deadline}</td>
                        </tr>
                      </c:forEach>
                      </tbody></table>
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

   <!-- Mainbar ends -->-
  <div class="clearfix"></div>

</div>
<!-- Content ends -->

<jsp:include page="footer.jsp"/>

</body>
</html>