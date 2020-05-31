
package buslogic;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;


public class clsqst implements intqst
{

    @Override
    public int insqst(clsqstprp p) throws SQLException {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call insqst(?,?,?,?,?,?)}");
      stm.setString(1,p.getQstdsc());
      stm.setInt(2,p.getQstcatcod());
       stm.setString(3,p.getQstlvl());
        stm.setDate(4,p.getQstpstdat());
         stm.setString(5,p.getQstimg());
        stm.registerOutParameter(6,Types.INTEGER);
      stm.execute();
      int cod=stm.getInt(6);
      Dbutil.closecon();
      return cod;
    }

    @Override
    public void updqst(clsqstprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call updqst(?,?,?,?,?,?)}");
       stm.setInt(1,p.getQstcod());
        stm.setString(2,p.getQstdsc());
      stm.setInt(3,p.getQstcatcod());
       stm.setString(4,p.getQstlvl());
         stm.setDate(5,p.getQstpstdat());
         stm.setString(6,p.getQstimg());
       
       stm.execute();
       Dbutil.closecon();
    }

    @Override
    public void delqst(clsqstprp p) throws SQLException  {
       Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call delqst(?)}");
        stm.setInt(1, p.getQstcod());
        stm.execute();
        Dbutil.closecon();
    }

    @Override
    public clsqstprp fndqst(int qstcod) throws SQLException  {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call fndqst(?)}");
          stm.setInt(1,qstcod);
          ResultSet rs=stm.executeQuery();
          clsqstprp p=new clsqstprp();
          if(rs.next())
          {
              p.setQstcod(rs.getInt("optcod"));
              p.setQstdsc(rs.getString("qstdsc"));
               p.setQstcatcod(rs.getInt("qstcatcod"));
               p.setQstlvl(rs.getString("qstlvl"));
              p.setQstpstdat(rs.getDate("qstpstdat"));
               p.setQstimg(rs.getString("qstimg"));
             
          }
          Dbutil.closecon();
          return p;
    }
    

    @Override
    public List<clsqstprp> dspqst(int ccod,String lvl) throws SQLException 
    {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call dspqst(?,?)}");
 stm.setInt(1, ccod);
 stm.setString(2, lvl);
      ResultSet rs=stm.executeQuery();
        List<clsqstprp> lst=new ArrayList<clsqstprp>();
        while(rs.next())
        {
            clsqstprp p=new clsqstprp();
             p.setQstcod(rs.getInt("qstcod"));
              p.setQstdsc(rs.getString("qstdsc"));
               p.setQstcatcod(rs.getInt("qstcatcod"));
               p.setQstlvl(rs.getString("qstlvl"));
              p.setQstpstdat(rs.getDate("qstpstdat"));
               p.setQstimg(rs.getString("qstimg"));
            
            lst.add(p);
        }
        Dbutil.closecon();
        return lst;
    }
    
      public List<clsqstprp> dspppr(int ccod,String lvl) throws SQLException 
    {
        Dbutil.getcon();
 CallableStatement stm=Dbutil.con.prepareCall("{call dspppr(?,?)}");
 stm.setInt(1, ccod);
 stm.setString(2, lvl);
      ResultSet rs=stm.executeQuery();
        List<clsqstprp> lst=new ArrayList<clsqstprp>();
        while(rs.next())
        {
            clsqstprp p=new clsqstprp();
             p.setQstcod(rs.getInt("qstcod"));
              p.setQstdsc(rs.getString("qstdsc"));
               p.setQstcatcod(rs.getInt("qstcatcod"));
               p.setQstlvl(rs.getString("qstlvl"));
              p.setQstpstdat(rs.getDate("qstpstdat"));
               p.setQstimg(rs.getString("qstimg"));
            
            lst.add(p);
        }
        Dbutil.closecon();
        return lst;
    }
    
}
