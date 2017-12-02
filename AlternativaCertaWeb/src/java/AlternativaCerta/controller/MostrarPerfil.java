package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import alternativacerta.cadastra.Usuario;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Thales
 */
class MostrarPerfil {

    static String execute(HttpServletRequest request) {
        String jsp="";
        try{
            
            String nomeusuario = request.getParameter("nomeusuario");
           
            ClienteImpl requisicao =  new ClienteImpl();
           
            Usuario usuario = requisicao.ClienteUsuarioConsultarPorId(nomeusuario);
     
            if(usuario.getNomeusuario() != null){
                request.getSession().setAttribute("usuario", usuario);
                jsp = "MostrarPerfil.jsp";
            }else{
                String erro = "Nao foi possivel consultar esse registro!";
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
