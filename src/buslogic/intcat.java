
package buslogic;

import java.sql.SQLException;
import java.util.List;

public interface intcat {
     public void inscat(clscatprp p)throws SQLException;
    public void updcat(clscatprp p)throws SQLException;
    public void delcat(clscatprp p)throws SQLException;
    public clscatprp fndcat(int catcod)throws SQLException;
    public List<clscatprp> dspcat();
    
}
