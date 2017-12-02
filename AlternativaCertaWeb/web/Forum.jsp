<%-- 
    Document   : Forum
    Created on : 16/07/2017, 07:23:29
    Author     : M
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Forum.Forum, CadastroQuestao.Questao"%>
<%@page import="alternativacerta.cadastra.Usuario,AlternativaCerta.controller.Login, alternativacerta.cadastra.ManterUsuario"%>
<!DOCTYPE HTMl>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"
              />
        <title>Alternativa Certa</title>
        <!-- CSS -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"
              />
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"
              />
    </head>
    <body>
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="index.html" class="brand-logo"><img src="logo.png"></a>

                <%
                    Usuario login = new Usuario();
                    login.setNomeusuario((String) request.getSession().getAttribute("nomeusuario"));
                    login.setTipo((String) request.getSession().getAttribute("tipo"));
                    if (login.getTipo() == null) {
                %>

                <ul class="right hide-on-med-and-down">
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="/AlternativaCertaWeb/servletweb?acao=ListarQuestao">Questões</a></li>
                        <li><a href="#">Desempenho</a></li>

                        <li>
                            <a class="waves-effect waves-light btn" href="#modal1">Login</a>
                            <!-- Modal Structure -->
                            <div id="modal1" class="modal">
                                <div class="modal-content">
                                    <div align ="center">
                                        <h4 id ="cor">Login</h4>
                                    </div>
                                    <div class="row">

                                        <form name="frmLogin" method="post" action="/AlternativaCertaWeb/servletweb?acao=Logar" onsubmit="validarCamposLogin(frmLogin)">
                                            <input type='hidden' name='acao' value='Logar'>
                                            <div align ="center">
                                                <label for="username" id ="login">Nome de usuario</label>
                                                <input type="text" name="username" id = "username">
                                            </div>
                                            <br>
                                            <div align ="center">
                                                <label for="password" id = "login">Senha</label>
                                                <input type="password" name="password" id = "password">
                                            </div>
                                            <button class="col s12 btn-flat waves-effect center waves-light green white-text" name="action">Entrar </button>

                                            <div align ="center">
                                                <label><a id="cadastra" href="" class="">Não possui conta? Clique Aqui</a></label>
                                            </div>

                                        </form>


                                    </div>

                                    <div class="modal-footer">

                                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat red white-text">Sair</a>

                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    </li>
                </ul>
                <% } else {
                    if (login.getTipo().equals("Aluno")) {
                %>
                <ul class="right hide-on-med-and-down">
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="/AlternativaCertaWeb/servletweb?acao=ListarQuestao">Questões</a></li>
                        <li><a href="#">Desempenho</a></li>
                        <li><a href="/AlternativaCertaWeb/servletweb?acao=Editaperfil&nomeusuario=<%= login.getNomeusuario() %>">Bem Vindo <%= login.getNomeusuario()%></a></li>

                    </ul>
                    <% } else {
                        if (login.getTipo().equals("Gestor Conteúdo")) {
                    %>
                    <ul class="right hide-on-med-and-down">
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="/AlternativaCertaWeb/servletweb?acao=ListarQuestao">Questões</a></li>
                            <li><a href="#">Desempenho</a></li>
                            <li><a href="CadastroQuestao.jsp">Adicionar Questões</a></li>
                            <li><a href="/AlternativaCertaWeb/servletweb?acao=Editaperfil=<%= login.getNomeusuario() %>">Bem Vindo <%= login.getNomeusuario()%></a></li>
                        </ul>
                        <%  }
                                }
                            }

                        %>

                        </div>
                        </nav>

                        <div class="container">
                            <div class="section">
                                <!--   Icon Section   -->
                                <div class="center">
                                    <div class="col s24 m8">
                                        <div class="icon-block">
                                            <div class ="row">
                                                    <%   
                                                        Questao questao = (Questao) request.getAttribute("questao");
                                                    %>
                                                    <form method="post" action="/AlternativaCertaWeb/servletweb?acao=Responde&idQuest=<%=questao.getidQuest() %>&nomeusuario=<%=login.getNomeusuario() %>" name="resposta">
                                                    <br><br>
                                                    <h5><%= questao.getdesc_quest()%></h5>
                                                    <% 
                                                        if (questao.getAlternativas() != null) {
                                                            for (String alternativa : questao.getAlternativas()) {
                                                                if (alternativa != null) {
                                                    %>
                                                    <div>
                                                        <p><input type="radio" name="aternativa" value="AterA"  id="test1">
                                                            <label for="test1"><%= alternativa%>
                                                            </label>
                                                        </p>
                                                    </div>
                                                    <%  }
                                                        }
                                                    } else {
                                                    %>
                                                    <textarea  class="materialize-textarea " name="respostaAberta"  rows=10 cols=40></textarea>
                                                    <% }%>
                                                    <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
                                                        <i class="material-icons right">send</i>
                                                    </button>
                                                    <br><br><br>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% if(login.getNomeusuario() != null){ %>
                            <form method="post" action="/AlternativaCertaWeb/servletweb?acao=Comenta&idQuest=<%= questao.getidQuest()%>&nomeusuario=<%= login.getNomeusuario() %>">
                                <table>
                                    <tr>
                                        <td><label>Comentario:</label> </td>
                                        <td><textarea  class="materialize-textarea " name="mensagem"  rows=10 cols=40/></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>

                                            <button class="btn waves-effect waves-light" type="submit" name="action">Enviar Comentário
                                                <i class="material-icons right">send</i>
                                            </button></td>
                                    </tr>
                                </table>
                            </form>
                            <div class="container">
                                <%
                                    List<Forum> listcomentarios = (List<Forum>) request.getAttribute("comentarios");
                                    for (Forum comentario : listcomentarios) {
                                        if (comentario != null) {
                                %>
                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <span class="badge">
                                                <label>
                                                    <%= comentario.getDataPost()%>
                                                    <span class="badge"><a href="/AlternativaCertaWeb/servletweb?acao=EditaComentario&idComentario=<%= comentario.getDataPost()%>&nomeusuario=<%= login.getNomeusuario()%>&coQuest<%= questao.getidQuest()%>"><font size="3"> Excluir </font></a></span>
                                                    <a href="/AlternativaCertaWeb/servletweb?acao=EditaComentario&idComentario=<%=comentario.getDataPost()%>"><i class="material-icons">
                                                            edit
                                                        </i>
                                                    </a>
                                                </label>
                                            </span> <label><img width="40" height="20" src="FotoMarcelo.jpg" alt=""  class="circle responsive-img"><a href="#"><font size="5"><%= comentario.getNomeusuario()%></font></a></label><br>
                                        </div>
                                        <div class="center">
                                            <p> <%= comentario.getTxt_Comentario()%> </p><br>
                                            
                                        </div>
                                        <br>
                                    </li>
                                </ul> 

                                <%
                                    }
                                        }
                                    }
                                %>
                            </div>



                            <!--div class="icon-block">
                               <div class="container">
                               <div class="section">
                               <div class="center">
                               <table>
                               <tr><td>
                               <div class="center">
                               <div class="col s12" class="row">
                                    
                                   </div>
                               </td></tr>
                               <tr><td>
                               <div class="input-field col s12"> 	
                                 <input type="text" id="autocomplete-input" class="autocomplete">
                                 <label for="autocomplete-input">Autocomplete</label>
                               </div>
                               </td></tr>
                                <div class="row">
                               <div class="col s12 m4">
                               <div>
                               <table>
                               <h2 class="center brown-text">
                               <img class="activator" class="center brown-text" src="pp.jpg"  width="70" height="56">
                               </h2>
                               </div>
                               <div class="center">
                               <a href="#"><span > Marcelo Lindão </span></a>
                               </div>
                               </div>
                               </div>
                               </div>
                               </div>
                               <div class="col s12 m4">
                               <div class="row">	
                               <form action="#">
                                   <input type="text" id="autocomplete-input">
                                   <label for="autocomplete-input">Comentário</label>
                                   </form>
                                </div></div-->
                        </div>
                        <br><br>
                        <footer class="page-footer teal">
                            <div class="container">
                                <div class="row">
                                    <div class="col l6 s12">
                                        <h5 class="white-text" align = "center">
                                            Quem somos
                                        </h5>
                                        <p class="grey-text text-lighten-4" align = "justify">
                                            Nós somos um grupo de estudantes do CEFET-MG, responsáveis por desenvolver uma plataforma que viabilize a estudantes uma noção de questões de vestibulares e questões técncicas. Nosso principal intúito é garantir que acesso a meios de estudos complentares de tal forma que estudar seja uma tarefa prática e confortável para a vida de um vestibulando ou técnico.
                                        </p>
                                    </div>
                                    <br>
                                    <br>

                                    <div align = "right">

                                        <img src="Cefet.png">
                                    </div>
                                </div>
                            </div>
                            <div class="footer-copyright">
                                <div class="container">
                                    Made by
                                    <a class="brown-text text-lighten-3" href="http://materializecss.com">Materialize</a>
                                </div>
                            </div>
                        </footer>
                        <!-- Scripts-->
                        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                        <script src="js/materialize.js"></script>
                        <script src="js/init.js"></script>
                        <script src="js/Marcelo.js"></script>
                        <script src="js/Marcelo2.js"></script>
                        <script src="js/Modal.js"></script>
                        </body>
                        </html>