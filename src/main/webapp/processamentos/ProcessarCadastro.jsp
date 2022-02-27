<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.time.LocalDateTime"%>
<%@page import="entity.Login"%>
<%@page import="entity.dao.UsuarioDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="entity.Usuario"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Processando Cadastro...</title>
</head>
<body>
	<%
	Logger logger = Logger.getLogger("ProcessarCadastro.jsp");

	String nome   = (String) request.getParameter("nomeInput");
	String email  = (String) request.getParameter("emailInput");
	String rua    = (String) request.getParameter("ruaInput");
	String cep    = (String) request.getParameter("cepInput");
	String bairro = (String) request.getParameter("bairroInput");
	String cidade = (String) request.getParameter("cidadeInput");
	
	// numero
	Integer numero = 0;
	
	try {
		numero = Integer.parseInt(request.getParameter("numeroInput"));
	} catch (Exception e) {
		numero = 0;
	}
	
	/* Processando cpf e cnpj */
	String inputAccountType = (String) request.getParameter("tipoInput");
	String inputCpfCnpj = (String) request.getParameter("documentoInput");

	String cpf = null;
	String cnpj = null;
	
	if (inputAccountType.equals("CPF")) {
		cpf = inputCpfCnpj;
	} else if (inputAccountType.equals("CNPJ")) {
		cnpj = inputCpfCnpj;
	}
	
	/* Validando usuarios duplicados */
	boolean usuarioExiste = false; 
	
	if (UsuarioDAO.procurarUsuarioPorEmail(email) != null) {
		out.print("<script>alert('Já existe um usuário com este Email! Tente outro.');</script>");
		usuarioExiste = true;
	} else if (UsuarioDAO.procurarUsuarioPorCpf(cpf) != null) {
		out.print("<script>alert('Já existe um usuário com este Cpf! Tente outro.');</script>");
		usuarioExiste = true;
	} else if (UsuarioDAO.procurarUsuarioPorCnpj(cnpj) != null) {
		out.print("<script>alert('Já existe um usuário com este Cnpj! Tente outro.');</script>");
		usuarioExiste = true;
	}
	
	// login
	String senha = request.getParameter("passwordInput1");
	Login login = new Login(
		BCrypt.hashpw(senha, BCrypt.gensalt()),
		LocalDateTime.now()
	);
	
	Usuario usuario = new Usuario(
			nome,
			null,
			email,
			login,
			cep,
			bairro,
			rua,
			numero,
			cidade,
			null,
			cpf,
			cnpj
	);
	
	if (!usuarioExiste) {
		if (UsuarioDAO.criarUsuario(usuario)) {
			out.print(String.format("<script>alert('Usuario %s cadastrado com sucesso!');</script>", usuario.getNome()));
		} else {
			out.print("<script>alert('Falha ao criar usuario.');</script>");
		}
		%><script>window.location = '../login.jsp';</script><%
	} else {
		%><script>history.back();</script><%
	}
	%>
</body>
</html>