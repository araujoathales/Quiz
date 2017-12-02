package CadastroQuestao;

import Connection.ConnectionManager;
import alternativacerta.domain.ExcessoesPercistencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author bella
 */
public class QuestaoDAO implements IQuestaoDAO {

    public static Random id = new Random();

    @Override
    public Long cadastrar(Questao questao) throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT Cod_Materia FROM materia WHERE Desc_Materia = ?";
            PreparedStatement pstmt3 = connection.prepareStatement(sql);
            pstmt3.setString(1, questao.getMateria());
            ResultSet rs2 = pstmt3.executeQuery();

            String cod_materia = null;
            if (rs2.next()) {
                cod_materia = new String(rs2.getString("Cod_Materia"));
            }

            rs2.close();
            pstmt3.close();

            String sql4 = "SELECT Cod_dificuldade FROM dificuldade WHERE Peso_dificuldade = ?";
            PreparedStatement pstmt4 = connection.prepareStatement(sql4);
            pstmt4.setString(1, questao.getDificuldade());
            ResultSet rs4 = pstmt4.executeQuery();

            String cod_dificuldade = null;
            if (rs4.next()) {
                cod_dificuldade = new String(rs4.getString("Cod_dificuldade"));
            }

            String sql3 = "INSERT INTO questoes (Txt_Enunciado, Cod_Questao, Cod_dificuldade, Cod_Materia, resposta)"
                    + " VALUES(?,?,?,?,?)";

            PreparedStatement pstmt = connection.prepareStatement(sql3);
            pstmt.setString(1, questao.getdesc_quest());

            Long idQuest = new Long(id.nextInt(10000));
            pstmt.setLong(2, idQuest);

            pstmt.setString(3, cod_dificuldade);
            pstmt.setString(4, cod_materia);
            pstmt.setString(5, questao.getResposta());

            pstmt.executeUpdate();

            if (questao.getTipo() == "Fechada") {
                for (int i = 0; i < questao.getAlternativas().length; i++) {
                    String sql2 = "INSERT INTO questao_fechada (Seq_Opcao, Cod_Questao, desc_Opcao)"
                            + " VALUES(?,?,?)";
                    PreparedStatement pstmt2 = connection.prepareStatement(sql2);
                    pstmt2.setInt(1, i);
                    pstmt2.setLong(2, idQuest);
                    pstmt2.setString(3, questao.getAlternativas()[i]);
                    pstmt2.executeUpdate();
                    pstmt2.close();
                }
            }

            rs4.close();
            pstmt.close();
            pstmt4.close();
            connection.close();

            return questao.getidQuest();

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

