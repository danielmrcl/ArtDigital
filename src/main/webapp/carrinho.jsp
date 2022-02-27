<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file='elementos/bootstrap5.html'%>
<title>Carrinho | ArtDigital</title>
</head>
<body>
    <%@include file='elementos/header.jsp' %>
    
	<div class="container px-5 py-1">
		<%@include file='elementos/message-handler.jsp'%>
		<div class="p-3 my-3 mx-auto"
			style="background-color: #C5E3FF; border-radius: 15px; max-width: 1000px">

			<div class="row">
				<!-- Nome -->
				<div class="col">Nome</div>
				<!-- Quantidade -->
				<div class="col">7</div>
				<!-- Valor total -->
				<div class="col">R$19.99</div>
				<!-- Delete -->
				<div class="col">
					<button type="button" class="btn btn-danger"
						onclick="botaoDeletarProduto()">
						Deletar<i class="bi bi-trash-fill"></i>
					</button>
				</div>
				<!-- Editar -->
				<div class="col">
					<button type="button" class="btn btn-success"
						onclick="botaoEditarProduto()">
						Editar <i class="bi bi-pencil-fill"></i>
					</button>
				</div>
			</div>
			
			<div class="row">
				<!-- Nome -->
				<div class="col">Nome</div>
				<!-- Quantidade -->
				<div class="col">7</div>
				<!-- Valor total -->
				<div class="col">R$19.99</div>
				<!-- Delete -->
				<div class="col">
					<button type="button" class="btn btn-danger"
						onclick="botaoDeletarProduto()">
						Deletar<i class="bi bi-trash-fill"></i>
					</button>
				</div>
				<!-- Editar -->
				<div class="col">
					<button type="button" class="btn btn-success"
						onclick="botaoEditarProduto()">
						Editar <i class="bi bi-pencil-fill"></i>
					</button>
				</div>
			</div>
			
			<div class="row">
				<!-- Nome -->
				<div class="col">Nome</div>
				<!-- Quantidade -->
				<div class="col">7</div>
				<!-- Valor total -->
				<div class="col">R$19.99</div>
				<!-- Delete -->
				<div class="col">
					<button type="button" class="btn btn-danger"
						onclick="botaoDeletarProduto()">
						Deletar<i class="bi bi-trash-fill"></i>
					</button>
				</div>
				<!-- Editar -->
				<div class="col">
					<button type="button" class="btn btn-success"
						onclick="botaoEditarProduto()">
						Editar <i class="bi bi-pencil-fill"></i>
					</button>
				</div>
			</div>

			<div class="row">
				<div class="col align-self-end">
					<button type="button" class="btn btn-primary">Finalizar
						Pedido</button>
				</div>
			</div>

		</div>

	</div>
</body>
</html>