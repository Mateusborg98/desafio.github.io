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
<title>Voxus</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<h1>Lista de Tasks</h1>
		<c:if test="${not empty msg}">
			<div class="alert alert-success">${msg}</div>
		</c:if>
		<h3>Lista de tasks pelo responsável</h3>
		<label>Usuário</label>
		<form action="Controller">
			<input type="hidden" name="acao" value="listarPorUser">
			<input type="text" name="nome" class="form-control "><br>
			<input type="submit" value="Buscar" class=" btn btn-success">
		</form><br>
		<table class="table">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Prioridade</th>
				<th>Status</th>
				<th>Done</th>
				<th>Usuário</th>
				<th></th>
				<th></th>
			</tr>
			<c:forTokens items="${tasks}" var="t" delims=",">
				<c:if test="${tasks.status != null}">
					<tr>
						<td>${tasks.nome}</td>
						<td>${tasks.descricao}</td>
						<td>${tasks.prioridade}</td>
						<td>${tasks.status}</td>
						<td>${tasks.done}</td>
						<td>${tasks.usuario}</td>
						<td><c:url value="Controller" var="link1">
								<c:param name="acao" value="alterar" />
								<c:param name="nome" value="${tasks.nome}" />
								<c:param name="descricao" value="${tasks.descricao}" />
								<c:param name="prioridade" value="${tasks.prioridade}" />
								<c:param name="status" value="${tasks.status}" />
								<c:param name="done" value="${tasks.done}" />
								<c:param name="usuario" value="${tasks.usuario}" />
							</c:url> <a href="${link1}" class="glyphicon glyphicon-pencil"></a></td>
						<td><c:url value="Controller" var="link">
								<c:param name="acao" value="remover" />
								<c:param name="nome" value="${tasks.nome}" />
							</c:url> <a href="${link}" class="glyphicon glyphicon-trash"></a></td>
					</tr>
				</c:if>
			</c:forTokens>
		</table>
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