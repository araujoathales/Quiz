package AlternativaCerta.controller;

import CadastroQuestao.Questao;
import Cliente.ClienteImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class MostraQuestao {

    static String execute(HttpServletRequest request) {
        String jsp = "";
        try {
            ClienteImpl requisicao =  new ClienteImpl();
            
            String materia = request.getParameter("materia");
            List<Questao> listQuest = requisicao.ClienteQuestaoListaTodos(materia);
            if (listQuest != null) {
                request.getSession().setAttribute("listQuestEspecifica", listQuest);
                jsp = "MostraQuestoes.jsp";
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
