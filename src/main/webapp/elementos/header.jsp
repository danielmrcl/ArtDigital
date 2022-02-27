<%@page import="java.util.List"%>
<%@page import="entity.Categoria"%>
<%@page import="entity.dao.CategoriaDAO"%>
<%@page import="entity.Usuario"%>
<body style="background-color: #F0F8FF">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between p-3 mb-4 border-bottom"
		style="background-color: #EEDD82;">
		
		<div class="container">
			<div class="row">
				<div class="col-sm">
					<a href="./index.jsp"
						class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
						<img src="./img/logo.png" alt="Inicio" height="50">
					</a>
				</div>
				<div class="col-sm btn-group">
					<ul
						class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
						<li><a class="btn btn-primary px-2 mx-2 border-0 dropdown-toggle"
							style="background-color: #8dcaff; color: black"
							href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"><strong>Categorias</strong></a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<%
								List<Categoria> categorias = CategoriaDAO.retornaCategorias();
								for (Categoria cat : categorias) {
								%>
								<li><a class="dropdown-item"
									href="./index.jsp?categoria=<%=cat.getId()%>"><%=cat.getDescricao()%></a></li>
								<%
								}
								%>
							</ul></li>
						<li><a 
							href="./sobre.jsp" 
							class="btn btn-primary px-2 mx-2 border-0" style="background-color: #8dcaff; color: black"><strong>Sobre</strong></a></li>
						<li>
						<a href="./anunciar.jsp" class="btn btn-primary px-2 mx-2 border-0"
							style="background-color: #CD5C5C; font-weight: bold; color: black">
							Anunciar </a>
						</li>
					</ul>
				</div>
				<div class="col-sm">
					<div class="col text-end">

						<%
						if (session.getAttribute("usuarioValidado") != null) {
							Usuario headerLogin = (Usuario) session.getAttribute("usuarioValidado");
						%>
						<a class="btn btn-secundary mx-2" style="border-radius: 0px"
							href="./minha-conta.jsp" role="button" id="headerButtonLogin"><%=headerLogin.getNome()%></a>
						<a href="./carrinho.jsp" class="my-2"> <img
							src="./img/cart.png" alt="Carrinho" height="30">
						</a> 
						<a class="btn btn-primary mx-2 border-0"
							style="background-color: #8dcaff; color: black"
							href="./processamentos/RealizarLogout.jsp" role="button"
							id="headerButtonLogin">Sair</a>
						<%
						} else {
						%>
						<a class="btn btn-primary mx-2 border-0" style="background-color: #8dcaff; color: black"
							href="./login.jsp" role="button" id="headerButtonLogin">Entrar</a>
						<a class="btn btn-primary mx-2 border-0" style="background-color: #8dcaff; color: black"
							href="./cadastro.jsp" role="button" id="headerButtonSignup">Cadastrar</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
