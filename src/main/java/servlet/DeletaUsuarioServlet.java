package servlet;

import entity.Usuario;
import entity.dao.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "DeletaUsuarioServlet", value = "/DeletaUsuarioServlet")
public class DeletaUsuarioServlet extends HttpServlet {
    Logger logger = Logger.getLogger(DeletaUsuarioServlet.class.getSimpleName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            Object usuarioValidado = session.getAttribute("usuarioValidado");

            if (usuarioValidado == null) {
                throw new Exception("Nenhum usuário logado no sistema");
            }

            Usuario usuario = (Usuario) usuarioValidado;

            if (!UsuarioDAO.deletarUsuario(usuario.getId())) {
                var message = String.format("Erro ao deletar usuario %s!", usuario.getNome());
                throw new Exception(message);
            }

            var message = String.format("Usuario %s deletado com sucesso!", usuario.getNome());
            session.setAttribute("usuarioValidado", null);
            response.sendRedirect("login.jsp?success=" + message);
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }
    }
}
