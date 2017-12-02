package AlternativaCerta.controller;

import CadastroQuestao.Questao;
import Cliente.ClienteImpl;
import alternativacerta.cadastra.Usuario;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class Responde {

    static String execute(HttpServletRequest request) {
        String jsp = "";
        try {
            
            ClienteImpl requisicao =  new ClienteImpl();
            
            Usuario usuario = new Usuario();
            usuario.setNomeusuario((String)request.getAttribute("nomeusuario")); 
            
            Questao questao = new Questao();
            questao.setidQuest((Long)request.getAttribute("idQuest"));
            questao.setResposta(request.getParameter("aternativa"));
            
            String resultado = requisicao.ClienteDesempenhoGuardaResposta(questao, usuario);
                    
            if (questao != null) {
                jsp = "TelaQuestao.jsp";
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
