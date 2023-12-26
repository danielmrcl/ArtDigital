package servlet;

import entity.dao.UsuarioDAO;
import entity.dto.UsuarioTokenDTO;
import config.GuiceInjector;
import service.IProfilePictureService;
import utils.StringUtil;
import utils.JWTUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;
import java.util.logging.Logger;

@WebServlet(name = "ProcessaLoginServlet", value = "/ProcessaLoginServlet")
public class ProcessaLoginServlet extends HttpServlet {
    Logger logger = Logger.getLogger(ProcessaLoginServlet.class.getSimpleName());

    private final IProfilePictureService profilePictureService =
        GuiceInjector.defaultInjector().getInstance(IProfilePictureService.class);

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
            var imageBytes = profilePictureService.getImageBytes(StringUtil.md5(usuario.getEmail()));

            HttpSession session = request.getSession();
            session.setAttribute("usuarioValidado", usuario);
            session.setAttribute("avatar-base64", Base64.getEncoder().encodeToString(imageBytes));
            response.sendRedirect("minha-conta.jsp");
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }
    }
}
