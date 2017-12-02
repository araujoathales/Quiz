<%-- 
    Document   : MostrarPerfil
    Created on : 17/07/2017, 16:13:37
    Author     : Thales
--%>

<%@page import="alternativacerta.cadastra.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <ul class="right hide-on-med-and-down">
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="sass.html">Questões</a></li>
                        <li><a href="desempenho.html">Desempenho</a></li>
                        <li><a href="GerQuest.html">Adicionar Questões</a></li>
                        <li><a href="mobile.html">Verificar Perfis</a></li>
                        <li>
                            <a class="waves-effect waves-light btn" href="#modal1">Login</a>
                            <!-- Modal Structure -->
                            <div id="modal1" class="modal">
                                <div class="modal-content">
                                    <div align ="center">
                                        <h4 id ="cor">Login</h4>
                                    </div>
                                    <div class="row">

                                        <form>
                                            <div align ="center">
                                                <label for="username" id ="login">Nome de usuario</label>
                                                <input type="text" name="username" id = "cor">
                                            </div>
                                            <br>
                                            <div align ="center">
                                                <label for="password" id = "login">Senha</label>
                                                <input type="password" name="password" id = "cor">
                                            </div>
                                            <button class="col s12 btn-flat waves-effect waves-light green white-text" type="submit" name="action">Entrar
                                            </button>
                                            <br>

                                            <button class="col s12 btn-flat waves-effect waves-light green white-text" type="submit" name="action" >Cadastrar

                                            </button>



                                        </form>


                                    </div>

                                    <div class="modal-footer">


                                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat red white-text">Sair</a>


                                    </div>

                                </div>
                            </div>
                        </li>
                    </ul>
            </div>
        </nav>
        <div class="container" class="page-footer teal">



            <div>
                <h1 class="header center teal-text darken-3" id = "Portal">
                    Perfil do Usuário

                </h1>
            </div>

            <br>
            <br>

            <div class="col s12 m8 offset-m2 l6 offset-l3">
                <div class="card-panel grey lighten-5 z-depth-1">
                    <div class="row valign-wrapper">
                        <% Usuario usuario = (Usuario) request.getAttribute("usuario");%>
                        <br>
                        <%= usuario.getNomeusuario() %>
                        <br>
                        <%= usuario.getNomeCompleto()%> 
                        <br>
                        <%= usuario.getEmail() %>
                        <br>						
                    </div>


                </div>
            </div>

            <br>


            <div class="row" >
                <form action ="#">

                    <button class="col s2 btn-flat waves-effect waves-light green white-text" type="submit" name="action">Editar Perfil
                    </button>

                </form>
            </div>

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
