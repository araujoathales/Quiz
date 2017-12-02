package alternativacerta.cadastra;
import alternativacerta.domain.ExcessoesPercistencia;

/**
 *
 * @author bella
 */
public interface IManterUsuario {
    public Long cadastrar(Usuario usuario) throws ExcessoesPercistencia;
    public boolean alterar(Usuario usuario) throws ExcessoesPercistencia;
    public boolean excluir(Usuario usuario) throws ExcessoesPercistencia;
    public Usuario pesquisarPorId(String idUsuario) throws ExcessoesPercistencia;
    public Usuario getUserLogin(String nome, String senha) throws ExcessoesPercistencia;
    
}
