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
    <title>N.E.E 教研组主页</title>
    <script language="JavaScript">
        function addrow() {
            //添加一行
            var i = parseInt(questionlist.rows.length);
            var newTr = questionlist.insertRow();
            //添加列
            var newTdVoid1 = newTr.insertCell();
            var newTdVoid2 = newTr.insertCell();
            var newTdCategory = newTr.insertCell();
            var newTdType = newTr.insertCell();
            var newTdTitle = newTr.insertCell();
            var newTdAnswer = newTr.insertCell();
            var newTdScore = newTr.insertCell();
            var newTdOp = newTr.insertCell();
            //设置列内容和属性

            newTdCategory.innerHTML = '<input type="text" class="form-control" name="addcategory" placeholder="适用课程">';
            newTdType.innerHTML = '<input type="text" class="form-control" name="addtype" placeholder="题目类型" >';
            newTdTitle.innerHTML = '<input type="text" class="form-control" name="addtitle" placeholder="题目内容">';
            newTdAnswer.innerHTML = '<input type="text" class="form-control" name="addanswer" placeholder="答案" >'+
                '<input type="text" class="form-control" name="addoptiona" placeholder="A" >'+
                '<input type="text" class="form-control" name="addoptionb" placeholder="B" >'+
                '<input type="text" class="form-control" name="addoptionc" placeholder="C" >'+
                '<input type="text" class="form-control" name="addoptiond" placeholder="D" >';
            newTdScore.innerHTML = '<input type="text" class="form-control" name="addscore" placeholder="分值" ">';
            newTdOp.innerHTML = '<input type="submit" class="btn btn-mini btn-success" id="confirm" onclick="add()" value="确认"/> '+' <input type="button" class="btn btn-mini btn-warning" value="取消" onclick="delrow()"/> ';

        }


        function delrow(){
            var cGetRow = window.event.srcElement.parentElement.parentElement.rowIndex;
            questionlist.deleteRow(cGetRow);

        }

        function add() {
            document.addAndDel.action="${pageContext.request.contextPath}/question/add.do?id=${one.id}";
            document.addAndDel.submit();
        }

        function del() {
            document.addAndDel.action="${pageContext.request.contextPath}/question/delQuestions.do";
            document.addAndDel.submit();
        }

        function search() {
            document.search.action="${pageContext.request.contextPath}";
            document.search.submit();
        }

        $(function() {

            var $table = $("questionlist");

            var currentPage = 1;

            var pageSize = 3;

            var sumRows = $table.find("tbody tr").length;

            var sumPages = Math.ceil(sumRows/pageSize);

            init();

            paging(currentPage);

            $("#prev").click(function(){

                currentPage--;

                init();

                paging(currentPage);

            });

            $("#next").click(function(){

                currentPage++;

                init();

                paging(currentPage);

            });

            var $page = $("<div class='page'></div>");

            for(var pageIndex=1;pageIndex<=sumPages;pageIndex++){

                $("<a href='#'><span>["+(pageIndex)+"]</span></a>").bind("click",{"newPage":pageIndex},function(event){

                    currentPage=event.data["newPage"];

                    init();

                    paging(currentPage);

                }).appendTo($page);

            }

            $page.insertAfter($table);

            function paging(currentPage){

                $table.find("tbody tr:not(.prevnext)").hide().slice((currentPage-1)*pageSize,(currentPage)*pageSize).show();

                $("#currentPage").val(currentPage+1);

                $("#currentPage").text(currentPage);

                $("#sumPages").text(sumPages);

            }

            function init(){

                if(currentPage==1){

                    $("#prev").attr({"disabled":"disabled"});

                }else{

                    $("#prev").removeAttr("disabled");

                }

                if(currentPage==sumPages){

                    $("#next").attr({"disabled":"disabled"});

                }else{

                    $("#next").removeAttr("disabled");

                }

            }

        })
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
                                    <th>操作</th>
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
                                            <td>
                                                <a href="${pageContext.request.contextPath}/question/delete.do?qID=${temp.qID}"><button type="button" class="btn btn-xs btn-danger" value="delete"><i class="icon-remove"></i></button></a>
                                            </td>
                                        </tr>
                                </c:forEach>



                                </tbody>
                            </table>
                            <div class="widget-foot">

                                <div class="uni pull-left">
                                    <button type="button" class="btn btn-xs btn-success" onclick="addrow()">添加题目</button>
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
<script>
    tippy('.btn',{
        placement: 'bottom',
        animation: 'scale',
        arrow: true})
</script>
</body>

</html>
