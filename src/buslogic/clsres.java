
package buslogic;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class clsres implements intres
{

    @Override
    public void insres(clsresprp p) throws SQLException {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call insres(?,?,?,?,?)}");
      stm.setInt(1,p.getResregcod());
      stm.setInt(2,p.getRescatcod());
       stm.setInt(3,p.getRestotscr());
        stm.setInt(4,p.getResscrach());
        stm.setDate(5,p.getResdat());
         
        
      stm.execute();
      Dbutil.closecon();
    }

    @Override
    public void updres(clsresprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call updres(?,?,?,?,?,?)}");
       stm.setInt(1,p.getRescod());
     stm.setInt(2,p.getResregcod());
      stm.setInt(3,p.getRescatcod());
       stm.setInt(4,p.getRestotscr());
        stm.setInt(5,p.getResscrach());
        stm.setDate(6,p.getResdat());
       
       stm.execute();
       Dbutil.closecon();
    }

    @Override
    public void delres(clsresprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call delres(?)}");
        stm.setInt(1, p.getRescod());
        stm.execute();
        Dbutil.closecon();
    }

    @Override
    public clsresprp fndres(int rescod) throws SQLException  {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call fndres(?)}");
          stm.setInt(1,rescod);
          ResultSet rs=stm.executeQuery();
          clsresprp p=new clsresprp();
          if(rs.next())
          {
              p.setRescod(rs.getInt("rescod"));
              p.setResregcod(rs.getInt("resregcod"));
               p.setRescatcod(rs.getInt("rescatcod"));
               p.setRestotscr(rs.getInt("restotscr"));
              p.setResscrach(rs.getInt("resscrach"));
               p.setResdat(rs.getDate("resdat"));
              
             
          }
          Dbutil.closecon();
          return p;
    }

    @Override
    public List<clsresprp> dspres(int regcod) throws SQLException 
    {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call dspres(?)}");
 stm.setInt(1, regcod);
      ResultSet rs=stm.executeQuery();
        List<clsresprp> lst=new ArrayList<clsresprp>();
        while(rs.next())
        {
            clsresprp p=new clsresprp();
             p.setRescod(rs.getInt("rescod"));
              p.setResregcod(rs.getInt("resregcod"));
               p.setRescatcod(rs.getInt("rescatcod"));
               p.setRestotscr(rs.getInt("restotscr"));
              p.setResscrach(rs.getInt("resscrach"));
               p.setResdat(rs.getDate("resdat"));
            
            lst.add(p);
        }
        Dbutil.closecon();
        return lst;
    }
    
}

