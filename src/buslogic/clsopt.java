
package buslogic;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class clsopt implements intopt
{

    @Override
    public void insopt(clsoptprp p) throws SQLException {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call insopt(?,?)}");
      stm.setInt(1,p.getOptqstcod());
      stm.setString(2,p.getOptdsc());
      stm.execute();
      Dbutil.closecon();
    }

    @Override
    public void updopt(clsoptprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call updopt(?,?,?)}");
       stm.setInt(1,p.getOptcod());
       stm.setInt(2,p.getOptqstcod());
       stm.setString(3,p.getOptdsc());
       
       stm.execute();
       Dbutil.closecon();
    }

    @Override
    public void delopt(clsoptprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call delopt(?)}");
        stm.setInt(1, p.getOptcod());
        stm.execute();
        Dbutil.closecon();
    }

    @Override
    public clsoptprp fndopt(int qcod) throws SQLException  {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call fndopt(?)}");
          stm.setInt(1,qcod);
          ResultSet rs=stm.executeQuery();
          clsoptprp p=new clsoptprp();
          if(rs.next())
          {
              p.setOptcod(rs.getInt("optcod"));
              p.setOptqstcod(rs.getInt("optqstcod"));
               p.setOptdsc(rs.getString("optdsc"));
             
          }
          Dbutil.closecon();
          return p;
    }

    @Override
    public List<clsoptprp> dspopt() throws SQLException 
    {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call dspopt()}");
      ResultSet rs=stm.executeQuery();
        List<clsoptprp> lst=new ArrayList<clsoptprp>();
        while(rs.next())
        {
            clsoptprp p=new clsoptprp();
             p.setOptcod(rs.getInt("optcod"));
              p.setOptqstcod(rs.getInt("optqstcod"));
              p.setOptdsc(rs.getString("optdsc"));
            
            lst.add(p);
        }
        Dbutil.closecon();
        return lst;
    }
    
}
