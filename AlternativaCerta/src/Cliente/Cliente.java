package Cliente;

import CadastroQuestao.Questao;
import Forum.Forum;
import alternativacerta.cadastra.Usuario;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Thales
 */
public interface Cliente extends Remote {
    public Long ClienteQuestaoCadastrar(Questao questao) throws RemoteException;
    public boolean ClienteQuestaoAlterar(Questao questao) throws RemoteException;
    public boolean ClienteQuestaoExcluir(Questao questao) throws RemoteException;
    public Questao ClienteQuestaoPesquisarPorId(Long idQuestao) throws RemoteException;
    public ArrayList<Questao> ClienteQuestaoListaTodos(String materia) throws RemoteException;
    public ArrayList<String> ClienteQuestaoListaMateria() throws RemoteException;
    public String ClienteDesempenhoGuardaResposta(Questao quest, Usuario usuario) throws RemoteException;
    public ArrayList<Integer> ClienteDesempenhoMostraDesenpenho(Usuario usuario) throws RemoteException;
    public boolean ClienteForumInserir(Forum Comentario) throws RemoteException;
    public boolean ClienteForumDelete(Forum Comentario) throws RemoteException;
    public boolean ClienteForumAtualizar(Forum Comentatio) throws RemoteException;
    public ArrayList<Forum> ClienteForumListaTodos(Long idComentatio) throws RemoteException;
    public Forum ClienteForumPesquisarPorId(Timestamp dataPostagem) throws RemoteException;
    public Long ClienteUsuarioInserir(Usuario pessoa) throws RemoteException;
    public boolean ClienteUsuarioAtualizar(Usuario pessoa) throws RemoteException;
    public boolean ClienteUsuarioDelete(Usuario pessoa) throws RemoteException;
    public Usuario ClienteUsuarioConsultarPorId(String nomeusuario) throws RemoteException;
    public Usuario ClienteUsuarioConsultarPorUsuarioSenha(String nome, String senha) throws RemoteException;
}
