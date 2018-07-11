<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 2018/7/12
  Time: 上午12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>警告</title>
</head>
<body>
<script>
    alert("教师、编辑、审核、教研组不能删除!");
    location.href="${pageContext.request.contextPath}/user/login.do";
</script>

</body>
</html>
