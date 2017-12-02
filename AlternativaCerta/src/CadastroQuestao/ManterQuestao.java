package CadastroQuestao;

import alternativacerta.domain.ExcessoesPercistencia;
import java.util.ArrayList;

/**
 *
 * @author bella
 */
public class ManterQuestao implements IManterQuestao{
    
    public QuestaoDAO questaoDao = new QuestaoDAO();
     
    @Override
    public Long cadastrar(Questao questao) throws ExcessoesPercistencia {
        questaoDao.cadastrar(questao);
        return questao.getidQuest();
    }

    @Override
    public boolean alterar(Questao questao) throws ExcessoesPercistencia {
        boolean result = questaoDao.alterar(questao);
        return result;
    }

    @Override
    public boolean excluir(Questao questao) throws ExcessoesPercistencia {
        boolean result = questaoDao.excluir(questao);
        return result;
    }

    @Override
    public Questao pesquisarPorId(Long idQuestao) throws ExcessoesPercistencia {
       Questao result = questaoDao.pesquisarPorId(idQuestao);
       return result;
    }

    @Override
    public ArrayList<Questao> ListaTodos(String materia) throws ExcessoesPercistencia {
       ArrayList<Questao> result = questaoDao.ListaTodos(materia);
       return result;
    }

    @Override
    public ArrayList<String> ListaMateria() throws ExcessoesPercistencia {
       ArrayList<String> result = questaoDao.ListaMateria();
       return result;
    }
    
}
