
package buslogic;

import java.sql.SQLException;
import java.util.List;


public interface intres {
      public void insres(clsresprp p)throws SQLException;
    public void updres(clsresprp p)throws SQLException;
    public void delres(clsresprp p)throws SQLException;
    public clsresprp fndres(int rescod)throws SQLException;
    public List<clsresprp> dspres(int regcod)throws SQLException;
}
