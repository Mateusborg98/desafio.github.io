<%@ include file="header.jsp"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="create.jsp">Voxus</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="create.jsp">Início</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Listar<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
						<c:url value="Controller" var="link1">
							<c:param name="acao" value="listarPorNome" />
							<c:param name="nome" value="${tasks.nome}" />
							<c:param name="descricao" value="${tasks.descricao}" />
							<c:param name="prioridade" value="${tasks.prioridade}" />
							<c:param name="status" value="${tasks.status}" />
							<c:param name="done" value="${tasks.done}" />
							<c:param name="usuario" value="${tasks.usuario}" />
						</c:url> 
						<a href="${link1}">Listar Pelo Título</a>
					</li>
					<li>
						<c:url value="Controller" var="link">
							<c:param name="acao" value="listarPorUser" />
							<c:param name="nome" value="${tasks.nome}" />
							<c:param name="descricao" value="${tasks.descricao}" />
							<c:param name="prioridade" value="${tasks.prioridade}" />
							<c:param name="status" value="${tasks.status}" />
							<c:param name="done" value="${tasks.done}" />
							<c:param name="usuario" value="${tasks.usuario}" />
						</c:url> 
						<a href="${link}">Listar Pelo Usuario</a>
					</li>
				</ul>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">${nome}<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="index2.jsp" onclick="signOut();">Sair</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>