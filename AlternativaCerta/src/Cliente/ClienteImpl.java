package Cliente;

import CadastroQuestao.Questao;
import Forum.Forum;
import Proxy.Proxy;
import alternativacerta.cadastra.Usuario;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Thales
 */
public class ClienteImpl extends UnicastRemoteObject implements Cliente {

    Proxy proxy;
    
    public ClienteImpl() throws RemoteException {
        super();
        proxy = new Proxy();
    }
    
    @Override
    public Long ClienteQuestaoCadastrar(Questao questao) throws RemoteException {
        Long result = null;
        result = (Long) proxy.transportaDado(questao, 1, null);
        return result;
    }

    @Override
    public boolean ClienteQuestaoAlterar(Questao questao) throws RemoteException {
        boolean result = false;
        result = (boolean) proxy.transportaDado(questao, 2, null);
        return result;
    }

    @Override
    public boolean ClienteQuestaoExcluir(Questao questao) throws RemoteException {
        boolean result = false;
        result = (boolean) proxy.transportaDado(questao, 3, null);
        return result;
    }

    @Override
    public Questao ClienteQuestaoPesquisarPorId(Long idQuestao) throws RemoteException {
        Questao result = null;
        result = (Questao) proxy.transportaDado(idQuestao, 4, null);
        return result;
    }

    @Override
    public ArrayList<Questao> ClienteQuestaoListaTodos(String materia) throws RemoteException {
        ArrayList<Questao> result = null;
        result = (ArrayList<Questao>) proxy.transportaDado(materia, 5, null);
        return result;
    }

    @Override
    public ArrayList<String> ClienteQuestaoListaMateria() throws RemoteException {
       ArrayList<String> result = null;
       result = (ArrayList<String>) proxy.transportaDado(null, 6, null);
       return result; 
    }

    @Override
    public String ClienteDesempenhoGuardaResposta(Questao quest, Usuario usuario) throws RemoteException {
       String result = null;
       result = (String) proxy.transportaDado(quest, 7, usuario);
       return result; }

    @Override
    public ArrayList<Integer> ClienteDesempenhoMostraDesenpenho(Usuario usuario) throws RemoteException {
       ArrayList<Integer> result = null;
       result = (ArrayList<Integer>) proxy.transportaDado(null, 8, usuario);
       return result; 
    }

    @Override
    public boolean ClienteForumInserir(Forum Comentario) throws RemoteException {
       boolean result = false;
       result = (boolean) proxy.transportaDado(Comentario, 9, null);
       return result; 
    }

    @Override
    public boolean ClienteForumDelete(Forum Comentario) throws RemoteException {
       boolean result = false;
       result = (boolean) proxy.transportaDado(Comentario, 10, null);
       return result; 
    }

    @Override
    public boolean ClienteForumAtualizar(Forum Comentario) throws RemoteException {
       boolean result = false;
       result = (boolean) proxy.transportaDado(Comentario, 11, null);
       return result; 
    }

    @Override
    public ArrayList<Forum> ClienteForumListaTodos(Long idComentario) throws RemoteException {
       ArrayList<Forum> result = null;
       result = (ArrayList<Forum>) proxy.transportaDado(idComentario, 12, null);
       return result;
    }

    @Override
    public Forum ClienteForumPesquisarPorId(Timestamp dataPostagem) throws RemoteException {
       Forum result = null;
       result = (Forum) proxy.transportaDado(dataPostagem, 13, null);
       return result;
    }

    @Override
    public Long ClienteUsuarioInserir(Usuario pessoa) throws RemoteException {
       Long result = null;
       result = (Long) proxy.transportaDado(pessoa, 14, null);
       return result;
    }

    @Override
    public boolean ClienteUsuarioAtualizar(Usuario pessoa) throws RemoteException {
       boolean result = false;
       result = (boolean) proxy.transportaDado(pessoa, 15, null);
       return result;
    }

    @Override
    public boolean ClienteUsuarioDelete(Usuario pessoa) throws RemoteException {
       boolean result = false;
       result = (boolean) proxy.transportaDado(pessoa, 16, null);
       return result;
    }

    @Override
    public Usuario ClienteUsuarioConsultarPorId(String nomeusuario) throws RemoteException {
       Usuario result = null;
       result = (Usuario) proxy.transportaDado(nomeusuario, 17, null);
       return result;}

    @Override
    public Usuario ClienteUsuarioConsultarPorUsuarioSenha(String nome, String senha) throws RemoteException {
       Usuario result = null;
       Usuario user = new Usuario(null, nome, senha, null, null, null);
       result = (Usuario) proxy.transportaDado(user, 17, null);
       return result;
    }
    
}
