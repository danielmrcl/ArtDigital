package servlet;

import entity.dao.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ProcessaLoginServlet", value = "/ProcessaLoginServlet")
public class ProcessaLoginServlet extends HttpServlet {
    Logger logger = Logger.getLogger(ProcessaLoginServlet.class.getSimpleName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String email = request.getParameter("emailInput");
            String senha = request.getParameter("passwordInput");

            var usuario = UsuarioDAO.validarUsuarioEmailSenha(email, senha);
            if (usuario == null) {
		        var message = "Credenciais incorretas ou inexistentes no banco de dados";
                throw new Exception(message);
            }

            HttpSession session = request.getSession();
            session.setAttribute("usuarioValidado", usuario);
            response.sendRedirect("minha-conta.jsp");
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }
    }
}
