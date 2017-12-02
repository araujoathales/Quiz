function ValidaCadastro(frm) {
    if (frm.NomeCompleto.value == "") {
        alert("Favor, informe o nome!");
        frm.NomeCompleto.focus();
        return false;
    } else {
        if (frm.email.value == "") {
            alert("Favor, informe o Email!");
            frm.email.focus();
            return false;
        } else {
            if (frm.nomeusuario.value == "") {
                alert("Favor, informe o Nome de Usuário!");
                frm.nomeusuario.focus();
                return false;
            } else {
                if (frm.senha.value == "") {
                    alert("Favor, informe a Senha!");
                    frm.senha.focus();
                    return false;
                } else {
                    if (frm.confirma.value == "") {
                        alert("Favor, informe a Confimação da Senha!");
                        frm.confirma.focus();
                        return false;
                    } else {
                        if (frm.tipo.value == null) {
                            alert("Favor, informe o tipo de Usuário!");
                            frm.tipo.focus();
                            return false;
                        }
                    }
                }
            }
        }
    }
    
    caminho = "/AlternativaCertaWeb/servletweb?acao=GravarUsuario"; 
    frm.action = caminho;
    frm.submit();
}

function validarCamposLogin(frm) {
   
    if (frm.username == "") {
        alert("Favor, preencha o campo usuario!");
        frm.username.focus();
        return false;
    } else {
        if (frm.password == "") {
        alert("Favor, preencha o campo senha!");
        frm.password.focus();
        return false;
    } else {
        caminhourl = "/AlternativaCertaWeb/servletweb?acao=Logar";
        frm.action = caminhourl;
        frm.submit();
        return true;
    }
   }
   
   function ValidaQuestao(frm){
       alert("vai se fuder");
       caminho =  "/AlternativaCertaWeb/servletweb?acao=GravaQuestao";
       frm.action = caminho;
       frm.submit();
   }
}