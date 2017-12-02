package alternativacerta.cadastra;

import Connection.ConnectionManager;
import alternativacerta.domain.ExcessoesPercistencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author bella
 */
public class UsuarioDAO implements IUsuarioDAO {

    @Override
    public Long inserir(Usuario pessoa) throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();
            
            String sql2 = "SELECT Cod_Tipo FROM tipo_usuario WHERE Desc_Tipo = ?";

            PreparedStatement pstmt2 = connection.prepareStatement(sql2);
            pstmt2.setString(1, pessoa.getTipo());
            ResultSet rs = pstmt2.executeQuery();
            
            String cod_tipo = null;
            if(rs.next()){
                cod_tipo = rs.getString("Cod_Tipo");
            }
            
            rs.close();
            pstmt2.close();
            
            String sql = "INSERT INTO usuario (NomeCompleto, nomeusuario, Email, senha, Cod_Tipo)"
                    + " VALUES(?,?,?,?,?)";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, pessoa.getNomeCompleto());
            pstmt.setString(2, pessoa.getNomeusuario());
            pstmt.setString(3, pessoa.getEmail());
            pstmt.setString(4, pessoa.getSenha());
            pstmt.setString(5, cod_tipo);
            pstmt.executeUpdate();

            pstmt.close();
            connection.close();

            return pessoa.getIdUsuario();

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

    @Override
    public boolean atualizar(Usuario pessoa) throws ExcessoesPercistencia {
    try {

            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "UPDATE Usuario SET NomeCompleto = ?,"
                    + "Email = ? "
                    + "WHERE nomeusuario = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, pessoa.getNomeCompleto());
            pstmt.setString(2, pessoa.getEmail());
            pstmt.setString(3, pessoa.getNomeusuario());
            pstmt.execute();
            
            pstmt.close();
            connection.close();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        } 
    }

    @Override
    public boolean delete(Usuario pessoa) throws ExcessoesPercistencia {
    try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "DELETE FROM Usuario WHERE nomeusuario = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, pessoa.getNomeusuario());
            pstmt.executeUpdate();

            pstmt.close();
            connection.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }   
    }

    @Override
    public Usuario consultarPorId(String nomeusuario) throws ExcessoesPercistencia {
    try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT * FROM Usuario a JOIN tipo_usuario b "
                    + "ON a.Cod_Tipo = b.Cod_Tipo WHERE nomeusuario = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, nomeusuario);
            ResultSet rs = pstmt.executeQuery();

            Usuario usuario = null;
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setNomeCompleto(rs.getString("NomeCompleto"));
                usuario.setEmail(rs.getString("Email"));
                usuario.setConfirma(rs.getString("Senha"));
                usuario.setSenha(rs.getString("Senha"));
                usuario.setNomeusuario(rs.getString("nomeusuario"));
                usuario.setIdUsuario(null);
                usuario.setTipo(rs.getString("Desc_Tipo"));              
            }

            rs.close();
            pstmt.close();
            connection.close();

            return usuario;
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }   
    }

    @Override
    public Usuario consultarPorUsuarioSenha(String nome, String senha) throws ExcessoesPercistencia {
    try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT * FROM Usuario a JOIN tipo_usuario b "
                    + "ON a.Cod_Tipo = b.Cod_Tipo WHERE nomeusuario = ? AND senha = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, nome);
            pstmt.setString(2, senha);
            ResultSet rs = pstmt.executeQuery();
            
            Usuario usuario = null;
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setNomeCompleto(rs.getString("NomeCompleto"));
                usuario.setEmail(rs.getString("Email"));
                usuario.setConfirma(rs.getString("Senha"));
                usuario.setSenha(rs.getString("Senha"));
                usuario.setNomeusuario(rs.getString("nomeusuario"));
                usuario.setIdUsuario(null);
                usuario.setTipo(rs.getString("Desc_Tipo"));
            }

            rs.close();
            pstmt.close();
            connection.close();

            return usuario;
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }   
    

}
