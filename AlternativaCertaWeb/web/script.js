function exibeCampoEspecifico(id){
        var divAltFechada = document.getElementById("divfechada");
        var divVF = document.getElementById("divVF");
        var divC = document.getElementById("C");
        var divD = document.getElementById("D");
        var divE = document.getElementById("E");
        var divrespC = document.getElementById("respC");
        var divrespD = document.getElementById("respD");
        var divrespE = document.getElementById("respE");
        var selecionado = document.getElementById(id);
        var divUni = document.getElementById("divUni");
         var divUni = document.getElementById("divUni");
        

        if(selecionado.value == "aberta"){
            divAltFechada.className = "disable";
            divVF.className = "disable";

        } else {
            if(selecionado.value == "fechada"){
                divVF.className = "disable";

            if (divAltFechada.className === "disable") {
                    divAltFechada.className = "disable2";

            } else {
                divAltFechada.className = "disable";
              }

            } else {
                if(selecionado.value == "VF"){
                    divAltFechada.className = "disable";

                if (divVF.className === "disable") {
                    divVF.className = "disable2";

                } else {
                    divVF.className = "disable";
                  } 
                }
            }
        }

        if(selecionado.value == "2"){
            divC.className = "disable";
            divD.className = "disable";
            divE.className = "disable";
            divrespC.className = "disable";
            divrespD.className = "disable";
            divrespE.className = "disable";
        } else {
        if(selecionado.value == "3"){
            divD.className = "disable";
            divE.className = "disable";
            divC.className = "disable2";
            divrespD.className = "disable";
            divrespE.className = "disable";
            divrespC.className = "disable2";
        } else {
            if(selecionado.value == "4"){
                divE.className = "disable";
                divC.className = "disable2";
                divD.className = "disable2";  
                divrespE.className = "disable";
                divrespC.className = "disable2";
                divrespD.className = "disable2";  
            } else {
                if(selecionado.value == "5"){
                divE.className = "disable2";
                divC.className = "disable2";
                divD.className = "disable2";
                divrespE.className = "disable2";
                divrespC.className = "disable2";
                divrespD.className = "disable2";
            }
         }
       }
    }

     if(selecionado.value == "gestor"){
            divUni.className = "disable";

        }
}

    
