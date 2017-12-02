<%-- 
    Document   : CadatroQuestao
    Created on : 16/07/2017, 01:11:07
    Author     : bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="alternativacerta.cadastra.Usuario,AlternativaCerta.controller.Login, alternativacerta.cadastra.ManterUsuario"%>

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
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
        <script src="script.js"></script>
        <style type="text/css">
            .disable{
                display: none;
            }
            .disable2{
                display: block;
            }
        </style>
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
                        <li><a href="desempenho.html">Desempenho</a></li>

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
                                                <label><a id="cadastra" href="Cadastro.jsp" class="">Não possui conta? Clique Aqui</a></label>
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
                        <li><a href="desempenho.html">Desempenho</a></li>
                        <li><a href="#">Bem Vindo <%= login.getNomeusuario()%></a></li>

                    </ul>
                    <% } else {
                        if (login.getTipo().equals("Gestor Conteúdo")) {
                    %>
                    <ul class="right hide-on-med-and-down">
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="/AlternativaCertaWeb/servletweb?acao=ListarQuestao">Questões</a></li>
                            <li><a href="desempenho.html">Desempenho</a></li>
                            <li><a href="CadastroQuestao.jsp">Adicionar Questões</a></li>
                            <li><a href="mobile.html">Verificar Perfis</a></li>
                            <li><a href="CadastroQuestao.jsp">Bem Vindo <%= login.getNomeusuario()%></a></li>
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
                                    <div class="col s24 m8" id = "Gerenciamento">
                                        <div class="icon-block">
                                            <h3 class="header center teal-text darken-3" id = "GQuest" class="center">Gerenciamento de Questões</h3>
                                            <div class ="row">
                                                <form  name="cadastroQuestao" method="POST" onsubmit="return ValidaQuestao(cadastroQuestao);">
                                                    <input type='hidden' name='acao' value='GravaQuestao'>
                                                    <div align = "justify">
                                                        <label>Tipo: </label>
                                                        <p><input type="radio" name="tipo" value="aberta"  id="Aberta" onclick="exibeCampoEspecifico('Aberta')">
                                                            <label for="Aberta"> Aberta </label> &emsp;&emsp;&emsp;
                                                            <input type="radio"  name="tipo" value="fechada" id="fechada" onclick="exibeCampoEspecifico('fechada')">
                                                            <label for="fechada"> Fechada</label>&emsp;&emsp;&emsp;
                                                            <input type="radio"  name="tipo" value="VF" id="VF" onclick="exibeCampoEspecifico('VF')">
                                                            <label for="VF"> Verdadeiro ou Falso</label>
                                                        </p>
                                                        <p> <label for="enunciado"> Enunciado: </label>
                                                            <input type="text"  name="enunciado" id="enunciado">  
                                                        </p>
                                                        <br>
                                                    </div>
                                                    <div align = "justify">
                                                        <select multiple name="materia" class="select">
                                                            <option value="" disabled selected>Assunto</option>
                                                            <option value="Matematica">Matemática</option>
                                                            <option value="Portugues">Português</option>
                                                            <option value="Historia">História</option>
                                                            <option value="Geo">Geografia</option>
                                                            <option value="Quim">Química</option>
                                                            <option value="Ingles">Inglês</option>
                                                        </select>
                                                        <label>Assunto: </label>    
                                                    </div>
                                                    <div class="disable" id="divfechada" align = "justify">
                                                        <label>Quantidade de Alternativas: </label>
                                                        <p><input type="radio" name="QuantAlt" value="2"  id="2" checked onclick="exibeCampoEspecifico('2')">
                                                            <label for="2"> 2 </label> &emsp;&emsp;&emsp;
                                                            <input type="radio"  name="QuantAlt" value="3" id="3" onclick="exibeCampoEspecifico('3')" >
                                                            <label for="3"> 3</label>&emsp;&emsp;&emsp;
                                                            <input type="radio"  name="QuantAlt" value="4" id="4" onclick="exibeCampoEspecifico('4')">
                                                            <label for="4"> 4 </label>&emsp;&emsp;&emsp;
                                                            <input type="radio"  name="QuantAlt" value="5" id="5" onclick="exibeCampoEspecifico('5')">
                                                            <label for="5"> 5 </label>
                                                        </p>
                                                        <br>
                                                        <p id="altA"> <label for="AltA"> Alternativa A : </label>
                                                            <input type="text" name="AltA" id="AltA">  
                                                        </p>
                                                        <p > <label for="AltB"> Alternativa B: </label>
                                                            <input type="text"  name="AltB" id="AltB">  
                                                        </p>
                                                        <div class="disable" id="C">
                                                            <p> <label for="AltC"> Alternativa C: </label>
                                                                <input type="text"  name="AltC" id="Altc">  
                                                            </p>
                                                        </div>
                                                        <div class="disable" id="D">
                                                            <p> <label for="AltD"> Alternativa D: </label>
                                                                <input type="text"  name="AltD" id="AltD">  
                                                            </p>
                                                        </div>
                                                        <div class="disable" id="E">
                                                            <p> <label for="AltE"> Alternativa E: </label>
                                                                <input type="text"  name="AltE" id="AltF">  
                                                            </p>
                                                        </div>
                                                        <div>
                                                            <label>Resposta: </label><br>
                                                            <input type="radio" name="resp" value="respA"  id="respA">
                                                            <label for="respA"> A </label> <br>
                                                        </div>
                                                        <div>
                                                            <input type="radio" name="resp" value="respB" id="respB">
                                                            <label for="respB"> B</label> 
                                                        </div>
                                                        <div class="disable" id="respC">
                                                            <input type="radio" name="resp" value="respC" id="respC">
                                                            <label for="respC"> C</label>
                                                        </div>
                                                        <div class="disable" id="respD">
                                                            <input type="radio" name="resp" value="respD" id="respD">
                                                            <label for="respD"> D</label>
                                                        </div>
                                                        <div class="disable" id="respE">
                                                            <input type="radio" name="resp" value="respE" id="respE">
                                                            <label for="respE"> E</label> 
                                                        </div>

                                                    </div>
                                                    <div class="disable" id="divVF" align = "justify">
                                                        <label>Resposta: </label>
                                                        <p><input type="radio" name="respVF" value="Verd"  id="Verd">
                                                            <label for="Verd"> Verdadeiro </label> &emsp;&emsp;&emsp;
                                                            <input type="radio" name="respVF" value="falso" id="falso">
                                                            <label for="falso"> Falso</label>
                                                        </p>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div class="center">
                                                        <button class="btn waves-effect waves-light" onclick="ValidaQuestao(document.cadastroQuestao)" name="action">Enviar
                                                            <i class="material-icons right">send</i>
                                                        </button>
                                                        <!-- Lembrar de fixar-->
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>


                                                        <!-- Lembrar de fixar-->
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                        <script src="js/materialize.js"></script>
                        <script src="js/init.js"></script>
                        <script src="js/Marcelo.js"></script>
                        <script src="js/Marcelo2.js"></script>
                        <script src="js/Modal.js"></script>
                        <script src="js/MarceloSelect.js"></script>
                        <script src="Valida.js"></script>
                        </body>
                        </html>