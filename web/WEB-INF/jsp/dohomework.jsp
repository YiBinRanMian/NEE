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
    <title>N.E.E 完成作业</title>

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
                                <div class="pull-left">家庭作业</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="widget-content">
                                <div class="padd">

                                    <h6>${stuDo.title}</h6>
                                    <hr />
                                    <!-- Form starts.  -->
                                    <form class="form-horizontal" role="form">
                                        <c:forEach items="${questions}" var="temp" begin="0" end="100" varStatus="a">
                                            <c:if test="${temp.type eq '问答题'}">
                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label"></label>
                                                    <div class="col-lg-8">
                                                        <h6><c:out value="${a.count}"/>: ${temp.title}</h6>
                                                        <textarea class="form-control" rows="3" placeholder="回答区域"></textarea>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${temp.type eq '选择题'}">
                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label"></label>
                                                    <div class="col-lg-8">
                                                        <h6><c:out value="${a.count}"/>: ${temp.title}</h6>
                                                        <div class="radio">
                                                            <input type="radio" name="optionsRadios" value="optionA">
                                                            <label for="${temp.optionA}">
                                                                    ${temp.optionA}
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <input type="radio" name="optionsRadios" value="optionB">
                                                            <label for="${temp.optionB}">
                                                                    ${temp.optionB}
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <input type="radio" name="optionsRadios" value="optionC">
                                                            <label for="${temp.optionC}">
                                                                    ${temp.optionC}
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <input type="radio" name="optionsRadios" value="optionD">
                                                            <label for="${temp.optionD}">
                                                                    ${temp.optionD}
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
<%--                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Radio Box</label>
                                            <div class="col-lg-8">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                                        Option one is this and that&mdash;be sure to include why it's great
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                        Option two can be something else and selecting it will deselect option one
                                                    </label>
                                                </div>
                                            </div>
                                        </div>--%>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-lg-offset-1 col-lg-9">
                                                <button type="button" class="btn btn-success">提交</button>
<%--
                                                <button type="button" class="btn btn-danger">Danger</button>
--%>
                                            </div>
                                        </div>

<%--                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Input Box</label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" placeholder="Input Box">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Password</label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control" placeholder="Password Box">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Textarea</label>
                                            <div class="col-lg-8">
                                                <textarea class="form-control" rows="3" placeholder="Textarea"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Checkbox</label>
                                            <div class="col-lg-8">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Radio Box</label>
                                            <div class="col-lg-8">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                                        Option one is this and that&mdash;be sure to include why it's great
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                        Option two can be something else and selecting it will deselect option one
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">QuestionResultMap
                                            <label class="col-lg-4 control-label">Select Box</label>
                                            <div class="col-lg-8">
                                                <select class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">Select Box</label>
                                            <div class="col-lg-8">
                                                <select multiple class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">CLEditor</label>
                                            <div class="col-lg-8">
                                                <textarea class="cleditor" name="input"></textarea>
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="form-group">
                                            <div class="col-lg-offset-1 col-lg-9">
                                                <button type="button" class="btn btn-default">Default</button>
                                                <button type="button" class="btn btn-primary">Primary</button>
                                                <button type="button" class="btn btn-success">Success</button>
                                                <button type="button" class="btn btn-info">Info</button>
                                                <button type="button" class="btn btn-warning">Warning</button>
                                                <button type="button" class="btn btn-danger">Danger</button>
                                            </div>
                                        </div>--%>
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