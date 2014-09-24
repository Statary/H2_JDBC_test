package jdbc_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBC_test {

  public static void main(String[] args) {
    Connection conn = null;
    Statement statement = null;
    ResultSet res= null;
      
    try {
      Class.forName("org.h2.Driver");

      conn = DriverManager.getConnection("jdbc:h2:file:./db/netbeans_jdbc", "sa", "");

      statement = conn.createStatement();
      
      statement.execute("USE SCHEMA SCHOOL");
//      res = statement.executeQuery("SELECT STUDENT.*, LESSON.NAME AS LESSON_NAME FROM STUDENT, LESSON"
//              + " WHERE STUDENT.LESSON_ID = LESSON.ID"
//              );
      res = statement.executeQuery("SELECT STUDENT.*, LESSON.NAME AS LESSON_NAME FROM STUDENT"
              + " INNER JOIN LESSON ON STUDENT.LESSON_ID = LESSON.ID"
              );
      
      while ( res.next())
      {
        System.out.println(res.getString("FIO")+", mark:"+res.getString("ball")
                +", lesson:"+res.getString("lesson_name")
                );
      }
      
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(JDBC_test.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      try {
        conn.close();
        statement.close();
        res.close();
      } catch (SQLException ex) {
        Logger.getLogger(JDBC_test.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
  }
}
