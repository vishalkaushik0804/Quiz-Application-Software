
package buslogic;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class clscat implements intcat
{

    @Override
    public void inscat(clscatprp p) throws SQLException {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call inscat(?)}");
      stm.setString(1,p.getCatnam());
      stm.execute();
      Dbutil.closecon();
    }

    @Override
    public void updcat(clscatprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call updcat(?,?)}");
       stm.setInt(1,p.getCatcod());
       stm.setString(2,p.getCatnam());
       
       stm.execute();
       Dbutil.closecon();
    }

    @Override
    public void delcat(clscatprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call delcat(?)}");
        stm.setInt(1, p.getCatcod());
        stm.execute();
        Dbutil.closecon();
    }

    @Override
    public clscatprp fndcat(int catcod) throws SQLException  {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call fndcat(?)}");
          stm.setInt(1,catcod);
          ResultSet rs=stm.executeQuery();
          clscatprp p=new clscatprp();
          if(rs.next())
          {
              p.setCatcod(rs.getInt("catcod"));
              p.setCatnam(rs.getString("catnam"));
             
          }
          Dbutil.closecon();
          return p;
    }

    @Override
    public List<clscatprp> dspcat() 
    {
         List<clscatprp> lst=new ArrayList<clscatprp>();
        Dbutil.getcon();
 CallableStatement stm;
        try {
            stm = Dbutil.con.prepareCall("{call dspcat()}");
             ResultSet rs=stm.executeQuery();
       
        while(rs.next())
        {
            clscatprp p=new clscatprp();
            p.setCatcod(rs.getInt("catcod"));
            p.setCatnam(rs.getString("catnam"));
            
            lst.add(p);
        }
          Dbutil.closecon();
        } catch (SQLException ex) {
            Logger.getLogger(clscat.class.getName()).log(Level.SEVERE, null, ex);
        }
     
      
        return lst;
    }
    
}