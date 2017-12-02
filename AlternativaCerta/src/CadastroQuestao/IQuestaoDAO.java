package CadastroQuestao;

import alternativacerta.domain.ExcessoesPercistencia;
import java.util.ArrayList;

/**
 *
 * @author bella
 */
public interface IQuestaoDAO {
    public Long cadastrar(Questao questao) throws ExcessoesPercistencia;
    public boolean alterar(Questao questao) throws ExcessoesPercistencia;
    public boolean excluir(Questao questao) throws ExcessoesPercistencia;
    public Questao pesquisarPorId(Long idQuestao) throws ExcessoesPercistencia;
    public ArrayList<Questao> ListaTodos(String materia) throws ExcessoesPercistencia;
    public ArrayList<String> ListaMateria() throws ExcessoesPercistencia;
}
