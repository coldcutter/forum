<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" type="text/css" href="css/nav.css">

<c:if test="${sessionScope.user != null and sessionScope.user.status != 'admin' }">
<script src="js/message.js"></script>
</c:if>
<nav id="globalnav" class="navbar navbar-default" role="navigation" style="margin-bottom:50px;background-color: rgb(240, 246, 243);font-color: rgb(3, 123, 130);">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="padding-left:55px">
      <a class="navbar-brand" href="#"><strong style="font-size:2em">豆比小组</strong></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="" id="bs-example-navbar-collapse-1" style="padding-right:50px">
      <ul class="nav navbar-nav">
        <li ><a href="#">精选</a></li>
        <li><a href="#">文化</a></li>
        <li><a href="#">科技</a></li>
      </ul>
      <form class="navbar-form navbar-left" action="group/search" method="get" role="search">
        <div class="form-group">
          <input type="hidden" name="cat" value="topic">
          <input type="text" name="q" class="form-control" placeholder="小组、话题、用户">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <c:choose>
          <c:when test="${sessionScope.user != null and sessionScope.user.status == 'admin' }">
          <li>
          	<a href="admin/home">管理员</a>
          </li>
          </c:when>
          <c:when test="${sessionScope.user != null and sessionScope.user.status != 'admin'}">
          	<li class="dropdown">
          		<a id="msgreminder" href="#" class="dropdown-toggle" data-toggle="dropdown">
          			<span class="glyphicon glyphicon-comment"></span>
          		</a>
          		<ul id="msgcontainer" class="dropdown-menu" role="menu" style="min-width:200px">
          			<span class="text-muted">消息提醒</span>
          			<li class="divider"></li>
          		</ul>
          	</li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.nickname} <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="group">我的小组</a></li>
                <li><a href="user/${sessionScope.user.userId }">我的主页</a>
                <li><a href="user/userinfo">修改个人信息</a></li>
                <li><a href="user/avatar">修改／上传头像</a></li>
                <li><a href="static/j_spring_security_logout?redirect=index.html">登出</a></li>
              </ul>
            </li>
          </c:when>
          <c:otherwise>
            <li><a href="user/login">登录</a></li>
            <li><a href="user/register">注册</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="modal fade" id="reminderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Message</h4>
				</div>
				<div class="modal-body">
					<p id="remindermessage"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
</div>