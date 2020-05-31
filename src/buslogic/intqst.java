
package buslogic;

import java.sql.SQLException;
import java.util.List;

public interface intqst {
     public int insqst(clsqstprp p)throws SQLException;
    public void updqst(clsqstprp p)throws SQLException;
    public void delqst(clsqstprp p)throws SQLException;
    public clsqstprp fndqst(int qstcod)throws SQLException;
    public List<clsqstprp> dspqst(int ccod,String lvl)throws SQLException;
}
