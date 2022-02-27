<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file='elementos/bootstrap5.html' %>
    
    <title>Entrar | ArtDigital</title>
</head>
<body>
    <%@include file='elementos/header.jsp' %>
    
    <script type="text/javascript">
    	document.getElementById('headerButtonLogin').classList.add("disabled");
    </script>
    
    <main class="flex-shrink-0">
      <div class="container px-5 py-1">
		<%@include file='elementos/message-handler.jsp'%>
      	<div class="p-3 my-3 mx-auto" style="background-color: #C5E3FF; border-radius: 15px; max-width: 500px;">
			<div class="text-center">
	        	<p>Digite suas credenciais para entrar no sistema!</p>
	        </div>
	        <form action="./processamentos/ProcessarLogin.jsp" method="post" class="row g-3 justify-content-center mx-auto" style="max-width: 500px;">
	        	<div class="col-md-12">
	            	<input type="email"
	            		class="form-control"
	            		style="background-color: #c2c2c2"
	            		id="emailInput"
	            		name="emailInput"
	            		placeholder="Email"
	            		required>
	          	</div>
	          	<div class="col-md-12">
	            	<input type="password"
		            	class="form-control"
	            		style="background-color: #c2c2c2"
		            	id="passwordInput" 
		            	name="passwordInput" 
		            	placeholder="Senha" 
		            	required>
	          	</div>
	          	<div class="col-12">
	            	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
	              		<button type="submit" class="btn btn-primary">Entrar</button>
	            	</div>
	          	</div>
	        </form>
		</div>
		
       	<div class="text-center py-2">
       		Não tem uma conta? <a href="./cadastro.jsp" class="text-decoration-none">Cadastre-se</a>!
       	</div>
       	<div class="text-center py-2">
       		<a href="./recuperar-senha.jsp" class="text-decoration-none">Esqueci minha senha!</a>
       	</div>
      </div>
    </main>
</body>
</html>