    @Override
    public boolean alterar(Questao questao) throws ExcessoesPercistencia {
        try {

            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql2 = "SELECT Cod_Materia FROM materia WHERE Desc_Materia = ?";
            PreparedStatement pstmt3 = connection.prepareStatement(sql2);
            pstmt3.setString(1, questao.getMateria());
            ResultSet rs2 = pstmt3.executeQuery();

            String cod_materia = null;
            if (rs2.next()) {
                cod_materia = new String(rs2.getString("Cod_Materia"));
            }

            rs2.close();
            pstmt3.close();

            String sql4 = "SELECT Cod_dificuldade FROM dificuldade WHERE Peso_dificuldade = ?";
            PreparedStatement pstmt4 = connection.prepareStatement(sql4);
            pstmt4.setString(1, questao.getDificuldade());
            ResultSet rs4 = pstmt4.executeQuery();

            String cod_dificuldade = null;
            if (rs4.next()) {
                cod_dificuldade = new String(rs4.getString("Cod_dificuldade"));
            }
            rs4.close();
            pstmt4.close();

            String sql = "UPDATE questoes SET Txt_Enunciado = ?,"
                    + "resposta = ?"
                    + "WHERE Cod_Questao = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, questao.getdesc_quest());
            pstmt.setString(2, questao.getResposta());
            pstmt.setLong(3, questao.getidQuest());
            pstmt.execute();

            if (questao.getTipo() == "Fechada") {
                for (int i = 0; i < questao.getAlternativas().length; i++) {
                    String sql5 = "UPDATE questao_fechada SET "
                            + " desc_Opcao = ?"
                            + " WHERE Cod_Questao = ?";
                    PreparedStatement pstmt2 = connection.prepareStatement(sql5);
                    pstmt2.setString(1, questao.getAlternativas()[i]);
                    pstmt2.setLong(2, questao.getidQuest());
                    pstmt2.execute();
                    pstmt2.close();
                }
            } else {
                if (questao.getTipo() == "Aberta") {
                    String sql3 = "DELETE FROM questao_fechada WHERE Cod_Questao = ?";

                    PreparedStatement pstmt5 = connection.prepareStatement(sql3);
                    pstmt5.setLong(1, questao.getidQuest());
                    pstmt5.executeUpdate();

                    pstmt5.close();
                }
            }

            pstmt.close();
            connection.close();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

    @Override
    public boolean excluir(Questao Questao) throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            if (Questao.getTipo() == "Fechada") {
                for (int i = 0; i < Questao.getAlternativas().length; i++) {
                    String sql5 = "DELETE FROM questao_fechada WHERE Cod_Questao = ?";
                    PreparedStatement pstmt2 = connection.prepareStatement(sql5);

                    pstmt2.setLong(1, Questao.getidQuest());
                    pstmt2.execute();

                    pstmt2.close();
                }
            }

            String sql = "DELETE FROM questoes WHERE Cod_Questao = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setLong(1, Questao.getidQuest());
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
    public Questao pesquisarPorId(Long idQuestao) throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT * FROM questoes as a "
                    + "LEFT OUTER JOIN questao_fechada as b on a.Cod_Questao = b.Cod_Questao "
                    + "LEFT OUTER JOIN materia as c on a.Cod_Materia = c.Cod_Materia "
                    + "WHERE a.Cod_Questao = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setLong(1, idQuestao);
            ResultSet rs = pstmt.executeQuery();

            Questao questao = null;
            if (rs.next()) {
                questao = new Questao(null, null, null, null, null);
                System.out.println("passei");
                questao.setDificuldade(rs.getString("Cod_dificuldade"));
                questao.setdesc_quest(rs.getString("Txt_Enunciado"));
                questao.setResposta(rs.getString("resposta"));
                questao.setMateria(rs.getString("Desc_Materia"));
                questao.setidQuest(rs.getLong("Cod_Questao"));

                String[] alternativa = new String[5];
                int i = 0;
                while (rs.next()) {
                    alternativa[i] = rs.getString("desc_Opcao");
                    i++;
                }

                questao.setAlternativas(alternativa);

            }
            rs.close();
            pstmt.close();
            connection.close();

            return questao;

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

    @Override
    public ArrayList<Questao> ListaTodos(String materia) throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();
            String sql = "SELECT * FROM questoes as a "
                    + "JOIN questao_fechada as b on a.Cod_Questao = b.Cod_Questao "
                    + "JOIN materia as c on a.Cod_Materia = c.Cod_Materia "
                    + "WHERE Desc_Materia = ?";

            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, materia);
            ResultSet rs = pstmt.executeQuery();

            ArrayList<Questao> ListaTd = null;
            if (rs.next()) {
                ListaTd = new ArrayList<>();
                do {
                    Questao questao = new Questao(null, null, null, null, null);
                    questao.setDificuldade(rs.getString("Cod_dificuldade"));
                    questao.setdesc_quest(rs.getString("Txt_Enunciado"));
                    questao.setResposta(rs.getString("resposta"));
                    questao.setMateria(rs.getString("Desc_Materia"));
                    questao.setidQuest(rs.getLong("Cod_Questao"));

                    String[] alternativa = new String[5];
                    int i = 0;
                    while (rs.next() && i < alternativa.length) {
                        alternativa[i] = rs.getString("desc_Opcao");
                        i++;
                    }

                    questao.setAlternativas(alternativa);
                    ListaTd.add(questao);
                } while (rs.next());

            }

            rs.close();
            pstmt.close();
            connection.close();

            return ListaTd;

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

    @Override
    public ArrayList<String> ListaMateria() throws ExcessoesPercistencia {
        try {
            Connection connection = ConnectionManager.getInstance().getConnection();
            
            String sql2 = "SELECT * FROM materia";
            PreparedStatement pstmt3 = connection.prepareStatement(sql2);
            ResultSet rs2 = pstmt3.executeQuery();
            ArrayList<String> ListMateria = null;
            
            if(rs2.next()){
            ListMateria = new ArrayList<>();  
             do{
                ListMateria.add(rs2.getString("Desc_Materia"));
                System.out.println("ola");
             } while(rs2.next());
             
             }
            
            rs2.close();
            pstmt3.close();
            connection.close();
            
            return ListMateria;
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExcessoesPercistencia(e.getMessage(), e);
        }
    }

}
