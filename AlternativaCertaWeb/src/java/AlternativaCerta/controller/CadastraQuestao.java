package AlternativaCerta.controller;

import CadastroQuestao.Questao;
import Cliente.ClienteImpl;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author bella
 */
class CadastraQuestao {

    static String execute(HttpServletRequest request) {
       
        String jsp;
        try{
         String tipo = request.getParameter("tipo");
         
        
         String enunciado = request.getParameter("enunciado");
         String materia = request.getParameter("materia");
        
         String[] Alt;
         Alt = new String[5];
         Alt[0] = request.getParameter("AltA");
         Alt[1] = request.getParameter("AltB");
         Alt[2] = request.getParameter("AltC");
         Alt[3] = request.getParameter("AltD");
         Alt[4] = request.getParameter("AltE");
         String resp = request.getParameter("resp");
         
         System.out.println("0");
         Questao questao = new Questao(); 
         
         questao.setdesc_quest(enunciado);
         questao.setTipo(tipo);
         questao.setMateria(materia);
         questao.setAlternativas(Alt);
         questao.setResposta(resp);
         
         ClienteImpl requisicao =  new ClienteImpl();
         Long id = requisicao.ClienteQuestaoCadastrar(questao);
         
         if(id != null){
            jsp = "index.jsp"; 
         }else{
             String erro = "Nao foi possivel gravar esse registro!";
             request.setAttribute("erro", erro);
             jsp = "/erro.jsp";
         }
       } catch(Exception e) {
           e.printStackTrace();
           jsp = "";
       }
       return jsp; 
    }
    
}
