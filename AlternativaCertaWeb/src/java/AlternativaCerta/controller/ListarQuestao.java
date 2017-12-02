package AlternativaCerta.controller;

import CadastroQuestao.ManterQuestao;
import CadastroQuestao.Questao;
import Cliente.ClienteImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class ListarQuestao {

   public static String execute(HttpServletRequest request) {
       String jsp = "";
        try {
            ClienteImpl requisicao =  new ClienteImpl();
            List<String> listQuest = requisicao.ClienteQuestaoListaMateria();
            if (listQuest != null) {
                request.getSession().setAttribute("listQuest", listQuest);
                jsp = "TelaQuestoes.jsp";
                System.out.println("oi");
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
