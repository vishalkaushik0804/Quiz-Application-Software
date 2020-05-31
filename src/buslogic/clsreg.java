
package buslogic;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class clsreg implements intreg
{
    public ArrayList logincheck(clsregprp p) throws SQLException
    {
        Dbutil.getcon();
        CallableStatement stm=Dbutil.con.prepareCall("{call logincheck(?,?,?,?)}");
        stm.setString(1, p.getRegeml());
        stm.setString(2, p.getRegpwd());
        stm.registerOutParameter(3, Types.INTEGER);
        stm.registerOutParameter(4, Types.CHAR,1);
        stm.execute();
        ArrayList arr=new ArrayList();
        arr.add(stm.getInt("cod"));
        arr.add(stm.getString("rol").charAt(0));
        Dbutil.closecon();
        return arr;
    }
    @Override
    public void insreg(clsregprp p) throws SQLException {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call insreg(?,?,?,?)}");
      stm.setString(1,p.getRegeml());
      stm.setString(2,p.getRegpwd());
       stm.setDate(3,p.getRegdat());
        stm.setString(4,p.getRegrol());
         
        
      stm.execute();
      Dbutil.closecon();
    }

    @Override
    public void updreg(clsregprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call updreg(?,?,?,?,?)}");
       stm.setInt(1,p.getRegcod());
       stm.setString(1,p.getRegeml());
      stm.setString(2,p.getRegpwd());
       stm.setDate(3,p.getRegdat());
        stm.setString(4,p.getRegrol());
       
       stm.execute();
       Dbutil.closecon();
    }

    @Override
    public void delreg(clsregprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call delreg(?)}");
        stm.setInt(1, p.getRegcod());
        stm.execute();
        Dbutil.closecon();
    }

    @Override
    public clsregprp fndreg(int regcod) throws SQLException  {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call fndreg(?)}");
          stm.setInt(1,regcod);
          ResultSet rs=stm.executeQuery();
          clsregprp p=new clsregprp();
          if(rs.next())
          {
              p.setRegcod(rs.getInt("regcod"));
              p.setRegeml(rs.getString("regeml"));
               p.setRegpwd(rs.getString("regpwd"));
               p.setRegdat(rs.getDate("regdat"));
              p.setRegrol(rs.getString("regrol"));
              
             
          }
          Dbutil.closecon();
          return p;
    }

    @Override
    public List<clsregprp> dspreg() throws SQLException 
    {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call dspreg()}");
      ResultSet rs=stm.executeQuery();
        List<clsregprp> lst=new ArrayList<clsregprp>();
        while(rs.next())
        {
            clsregprp p=new clsregprp();
             p.setRegcod(rs.getInt("regcod"));
              p.setRegeml(rs.getString("regeml"));
               p.setRegpwd(rs.getString("regpwd"));
                p.setRegdat(rs.getDate("regdat"));
              p.setRegrol(rs.getString("regrol"));
            
            lst.add(p);
        }
        Dbutil.closecon();
        return lst;
    }
    
}
