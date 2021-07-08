<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;IE=edge;telephone=no;">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<meta name="format-detection"/>
	<title>資材管理システム</title>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/jstemp-initializer.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.min.css" />
	<link rel="shortcut icon" href="/resources/images/sizai.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/sizai.ico" type="image/x-icon">
</head>
<script type="text/javascript">
$(document).ready(function(){
	LoginScript.init();
})

var LoginScript = {
	init : function(){
		
	},
	login : function(){
		var id = $('input[name=id]');
		var password = $('input[name=password]');
		if(id.val() == ''){
			alert('IDを入力してください。');
			id.focus();
			return;
		}else if(password.val() == ''){
			alert('パスワードを入力してください。');
			password.focus();
			return;
		}
		var param = {
			userId : id.val(),
			userPw : password.val()
		}
		$.ajax({
			type : 'POST',
			url : '/login/api/login',
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			error : function(xhr, status, error){
				console.log(error);
				CommonScript.closeLoading();
			},
			success : function(json){
				console.log(json);
				if(json.code == 'noUser'){
					alert('一致するIDがありません。');
				}else if(json.code == 'noPassword'){
					alert('パスワードが異なります。');
				}else if(json.code == 'success'){
					location.href = '/main'
				}
			}
		})
	}
}
</script>
<body>
<div class="body">
	<div class="login_form">
		<div class="login_pic"><img src="/resources/images/login-pic.jpg"/></div>
		<div class="login_input">
			<span>資材管理システム</span>
			<div class="input_form">
				<input type="text" name="id"/>
				<input type="password" name="password"/>
			</div>
			<button onclick="LoginScript.login()">ログイン</button>
		</div>
	</div>
</div>
</body>
</html>