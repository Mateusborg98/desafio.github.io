<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.jsp"%>
<title>Home Voxus</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="header col-sm-12 col-md-12 col-lg-12">
		<h1>Vamos alterar sua task</h1>
	</div>
	<form class="formulario col-sm-12 col-md-8 col-lg-5"
		action="Controller" method="post">
		<input type="hidden" name="acao" value="alterar">
		<div class="form-group">
			<label>Titulo da task:</label> <label>${tasks.nome}</label> <input
				type="text" class="form-control" name="nome"
				placeholder="De um título a sua task" value="${tasks.nome}">
		</div>
		<div class="form-group">
			<label>Descrição:</label>
			<textarea class="form-control" name="descricao" rows="5" cols="10"
				placeholder="Descreva a função de sua task...">${tasks.descricao}</textarea>
		</div>
		<div class="form-group">
			<label>Anexos da task (Opcional):</label> <input type="file"
				class="btn btn-default" name="arquivo" value="">
		</div>
		<div class="form-group">
			<label>Pioridade (De 1 à 5):</label> <input type="number" min="0"
				max="5" class="form-control" name="prioridade"
				value="${tasks.prioridade}">
		</div>
		<div class="form-group">
			<label>Usuário responsável:</label> <input type="text"
				class="form-control" name="usuario"
				placeholder="Escreva seu nome completo" value="${tasks.usuario}">
		</div>
		<div class="form-group">
			<div class="checkbox">
				<label>Estado (Done ou Processing)</label>
				<input type="text"
				class="form-control" name="done"
				placeholder="Estado (Done ou Processing)"">
			</div>
		</div>
		<input type="submit" class="btn btn-primary" value="Alterar">
	</form>
	<div class="footer col-sm-12 col-md-12 col-lg-12">
		<h5>&copy Mateus Borgonovi Francisco - 2017</h5>
	</div>
</body>
<script>
	function CBSelectedValueToTrue(cb) {
		if (cb.checked) {
			cb.value = "true";
		}
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
</script>
</html>