
package buslogic;

import java.sql.SQLException;
import java.util.List;


public interface intreg {
      public void insreg(clsregprp p)throws SQLException;
    public void updreg(clsregprp p)throws SQLException;
    public void delreg(clsregprp p)throws SQLException;
    public clsregprp fndreg(int regcod)throws SQLException;
    public List<clsregprp> dspreg()throws SQLException;
}
