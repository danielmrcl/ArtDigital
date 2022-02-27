<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<%@include file='elementos/bootstrap5.html' %>

    <title>Cadastro | ArtDigital</title>
</head>
<body>
    <%@include file='elementos/header.jsp' %>
    
    <script type="text/javascript">
    	document.getElementById('headerButtonSignup').classList.add("disabled");
    	
    	function trocarLabel($i) {
    		var documentoInput = document.getElementById('documentoInput');
    		
    		documentoInput.placeholder = $i;
    		
    		if (documentoInput.hasAttribute('disabled')) {
    			documentoInput.removeAttribute('disabled');
    		} 
    		
    		if ($i === 'CPF') {
    			documentoInput.pattern = ".{11,11}";
    			documentoInput.title = "O campo CPF deve ter 11 dígitos e sem pontuação"
    		} else if ($i === 'CNPJ') {
    			documentoInput.pattern = ".{14,14}";
    			documentoInput.title = "O campo CNPJ deve ter 14 dígitos e sem pontuação"
    		}
    	}
    	
    	function submeterCadastro() {
    		// Validando campos com espaço
    		if (verificarCamposComEspaco(['documentoInput', 'emailInput', 'cepInput'])) {
    			return;
    		}
    		
    		if (document.getElementById('documentoInput').hasAttribute('disabled')) {
    			alert('O campo CPF/CNPJ deve ser preenchido!');
    			return;
    		}
    		
    		// Validando e submetendo formulário 
    		document.getElementById('formularioCadastro').requestSubmit();
    	}
    	
    	function verificarCamposComEspaco($param) {
    		for (let i = 0; i < $param.length; i++) {
    			var element  = document.getElementById($param[i]);
    			element.value = element.value.trim();
    			
    			if (element.value.includes(' ')) {
   					alert('O campo '+ element.placeholder +' não pode ter espaços!');
   					return true;
    			}
    		}
    		return false;
		}
    </script>
    
    <main>
      <div class="container px-5 py-1">
      	<div class="p-3 my-3 mx-auto" 
	      	style="background-color: #C5E3FF; 
	      	border-radius: 15px; 
	      	max-width: 700px">
      		<div class="text-center">
	          <p>Digite abaixo os dados para cadastrado no sistema!</p>
	        </div>
	        <form id="formularioCadastro" 
	        	action="UsuarioCadastroServlet"
	        	method="post" 
	        	class="row g-3 justify-content-center mx-auto">
	          <label class="form-label">Informações de Usuario</label>
	          <div class="col-md-12">
	            <input type="text"
	            	style="background-color: #c2c2c2"
	            	class="form-control"
	            	id="nomeInput"
	            	name="nomeInput"
	            	placeholder="Nome"
	            	required>
	          </div>
	          <div class="col-md-2">
	            <select id="tipoInput" 
            		style="background-color: #c2c2c2"
	            	name="tipoInput" 
	            	class="form-control" 
	            	onchange="trocarLabel(value);">
	              <option selected disabled value="Escolha">Escolha</option>
	              <option value="CPF">CPF</option>
	              <option value="CNPJ">CNPJ</option>
	            </select>
	          </div>
	          <div class="col-md-10">
	            <input type="text" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="documentoInput" 
	            	name="documentoInput" 
	            	placeholder="CPF/CNPJ" 
	            	required 
	            	pattern="" 
	            	title="" 
	            	disabled>
	          </div>
	          <div class="col-md-12">
	            <input type="email" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="emailInput" 
	            	name="emailInput" 
	            	placeholder="Email" 
	            	required>
	          </div>
	          <div class="col-md-6">
	            <input type="password" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="passwordInput1" 
	            	name="passwordInput1" 
	            	placeholder="Senha" 
	            	required pattern=".{8,}" 
	            	title="A senha deve ter mais de 8 caracteres!">
	          </div>
	          <div class="col-md-6">
	            <input type="password" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="passwordInput2" 
	            	name="passwordInput2" 
	            	placeholder="Confirmação de senha" 
	            	required 
	            	pattern=".{8,}" 
	            	title="A senha deve ter mais de 8 caracteres!">
	          </div>
	          <label class="form-label">Informações de Endereço</label>
	          <div class="col-md-3">
	            <input type="text" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="cepInput" 
	            	name="cepInput" 
	            	placeholder="CEP" 
	            	pattern=".{8,8}" 
	            	title="O campo CEP deve ter 8 dígitos e sem pontuação">
	          </div>
	          <div class="col-md-6">
	            <input type="text" 
            		style="background-color: #c2c2c2"
		            class="form-control" 
		            id="ruaInput" 
		            name="ruaInput" 
		            placeholder="Rua">
	          </div>
	          <div class="col-md-3">
	            <input type="number" 
            		style="background-color: #c2c2c2"
		            class="form-control" 
		            id="numeroInput" 
		            name="numeroInput" 
		            placeholder="Número">
	          </div>
	          <div class="col-md-6">
	            <input type="text" 
            		style="background-color: #c2c2c2"
		            class="form-control" 
		            id="cidadeInput" 
		            name="cidadeInput" 
		            placeholder="Cidade" 
		            required>
	          </div>
	          <div class="col-md-6">
	            <input type="text" 
            		style="background-color: #c2c2c2"
	            	class="form-control" 
	            	id="bairroInput" 
	            	name="bairroInput" 
	            	placeholder="Bairro" 
	            	required>
	          </div>
	          <div class="col-md-12">
	            <div class="form-check">
	              <input class="form-check-input" 
	              	type="checkbox" 
	              	id="gridCheck" 
	              	name="gridCheck" 
	              	required>
	              <label class="form-check-label" for="gridCheck">
	                Confirmo que meus dados foram digitados corretamente!
	              </label>
	            </div>
	          </div>
	          <div class="col-md-12">
	            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
	              <a href="#" class="btn btn-primary" onclick="submeterCadastro()">Continuar</a>
	            </div>
	          </div>
	        </form>
      	</div>
      </div>
    </main>
</body>
</html>