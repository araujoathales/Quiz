package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import Forum.Forum;
import Forum.ForumDAO;
import java.security.Timestamp;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class EditaComentario {

    static String execute(HttpServletRequest request) {
        String jsp = "";
        try {
          
            String idComentario = request.getParameter("idComentario");
            java.sql.Timestamp id = java.sql.Timestamp.valueOf(idComentario);
            
            
            ClienteImpl requisicao =  new ClienteImpl();
            Forum forum = requisicao.ClienteForumPesquisarPorId(id);
            
            System.out.println(id);
            if (forum != null) {
                request.setAttribute("forum", forum);
                jsp = "EditaForum.jsp";
            } else {
                String erro = "Nao existem questoes cadastrados!";
                request.setAttribute("erro", erro);
                jsp = "/erro.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsp = "";
        }
        System.out.println(jsp);
        return jsp;
    }
    
}
