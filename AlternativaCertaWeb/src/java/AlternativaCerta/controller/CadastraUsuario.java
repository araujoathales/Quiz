package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import javax.servlet.http.HttpServletRequest;
import alternativacerta.cadastra.IManterUsuario;
import alternativacerta.cadastra.ManterUsuario;
import alternativacerta.cadastra.Usuario;
import alternativacerta.cadastra.UsuarioDAO;

/**
 *
 * @author bella
 */
class CadastraUsuario {

    static String execute(HttpServletRequest request) {
       String jsp = "";
        try {
            
            String NomeCompleto = request.getParameter("NomeCompleto");
            String nomeusuario = request.getParameter("nomeusuario");
            String Email = request.getParameter("Email");
            String senha = request.getParameter("senha");
            
            System.out.println("0");
            Usuario usuario = new Usuario();
            System.out.println("To criando");
            usuario.setNomeCompleto(NomeCompleto);
            usuario.setNomeusuario(nomeusuario);
            usuario.setEmail(Email);
            usuario.setSenha(senha);
            System.out.println("To pronto");
            
            ClienteImpl requisicao =  new ClienteImpl();
            requisicao.ClienteUsuarioInserir(usuario);
            Long id = null;
            
            System.out.println("Acho que deu");
            
            if (id == null) {
                jsp = "Cadastro.jsp";
            } else {
                String erro = "Nao foi possivel gravar esse registro!";
                request.setAttribute("erro", erro);
                jsp = "/erro.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsp = "";
        }
        return jsp;
    
    }
    
}
