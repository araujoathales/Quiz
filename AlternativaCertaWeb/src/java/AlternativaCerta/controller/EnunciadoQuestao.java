package AlternativaCerta.controller;


import CadastroQuestao.Questao;
import Cliente.ClienteImpl;
import Forum.Forum;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class EnunciadoQuestao {

    static String execute(HttpServletRequest request) {
          String jsp = "";
        try {
            
            Long idQuestao = new Long(request.getParameter("idQuestao"));
            
            ClienteImpl requisicao =  new ClienteImpl();
            Questao questao = requisicao.ClienteQuestaoPesquisarPorId(idQuestao);
            ArrayList<Forum> comentarios = requisicao.ClienteForumListaTodos(idQuestao);
            
            if (questao != null) {
                request.setAttribute("questao", questao);
                request.setAttribute("comentarios", comentarios);
                jsp = "Forum.jsp";
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
