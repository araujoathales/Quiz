package AlternativaCerta.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletWeb extends HttpServlet {

    private String jsp = "";

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String acao = request.getParameter("acao");
        
        if (acao.equals("GravarUsuario")) {
            jsp = CadastraUsuario.execute(request);
        } else if (acao.equals("Logar")) {
            jsp = Login.execute(request);
        } else if (acao.equals("GravaQuestao")) {
            jsp = CadastraQuestao.execute(request);
        } else if (acao.equals("ListarQuestao")) {
            jsp = ListarQuestao.execute(request);
        } else if (acao.equals("MostraQuestao")) {
            jsp = MostraQuestao.execute(request);
        } else if (acao.equals("EnunciadoQuestao")) {
            jsp = EnunciadoQuestao.execute(request);
        } else if (acao.equals("Comenta")) {
            jsp = Comentario.execute(request);
        } else if (acao.equals("ExcluiComentario")) {
            jsp = ExcluiComentario.execute(request);
        } else if (acao.equals("Responde")) {
            jsp = Responde.execute(request);
        } else if (acao.equals("Editaperfil")) {
            jsp = MostrarPerfil.execute(request);
        }

        //Redirecionando pagina
        RequestDispatcher rd = request.getRequestDispatcher(jsp);
        rd.forward(request, response);
        System.out.println("1");
    }
}
