package servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    Logger logger = Logger.getLogger(LogoutServlet.class.getSimpleName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            Object usuarioValidado = session.getAttribute("usuarioValidado");

            if (usuarioValidado == null) {
                throw new Exception("Nenhum usuario logado no sistema.");
            }
            session.setAttribute("usuarioValidado", null);

            var message = "Usuario desconectado.";
            response.sendRedirect("login.jsp?success=" + message);
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }
    }
}
