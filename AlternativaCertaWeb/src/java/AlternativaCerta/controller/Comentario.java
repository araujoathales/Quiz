package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import Forum.Forum;
import Forum.ForumDAO;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class Comentario {

    static String execute(HttpServletRequest request) {
         String jsp = "";
        try {
            
            String NomeCompleto = request.getParameter("mensagem");
            String nomeusuario = request.getParameter("nomeusuario");
           
            Forum comentario = new Forum(NomeCompleto, nomeusuario);
            System.out.println("To pronto");
            
            ClienteImpl requisicao =  new ClienteImpl();
            boolean result = requisicao.ClienteForumInserir(comentario);
            
            
            if (result == true) { 
                jsp = "index.jsp";
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
