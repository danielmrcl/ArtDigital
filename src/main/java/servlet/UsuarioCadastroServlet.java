package servlet;

import entity.Login;
import entity.Usuario;
import entity.dao.UsuarioDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.logging.Logger;

@WebServlet(name = "UsuarioCadastroServlet", value = "/UsuarioCadastroServlet")
public class UsuarioCadastroServlet extends HttpServlet {
    Logger logger = Logger.getLogger(UsuarioCadastroServlet.class.getSimpleName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String nome   = request.getParameter("nomeInput");
            String email  = request.getParameter("emailInput");
            String rua    = request.getParameter("ruaInput");
            String cep    = request.getParameter("cepInput");
            String bairro = request.getParameter("bairroInput");
            String cidade = request.getParameter("cidadeInput");

            logger.info("Processando numero.");
            int numero;
            try {
                numero = Integer.parseInt(request.getParameter("numeroInput"));
            } catch (NumberFormatException e) {
                logger.warning("Erro ao processar numero.\nMessage: " + e.getMessage());
                numero = 0;
            }

            logger.info("Processando cpf e cnpj.");
            String inputAccountType = request.getParameter("tipoInput");
            String inputCpfCnpj = request.getParameter("documentoInput");

            String cpf = null;
            String cnpj = null;

            if (inputAccountType.equals("CPF")) {
                cpf = inputCpfCnpj;
            } else if (inputAccountType.equals("CNPJ")) {
                cnpj = inputCpfCnpj;
            }

            logger.info("Validando usuarios duplicados.");
            if (UsuarioDAO.procurarUsuarioPorEmail(email) != null) {
                var message = "Já existe um usuário com este Email! Tente outro.";
                throw new Exception(message);
            } else if (UsuarioDAO.procurarUsuarioPorCpf(cpf) != null) {
                var message = "Já existe um usuário com este Cpf! Tente outro.";
                throw new Exception(message);
            } else if (UsuarioDAO.procurarUsuarioPorCnpj(cnpj) != null) {
                var message = "Já existe um usuário com este Cnpj! Tente outro.";
                throw new Exception(message);
            }

            logger.info("Criando usuario.");
            String senha = request.getParameter("passwordInput1");
            Login login = new Login(
                null, BCrypt.hashpw(senha, BCrypt.gensalt()), LocalDateTime.now()
            );
            Usuario usuario = new Usuario(
                null, nome, null, email, login, cep,
                bairro, rua, numero, cidade, null, cpf, cnpj
            );

            if (!UsuarioDAO.criarUsuario(usuario)) {
                var message = String.format("Falha ao criar usuario %s.!", usuario.getNome());
                throw new Exception(message);
            }

            var message = String.format("Usuario %s cadastrado com sucesso!", usuario.getNome());
            logger.info(message + " Redirecionando para login.");
            response.sendRedirect("login.jsp?success=" + message);
        } catch (Exception e) {
            logger.warning(e.getMessage());
            response.sendRedirect(request.getHeader("Referer") + "?error=" + e.getMessage());
        }
    }
}
