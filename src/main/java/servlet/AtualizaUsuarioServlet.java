package servlet;

import entity.Usuario;
import entity.dao.UsuarioDAO;
import utils.JWTUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "AtualizaUsuarioServlet", value = "/AtualizaUsuarioServlet")
public class AtualizaUsuarioServlet extends HttpServlet {
    Logger logger = Logger.getLogger(AtualizaUsuarioServlet.class.getSimpleName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String nome = request.getParameter("inputName");
            String rua = request.getParameter("addressInput");
            String cep = request.getParameter("inputZip");
            String cidade = request.getParameter("cityInput");

            int numero;
            try {
                numero = Integer.parseInt(request.getParameter("numberInput"));
            } catch (Exception e) {
                numero = 0;
            }

            HttpSession session = request.getSession();
            var jwtToken = (String) session.getAttribute("usuarioToken");

            if (jwtToken != null) {
				Usuario usuario = UsuarioDAO.procurarUsuarioPorEmail(JWTUtil.verify(jwtToken).getEmail());

                usuario.setNome(nome);
                usuario.setRua(rua);
                usuario.setCep(cep);
                usuario.setNumero(numero);
                usuario.setCidade(cidade);

                if (!UsuarioDAO.atualizarUsuario(usuario)) {
                    throw new Exception("Falha ao atualizar usuario.");
                }

                var message = String.format("Usuario %s atualizado com sucesso!", usuario.getNome());
                logger.info(message);
                response.sendRedirect("minha-conta.jsp?success=" + message);
            }
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }

    }
}
