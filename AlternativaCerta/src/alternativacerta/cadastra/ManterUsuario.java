package alternativacerta.cadastra;

import alternativacerta.domain.ExcessoesPercistencia;

/**
 *
 * @author bella
 */
public class ManterUsuario implements IManterUsuario{

    public UsuarioDAO usuarioDao = new UsuarioDAO();
    
    @Override
    public Long cadastrar(Usuario usuario) throws ExcessoesPercistencia {
    
        usuarioDao.inserir(usuario);

        return usuario.getIdUsuario();  
    }

    @Override
    public boolean alterar(Usuario usuario) throws ExcessoesPercistencia {
       
        if (usuario.getNomeusuario()== null) {
            throw new ExcessoesPercistencia("Obrigatório informar a descrição");
        }

        boolean result = usuarioDao.atualizar(usuario);

        return result;
    }

    @Override
    public boolean excluir(Usuario usuario) throws ExcessoesPercistencia {
       boolean result = usuarioDao.delete(usuario);
       return result;
    }

    @Override
    public Usuario pesquisarPorId(String idUsuario) throws ExcessoesPercistencia {
        Usuario result = usuarioDao.consultarPorId(idUsuario);
        return result;
    }
    
    @Override
       public Usuario getUserLogin(String nome, String senha) throws  ExcessoesPercistencia {
        Usuario result = usuarioDao.consultarPorUsuarioSenha(nome, senha);
        return result;               
    }

    
}
