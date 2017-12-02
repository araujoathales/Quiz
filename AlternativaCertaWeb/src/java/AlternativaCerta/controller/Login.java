package AlternativaCerta.controller;

import Cliente.ClienteImpl;
import alternativacerta.cadastra.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login {

    public static String execute(HttpServletRequest request) {

        String jsp = "";

        try {
            String nome = request.getParameter("username");
            String senha = request.getParameter("password");


            ClienteImpl requisicao =  new ClienteImpl();
            Usuario usr = requisicao.ClienteUsuarioConsultarPorUsuarioSenha(nome, senha);
            if (usr.getNomeusuario() != null) {
                request.getSession().setAttribute("nomeusuario", usr.getNomeusuario());
                request.getSession().setAttribute("tipo", usr.getTipo());
                jsp = "/index.jsp";
            } else {
                String erro = "Usuario nao encontrado!";
                request.setAttribute("erro", erro);
                jsp = "/erro.jsp";
            }  

        } catch (Exception e) {
            e.printStackTrace();
            jsp = "";
        }
        
        return jsp;
    }
    
    public static void validarSessao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codUsuario = (String) request.getSession().getAttribute("nomeusuario");
        String jsp = "";
        if (codUsuario == null) {
            jsp = "/index.jsp";
            //Redirecionando pagina
            RequestDispatcher rd = request.getRequestDispatcher(jsp);
            rd.forward(request, response);
        }
    }

 
}
