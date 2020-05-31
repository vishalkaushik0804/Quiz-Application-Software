
package buslogic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Dbutil {
    static Connection con;
    
    public static void getcon()
    {
        try {
            if(con==null)
            {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/dbqst","root","");      
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Dbutil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Dbutil.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }
    
    public static void closecon()
    {
        if(con==null)
            return;
        else
        {
            try
            {
                con.close();
                con=null;
            }
            catch (SQLException ex) 
            {
                Logger.getLogger(Dbutil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
