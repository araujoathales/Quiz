package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import Forum.Forum;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class ExcluiComentario {

    static String execute(HttpServletRequest request) {
       String jsp = "";
        try {
          
           ClienteImpl requisicao =  new ClienteImpl();
            
            String idComentario = request.getParameter("idComentario");
            String usuario = request.getParameter("nomeusuario");
            Long idQuest = new Long(request.getParameter("coQuest"));
            
            Forum id = new Forum();
            id.setDataPost(java.sql.Timestamp.valueOf(idComentario));
            id.setNomeusuario(usuario);
            id.setCod_Questao(idQuest);
            
            boolean forum = requisicao.ClienteForumDelete(id);
            
            System.out.println(id);
            if (forum == true) {
                jsp = "index.jsp";
            } else {
                String erro = "Nao possivel apagar cometario";
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
