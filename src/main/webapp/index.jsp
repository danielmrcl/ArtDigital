<%@page import="java.util.Base64"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="entity.Produto"%>
<%@page import="java.util.List"%>
<%@page import="entity.dao.ProdutoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file='elementos/bootstrap5.html' %>
    
    <title>Início | ArtDigital</title>
</head>
<body>
    <%@include file='elementos/header.jsp' %>
    
    <%
    String buscar = request.getParameter("buscar");
    List<Produto> produtos = ProdutoDAO.listarProdutos(buscar);
    %>
    
    <main class="flex-shrink-0">
      <div class="container px-5 py-1">
        <%@include file='elementos/message-handler.jsp'%>
        <div>
          <form action="index.jsp" method="get" class="d-flex">
            <input id="buscar" name="buscar" class="form-control me-2" style="border-radius: 0px; background-color: #c2c2c2" type="search" placeholder="Pesquisar" aria-label="Search">
            <button class="btn btn-primary" style="border-radius: 0px" type="submit">Pesquisar</button>
          </form>
        </div>
        <div>
        	<p>Resultados <% if (buscar != null) out.print("para \"" + buscar + "\""); %> (<%= produtos.size() %>)</p>
        </div>
        
        <div class="row">
        <% for (Produto produto : produtos) { %>
        	<div class="col-12 col-md-6 col-lg-4" >
				<div class="p-3 my-3" style="background-color: #C5E3FF; border-radius: 15px">
					<img src="data:<%= produto.getImagem().getTipo() %>;base64,<%= Base64.getEncoder().encodeToString(produto.getImagem().getBytes()) %>"
							style="object-fit: cover; border-radius: 15px;"
							height=300px width=100%
							alt="Foto do produto">
					<a href="./produto.jsp?id=<%= produto.getId() %>" style="color: black; text-decoration: none">
						<div class="d-flex flex-row justify-content-between m-2">
							<h5><%= produto.getNome() %></h5>
							<h5>R$ <%= String.format("%.2f", produto.getValorUnit()) %></h5>
						</div>
					</a>
					<div class="d-flex flex-row justify-content-center">
						<button class="btn btn-primary mx-2">Comprar</button>
						<button class="btn btn-primary mx-2">Adicionar ao carrinho</button>
					</div>
				</div>
			</div>
        <% } %>
        </div>
      </div>
    </main>
</body>
</html>