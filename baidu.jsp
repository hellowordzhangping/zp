<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'find.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").hide();
		$("input[type='text']").keyup(function() {
			var u_v = $("input[type='text']").val();
			var params = {
				username : u_v,
			};
			$.ajax({
				url : "Text_execute",
				type : "post",
				data : params,
				dataType : "json",
				success : function(data, textStatus) {
					$("#list").empty();
					/* var d = eval("("+data+")"); */
					/* JSON.parse() */
					var arr = data.usernameList;
					
					$.each(arr, function(i, val) {
						if (arr[i].indexOf(u_v) != -1) {
							$("#list").append("<p>" + u_v + "<strong>" + arr[i].substring(arr[i].indexOf(u_v) + u_v.length, arr[i].indexOf(u_v).length) + "</strong>" + "</p>");
							if (u_v != "") {
								$("#list").show();
							} else {
								$("#list").hide();

							}
						}
						$("p").mouseenter(function() {
							$(this).css("cursor", "pointer");
						}).mousedown(function() {
							$(this).css("cursor", "pointer");
						}).mouseup(function() {
							$(this).css("cursor", "default");
						});
						$("p").click(function() {
							$("input[type='text']").val($(this).text());
							$("#list").hide();
						});

					});

				},
				error : function(data, textStatus) {
					alert("error");
					return false;
				},
			});
		});

	});
</script>
</head>

<body>
	百度：
	<input name="username" type="text" />
	<div>
		<div id="list"
			style="border:1px solid #ccc;width:175px;margin-left: 55px;background-color:#CCC"></div>
	</div>
</body>
</html>