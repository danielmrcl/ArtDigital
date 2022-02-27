package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;

import entity.Categoria;
import entity.Imagem;
import entity.Produto;
import entity.Usuario;
import entity.dao.CategoriaDAO;
import entity.dao.ProdutoDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ProdutoServlet
 */
@MultipartConfig
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = (String) request.getParameter("nomeInput");
		String descricao = (String) request.getParameter("descInput");
		
		String categoriaId = (String) request.getParameter("selectInput");
		Categoria categoria = CategoriaDAO.procurarCategoria(Long.parseLong(categoriaId));
		
		Integer quantidade = null;
		Double preco = null;
		try {
			quantidade = Integer.parseInt(request.getParameter("quantidadeInput"));
			preco = Double.parseDouble(request.getParameter("preco"));
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		Part imagemInputPart = request.getPart("imagemInput");
		File file = File.createTempFile("imagem", LocalDateTime.now().toString());
		imagemInputPart.write(file.getPath());
		
		Imagem imagem = new Imagem(
			imagemInputPart.getSubmittedFileName(), 
			imagemInputPart.getContentType(), 
			Files.readAllBytes(file.toPath())
		);
		
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuarioValidado");
		
		Produto produto = new Produto(descricao, nome, quantidade, preco, categoria, imagem, usuario);
		System.out.println(produto);
		
		boolean success;
		try {
			success = ProdutoDAO.cadastrarProduto(produto);
		} catch (Exception e) {
			success = false;
		}
		
		if (success) {
			String msgSuccess = "Produto cadastrado com sucesso";
			response.sendRedirect("index.jsp?success=" + msgSuccess);
		} else {
			String msgError = "Erro ao cadastrar o produto";
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer + "?error=" + msgError);
		}
	}

}
