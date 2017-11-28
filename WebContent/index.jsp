<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="452342451928-cq344osksmvf520sl7rijhi951fuddms.apps.googleusercontent.com">
	<%@ include file="header.jsp" %>
</head>
<body>
	<c:if test="${not empty msg}">
			<div class="alert alert-success">${msg}</div>
	</c:if>
	<form action="Controller" method="post">
		<input type="hidden" name="acao" value="login">
		<div class="form-group">
			<label>Nome</label>
			<input type="text" name="nome" class="form-control">
		</div>
		<div class="form-group">
			<label>E-mail</label>
			<input type="email" name="email" class="form-control">
		</div>
		<div class="form-group">
			<label>Senha</label>
			<input type="password" name="senha" class="form-control">
		</div>
		<input type="submit" value="Login" class="btn btn-success"> 
	</form>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<p id="msg"></p>
</body>
<script type="text/javascript">
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			var userID = profile.getId();
			var userName = profile.getName();
			var userPicture = profile.getImageUrl();
			var userEmail = profile.getEmail();
			var userToken = googleUser.getAuthResponse().id_token;
			
			//document.getElementById('msg').innerHTML = userEmail;
			if(userName !== '') {
				var dados = {
					userID:userID,
					userName:userName,
					userPicture:userPicture,
					userEmail:userEmail
				};
				$.post("valida.php", dados, function(retorna) {
					document.getElementById('msg').innerHTML = retorna;
				});
			}else {
				var msg = "UsuÃ¡rio nÃ£o encontrado!";
				document.getElementById('msg').innerHTML = msg;
			}
		}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>