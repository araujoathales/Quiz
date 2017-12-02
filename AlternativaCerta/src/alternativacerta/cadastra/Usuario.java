package alternativacerta.cadastra;

/**
 *
 * @author bella
 */
public class Usuario {
    private String NomeCompleto;
    private String nomeusuario;
    private String senha;
    private String confirma;
    private String Email;
    private String tipo;
    private Long idUsuario;

    public Usuario() {}

    public Usuario(String NomeCompleto, String nomeusuario, String senha, String confirma,
            String Email, String tipo) {
        this.NomeCompleto = NomeCompleto;
        this.nomeusuario = nomeusuario;
        this.senha = senha;
        this.confirma = confirma;
        this.Email = Email;
        this.tipo = tipo;
    }

    public String getNomeCompleto() {
        return NomeCompleto;
    }

    public void setNomeCompleto(String NomeCompleto) {
        this.NomeCompleto = NomeCompleto;
    }

    public String getNomeusuario() {
        return nomeusuario;
    }

    public void setNomeusuario(String nomeusuario) {
        this.nomeusuario = nomeusuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getConfirma() {
        return confirma;
    }

    public void setConfirma(String confirma) {
        this.confirma = confirma;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
