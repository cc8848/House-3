<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>房屋管理</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" type="text/css"
	href="../resources/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="../resources/lib/font-awesome/css/font-awesome.css">

<script src="../resources/lib/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="../resources/lib/js/bootstrap-paginator.min.js"
	type="text/javascript"></script>


<link rel="stylesheet" type="text/css"
	href="../resources/stylesheets/theme.css">
<link rel="stylesheet" type="text/css"
	href="../resources/stylesheets/premium.css">

</head>
<body class=" theme-blue">
	<c:set var="pageSize" value="7"></c:set>
	<c:set var="totalPageTemp"
		value="${totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+0.5 }"></c:set>
	<fmt:formatNumber var="totalPage" type="number"
		value="${totalPageTemp }" maxFractionDigits="0"></fmt:formatNumber>
	<c:choose>
		<c:when test="${empty param.curPage }">
			<c:set var="curPage" value="1"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="curPage" value="${param.curPage }"></c:set>
		</c:otherwise>
	</c:choose>
	<!-- Demo page code -->

	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand,.navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="../assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="../assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="../assets/ico/apple-touch-icon-57-precomposed.png">


	<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
	<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
	<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
	<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->

	<!--<![endif]-->

	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="" href="index.html"><span class="navbar-brand"><span
					class="fa fa-paper-plane"></span> Aircraft</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position:relative;top: 3px;"></span> ${admin.adminname } <i
						class="fa fa-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a href="./">My Account</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Admin Panel</li>
						<li><a href="./">Users</a></li>
						<li><a href="./">Security</a></li>
						<li><a tabindex="-1" href="./">Payments</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="sign-in.html">Logout</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</div>


	<div class="sidebar-nav">
      	<ul>
      		<li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> Dashboard<i class="fa fa-collapse"></i></a></li>
      		<li><ul class="dashboard-menu nav nav-list collapse in">
      			<li><a href="<%=request.getContextPath()%>/admin/index"><span class="fa fa-caret-right"></span>主页</a></li>
      			<li ><a href="<%=request.getContextPath()%>/admin/userList"><span class="fa fa-caret-right"></span>用户列表</a></li>
      			
      			<li ><a href="<%=request.getContextPath()%>/admin/houseList"><span class="fa fa-caret-right"></span> 房屋列表</a></li>
      			<li ><a href="<%=request.getContextPath()%>/admin/traRecordsList"><span class="fa fa-caret-right"></span>交易记录</a></li>
      		</ul></li>
      	</ul>
      </div>

	<div class="content">
		<div class="header">

			<h1 class="page-title">Users</h1>
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Users</li>
			</ul>

		</div>
		<div class="main-content">

			<div class="btn-toolbar list-toolbar">
				<a href="addUser" class="btn btn-primary"> <i class="fa fa-plus"></i>新增用户
				</a>

				<div class="btn-group"></div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>用户编号</th>
						<th>用户姓名</th>
						<th>用户密码</th>
						<th>用户性别</th>
						<th>用户所在地</th>
						<th>用户联系方式</th>
						<!-- <th>发布时间</th> -->

						<th style="width: 3.5em;"></th>
					</tr>
				</thead>
				<tbody id="example">
					<c:forEach items="${userList }" var="user" varStatus="status"
						begin="${pageSize*(curPage-1) }" end="${pageSize*curPage-1 }">
						<tr>
							<td>${user.userId }</td>
							<td>${user.userName }</td>
							<td>******</td>
							<td>${user.userGender }</td>
							<td>${user.userAddress }</td>
							<td>${user.userPhone }</td>
							<td><a href="${user.userName }"><i class="fa fa-pencil"></i></a>
								<a href="javascript:deleteHouse('${user.userName }')" role="button" ><i
									class="fa fa-trash-o"></i></a>
									</td>
						</tr>





					</c:forEach>
				</tbody>
			</table>

			<ul class="pagination">
				<li><a
					href="<%=request.getContextPath()%>/admin/userList?curPage=1">&laquo;</a></li>
				<li><a
					href="<%=request.getContextPath()%>/admin/userList?curPage=1">1</a></li>
				<li><a
					href="<%=request.getContextPath()%>/admin/userList?curPage=2">2</a></li>
				<li><a
					href="<%=request.getContextPath()%>/admin/userList?curPage=3">3</a></li>
				<li><a
					href="<%=request.getContextPath() %>/admin/userList?curPage=${totalPage }">&raquo;</a></li>
			</ul>




			<footer>
				<hr>



				<p></p>
			</footer>
		</div>
	</div>


	<script src="../resources/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>


</body>
<script type="text/javascript" language="javascript">
	/* 删除用户时的确认信息 */
function deleteHouse1(userName){
//js 原生确认对话框函数
if(confirm("是否确认删除该用户？")){
	//当用户点击确定按钮
	window.location.href = "<%=request.getContextPath() %>/admin/delete/"+userName;

}

}
</script>
</html>
