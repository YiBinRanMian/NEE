<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="">
	<!-- Stylesheets -->
	<link href="../../static/style/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="../../static/style/font-awesome.css">
	<link href="../../static/style/style.css" rel="stylesheet">
	<link href="../../static/style/bootstrap-responsive.css" rel="stylesheet">

	<!-- HTML5 Support for IE -->
	<!--[if lt IE 9]>
	<script src="../../static/js/html5shim.js"></script>
	<![endif]-->

	<!-- Favicon -->
	<link rel="shortcut icon" href="../../static/img/favicon/favicon.png">
</head>

<body>

<!-- Form area -->
<div class="error-page">
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<!-- Widget starts -->
				<div class="widget">
					<!-- Widget head -->
					<div class="widget-head">
						<i class="icon-question-sign"></i> Error
					</div>

					<div class="widget-content">
						<div class="padd error">

							<h1>${info}</h1>
							<p> 有问题请咨询管理员 </p>
							<br />

							<form class="form-inline">
								<div class="form-group">
									<input type="text" value="" name="s" id="s" class="form-control"/>
								</div>
								<button type="submit" class="btn btn-default">提交错误</button>
							</form>

							<br />
							<div class="horizontal-links">
								<c:if test="${no eq '0'}">
									<a href="../../login.html">重新登录</a>
								</c:if>
								<c:if test="${no eq '1'}">
									<a href="${pageContext.request.contextPath}/user/login.do">返回主页</a>
								</c:if>
								 | <a href="#">About Us</a> | <a href="#">Contact us</a> | <a href="#">FAQ</a>
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
</div>



<!-- JS -->
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/bootstrap.js"></script>
</body>
</html>