<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="entity.Categoria"%>
<%@page import="entity.dao.CategoriaDAO"%>
<%@page import="entity.dao.UsuarioDAO"%>
<%@page import="entity.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file='elementos/bootstrap5.html'%>

<title>Anunciar do Produto | ArtDigital</title>
</head>
<body>

	<%@include file='elementos/header.jsp'%>
	<script>
		function onCalcular() {
			var valor, custo, vlrHrs = 0;
			var horasTrab = document.getElementById("horasTrab");

			if (horasTrab.value != '') {
				var texto = horasTrab.value.split(':');

				if (parseInt(horasTrab.value.replace(":", "")) != 0) {
					var horasMinutos = parseInt(texto[0]) * 60;
					valor = (horasMinutos + parseInt(texto[1])) / 60;
				} else {
					document.getElementById("alertModal").innerHTML = "As horas trabalhas não podem ser "
							+ horasTrab.value + "!";
					document.getElementById("alertModal").classList
							.remove("d-none");
					return;
				}

				var vlrHora = document.getElementById("vlrHora");

				if (vlrHora.value == '') {
					vlrHrs = 0;
				} else {
					vlrHrs = parseInt(vlrHora.value);
				}

				var custos = document.getElementById("custos");

				if (custos.value == '') {
					custo = 0;
				} else {
					custo = parseInt(custos.value);
				}

				var result = (valor * vlrHrs) + custo;

				document.getElementById("result").value = parseFloat(result)
						.toFixed(2);

			} else {
				document.getElementById("alertModal").innerHTML = "As horas trabalhas não podem ser vazio!";
				document.getElementById("alertModal").classList
						.remove("d-none");
			}

		}

		function onAplicar() {

			var valor = document.getElementById("result").value;

			if (valor == '') {
				document.getElementById("alertModal").innerHTML = "Para aplicar o valor ele não pode ser R$ 0";
				document.getElementById("alertModal").classList
						.remove("d-none");
			} else {
				document.getElementById("preco").value = valor;
			}
		}

		function submeterProduto() {
			document.getElementById('formularioAnunciar').requestSubmit();
		}
	</script>

	<div class="container px-5 py-1">
		<%@include file='elementos/message-handler.jsp'%>
		<%
		String jwtToken = (String) session.getAttribute("usuarioToken");
		if (jwtToken != null) {
			Usuario anunciarLogin = UsuarioDAO.procurarUsuarioPorEmail(JWTUtil.verify(jwtToken).getEmail());
		%>
		<div class="p-3 my-3 mx-auto"
			style="background-color: #C5E3FF; border-radius: 15px; max-width: 1000px">
			<form id="formularioAnunciar"
				action="ProdutoServlet" method="post" enctype="multipart/form-data"
				class="row g-3 justify-content-center mx-auto">

				<div class="text-center">
					<p>Digite os dados para cadastrar o produto!</p>
				</div>

				<!-- Nome do produto -->
				<div class="col-md-12">
					<input type="text" style="background-color: #c2c2c2"
						class="form-control" placeholder="Nome do produto" id="nomeInput"
						name="nomeInput">
				</div>

				<!-- Categorias do produto -->
				<div class="col-md-2">
					<select class="form-select" style="background-color: #c2c2c2"
						id="selectInput" name="selectInput">
						<option selected disabled>Categorias</option>
						<%
						List<Categoria> categorias2 = CategoriaDAO.retornaCategorias();
						for (Categoria cat : categorias2) {
						%>
						<option value="<%=cat.getId()%>"><%=cat.getDescricao()%></option>
						<%
						}
						%>
					</select>
				</div>

				<!-- Imagem do produto  -->
				<div class="col-md-10">
					<input type="file" style="background-color: #c2c2c2"
						class="form-control" id="imagemInput" name="imagemInput">
				</div>

				<!-- Quantidade do produto -->
				<div class="col-md-12">
					<input placeholder="Quantidade no estoque"
						style="background-color: #c2c2c2" type="text" class="form-control"
						aria-describedby="addon-wrapping" id="quantidadeInput" name="quantidadeInput" type="number">
				</div>

				<!-- Preço do produto -->
				<div class="col-md-6">
					<input placeholder="Preço" type="text"
						style="background-color: #c2c2c2" class="form-control"
						aria-describedby="addon-wrapping" id="preco" name="preco" type="number">
				</div>

				<div class="col-md-6">
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#exampleModal">Calcular</button>
				</div>

				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">

								<div class="mb-3">
									<h5 class="modal-title" id="exampleModalLabel">Ajuda no
										calculo do valor R$</h5>
								</div>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>

							<div class="modal-body">
								<div class="mb-3">
									<button type="button" class="btn btn-info"
										data-bs-toggle="modal" data-bs-target="#helpModal">Buscar
										Ajuda!</button>
								</div>
								<div class="mb-3">

									<div id="alertModal" class="alert alert-danger d-none"
										role="alert"></div>

									<label for="horasTrab" class="col-form-label">Horas
										trabalhadas (00:00):</label> <input type="text" class="form-control"
										id="horasTrab" pattern="{4:100}">
								</div>
								<div class="mb-3">
									<label for="vlrHora" class="col-form-label">Valor da
										hora R$:</label> <input type="text" class="form-control" id="vlrHora">

								</div>
								<div class="mb-3">

									<label for="custos" class="col-form-label">Custos R$:</label> <input
										type="text" class="form-control" id="custos">

								</div>
								<div class="mb-3">
									<label for="result" class="col-form-label">Valor sugerido
										R$:</label> <input type="text" disabled class="form-control"
										id="result">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fechar</button>
								<button type="button" class="btn btn-danger"
									onclick="onCalcular();">Calcular</button>
								<button type="button" class="btn btn-primary"
									onclick="onAplicar();" data-bs-dismiss="modal">Aplicar
									valor</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade bd-example-modal-lg" id="helpModal"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<div class="mb-3">
									<h5 class="modal-title fs-3 fw-bold" id="exampleModalLabel">Como
										funciona a ajuda na hora de precificar os produtos?</h5>
								</div>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p class="fs-4">
									Primeiro a pessoa decide o quanto quer ganhar de salário e
									divide isso pelas horas que trabalha por mês. <br>
									Exemplo: <br> Um vendedor quer ganahr R$ 1008,00 de
									salário e quer trabalhar 06:00 horas diárias, de segunda à
									sexta. <br> Ele preenche os campos de: Dias de trabalho,
									horas trabalhadas e valor da hora. Segue o cálculo: <br> <strong>Dias
										de trabalho</strong> => 24 dias <br> <strong>Horas
										trabalhadas</strong> => 06:00 horas <br> <strong>Valor da
										hora</strong> => R$ 7,00 <br> O valor da hora é R$ 7,00 porque ele
									deseja ganhar <strong>R$ 1008,00</strong> por mês. <br>
									Cálculo: (24 x 6) x 7 = 1008 <br> Depois de saber o valor
									da hora, precisa adicionar os custos. <br> Para produzir
									um biquini de crochê precisa-se de 2 novelos de lã, cada um vai
									sair por R$ 18,00. Isso pode variar de acordo com a marca e o
									tipo de artesão que vai usar. <br> Além disso, precisa de
									tecido para fazer o forro, uma embalagem, cola e linha de
									costura. <br> Material: <br> <strong>R$
										18,00</strong> - Dois Novelos; <br> <strong>R$ 10,00</strong> -
									Uma Cola; <br> <strong>R$ 2,50</strong> - Meio metro de
									Tecido para o forro; <br> <strong>R$ 1,50</strong> -
									Embalagem; <br> <strong>R$ 2,00</strong> - Linha de
									costura. <br> Total = <strong>R$ 40,00</strong> <br>
									Tempo: <br> Horas trabalhadas (Horas) = <strong>07:00
										horas</strong> <br> Valor da hora (R$) = <strong>R$ 7,00</strong>
									<br> 7 x 7 = <strong>R$ 49,00</strong> <br> R$ 49 +
									R$ 40 = R$ 89,00 <br> O valor do biquíni vai ser no valor
									de: <strong>R$ 89,00</strong>.
								</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Descrição do produto -->
				<div class="col-md-12">
					<textarea class="form-control" style="background-color: #c2c2c2"
						aria-label="With textarea" placeholder="Descrição do produto" id="descInput" name="descInput"></textarea>
				</div>

				<div class="col-md-12">
					<div class="d-grid gap-2 d-md-flex justify-content-md-center">
						<button type="button" class="btn btn-primary"
							onclick="submeterProduto()">Anunciar</button>
					</div>
				</div>

			</form>
		</div>
		<%
		} else {
			response.sendRedirect("login.jsp");
		}
		%>

	</div>

</body>
</html>
