<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apis.google.com/js/api.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="452342451928-cq344osksmvf520sl7rijhi951fuddms.apps.googleusercontent.com">
<%@ include file="header.jsp"%>
<title>Home Voxus</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		<div class="navbar-header"> 
			<a class="navbar-brand" href="home.jsp">Voxus</a> 
		</div> 
			<ul class="nav navbar-nav">
				<li><a href="create.jsp">Criar</a></li>
				<li><a href="delete.jsp">Deletar</a></li>
				<li><a href="update.jsp">Edição</a></li>
				<li><a href="view.jsp">Leitura</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp" class="glyphicon glyphicon-log-out"	onclick="signOut();"> Sair</a></li>
			</ul>
		</div>
	</nav>
	<div class="header col-sm-12 col-md-12 col-lg-12">
		<h1>Bem vindo ${nome}</h1>
	</div>
</body>
<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
</script>
</html>