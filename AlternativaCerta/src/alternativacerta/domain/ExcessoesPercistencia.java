package alternativacerta.domain;


public class ExcessoesPercistencia extends Exception{
    
    public ExcessoesPercistencia(String msg){
        super(msg);
    }
    public ExcessoesPercistencia(Exception ex){
        super(ex);
    }

    public ExcessoesPercistencia(String message, Exception e) {
        super(message, e);
    }
}
