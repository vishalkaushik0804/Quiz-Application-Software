
package buslogic;

import java.sql.SQLException;
import java.util.List;


public interface intopt {
      public void insopt(clsoptprp p)throws SQLException;
    public void updopt(clsoptprp p)throws SQLException;
    public void delopt(clsoptprp p)throws SQLException;
    public clsoptprp fndopt(int optcod)throws SQLException;
    public List<clsoptprp> dspopt()throws SQLException;
}
