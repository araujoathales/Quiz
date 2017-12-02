package CadastroQuestao;

import java.io.Serializable;
/**
 *
 * @author bella
 */


public class Questao implements Serializable {

    private String desc_quest;
    private long idQuest;
    private String alternativas[];
    private String resposta;
    private String tipo;
    private String materia;
    private String dificuldade;

    public Questao() {
        alternativas[5] = new String();
    }
    
    public Questao(String desc_quest, String resposta, String materia, String dificuldade, String tipo) {
        this.desc_quest = desc_quest;
        this.resposta = resposta;
        this.materia = materia;
        this.dificuldade = dificuldade;
        this.tipo = tipo;

    }

    public String getDificuldade() {
        return dificuldade;
    }

    public void setDificuldade(String dificuldade) {
        this.dificuldade = dificuldade;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    

    public void setdesc_quest(String desc_quest) {
        this.desc_quest = desc_quest;
    }

    public String getdesc_quest() {
        return desc_quest;
    }

    public void setidQuest(long idQuest) {
        this.idQuest = idQuest;
    }

    public long getidQuest() {
        return idQuest;
    }

    public String[] getAlternativas() {
        return alternativas;
    }

    public void setAlternativas(String[] alternativas) {
        this.alternativas = alternativas;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

}
