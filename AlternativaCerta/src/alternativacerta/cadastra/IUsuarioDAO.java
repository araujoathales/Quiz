package alternativacerta.cadastra;

import alternativacerta.domain.ExcessoesPercistencia;

/**
 *
 * @author bella
 */
public interface IUsuarioDAO {
    Long inserir(Usuario pessoa) throws ExcessoesPercistencia;
    boolean atualizar(Usuario pessoa) throws ExcessoesPercistencia;
    boolean delete(Usuario pessoa) throws ExcessoesPercistencia;
    Usuario consultarPorId(String nomeusuario) throws ExcessoesPercistencia;
    Usuario consultarPorUsuarioSenha(String nome, String senha) throws ExcessoesPercistencia;
}
