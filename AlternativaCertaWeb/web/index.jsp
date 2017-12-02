<%-- 
    Document   : index
    Created on : 08/07/2017, 13:04:58
    Author     : bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="alternativacerta.cadastra.Usuario,AlternativaCerta.controller.Login, alternativacerta.cadastra.ManterUsuario"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"
              />
        <title>
            Aternativa Certa
        </title>
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
                        <li><a href="/AlternativaCertaWeb/servletweb?acao=Editaperfil&nomeusuario=<%= login.getNomeusuario()%>">Bem Vindo <%= login.getNomeusuario()%></a></li>

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
                            <li><a href="/AlternativaCertaWeb/servletweb?acao=Editaperfil">Bem Vindo <%= login.getNomeusuario()%></a></li>
                        </ul>
                        <%  }
                                }
                            }

                        %>

                        </div>
                        </nav>
                        <div class="container" class="page-footer teal">

                            <form>
                                <div class="input-field">

                                    <input id="search" type="search">
                                    <label class="label-icon" for="search">
                                        <i class="material-icons">
                                            search
                                        </i>
                                    </label>
                                    <i class="material-icons">
                                        close
                                    </i>
                                    </input>
                                </div>

                                <div>
                                    <h1 class="header center teal-text darken-3" id = "Portal">
                                        Seu Portal de Educação

                                    </h1>
                                </div>
                            </form>
                        </div>
                        <div class="slider">
                            <ul class="slides">
                                <li>
                                    <img src="Marcelo1.jpg"> <!-- random image -->
                                    <div class="caption center-align">
                                        <h3><a href="Cadastro.jsp">Cadastre-se</a></h3>
                                        <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                    </div>
                                </li>
                                <li>
                                    <img src="Lapis.jpg"> <!-- random image -->
                                    <div class="caption left-align">
                                        <h3>Left Aligned Caption</h3>
                                        <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                    </div>
                                </li>
                                <li>
                                    <img src="Educacao.jpg"> <!-- random image -->
                                    <div class="caption right-align">
                                        <h3>Right Aligned Caption</h3>
                                        <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                    </div>
                                </li>
                                <li>
                                    <img src="Forum.png"> <!-- random image -->
                                    <div class="caption center-align">
                                        <h3>This is our big Tagline!</h3>
                                        <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                    </div>
                                </li>
                            </ul>
                        </div>




                        <br><br>
                        <div class="container" align = "center">
                            <!--conteudo-->

                            <a class="waves-effect waves-light btn-large" href="forum.html"><i class="material-icons left">mode_edit</i>Questões</a>
                            <a class="waves-effect waves-light btn-large"href ="desempenho.html"><i class="material-icons left">equalizer</i>Desempenho</a>




                            <br><br>
                        </div>
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

                        <script src="https://code.jquery.com/jquery-2.1.1.min.js">
                        </script>
                        <script src="js/materialize.js">
                        </script>
                        <script src="js/init.js">
                        </script>

                        <script src="js/Marcelo.js">
                        </script>

                        <script src="js/Marcelo2.js">
                        </script>

                        <script src="js/Modal.js">
                        </script>

                        </body>

                        </html>
