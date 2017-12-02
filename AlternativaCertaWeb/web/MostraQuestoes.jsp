<%-- 
    Document   : MostraQuestoes
    Created on : 17/07/2017, 03:33:57
    Author     : bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CadastroQuestao.Questao"%>
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

    <div class="container" class="page-footer teal">

        <form>
            <div class="input-field">

                <input id="search" type="search"/>
                <label class="label-icon" for="search">
                    <i class="material-icons">
                        search
                    </i>
                </label>
                <i class="material-icons">
                    close
                </i>
            </div>
        </form>
    </div>
        
        <%
            List<Questao> listQuest = (List<Questao>)request.getSession().getAttribute("listQuestEspecifica");
            for (Questao questao: listQuest) {
       
        %>
                    
    <div class="container">
        <div class="section">
            <!--   Icon Section   -->
            <div class="center">
                <ul class="collection">
                    <li class="collection-item avatar">
                        <span class="title"><a href="/AlternativaCertaWeb/servletweb?acao=EnunciadoQuestao&idQuestao=<%=questao.getidQuest()%>"><font size="5"><%=questao.getdesc_quest()%></font></a></span>
                    </li> 
                </ul>  
            </div>
        </div>
    </div>
      <% }%>
    <!--div class="container" class="page-footer teal">
        <form>


            <div>
                <h1 class="header center teal-text darken-3" id = "Portal">
                    Questões

                </h1>
            </div>
        </form>
    </div>

    <ul class="collection">
        <li class="collection-item avatar">
            <img src="Matemática.jpg" alt="" class="circle">
            <span class="title">Matemática</span>
            <p>Encontre aqui questões de matemática e suas tecnologias<br>

            </p>
            <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
        </li>
        <li class="collection-item avatar">
            <img src ="Portugues.jpg" alt ="" class ="circle">
            <span class="title">Linguagens </span>
            <p>Encontre aqui questões de Linguagens e suas tecnologias <br>

            </p>
            <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
        </li>
        <li class="collection-item avatar">
            <img src ="CienciasHumanas.jpg" alt ="" class ="circle">
            <span class="title">Ciências Humanas</span>
            <p>Encontre aqui questões de Ciências Humanas e suas Tecnologias<br>

            </p>
            <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
        </li>
        <li class="collection-item avatar">
            <img src ="CienciasNaturais.jpg" alt ="" class ="circle">
            <span class="title">Ciêcias Naturais</span>
            <p>Encontre aqui questões de Ciências Naturais e suas tecnologias <br>

            </p>

            <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
        </li>
        <li class="collection-item avatar">
            <img src ="Tec.jpg" alt ="" class ="circle">
            <span class="title">Questões Técnicas</span>
            <p>Encontre aqui questões técnicas <br>

            </p>
            <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
        </li>
    </ul>
    </div-->


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