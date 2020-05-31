
package buslogic;

import java.sql.Date;






public class clsqstprp {
    private int qstcod,qstcatcod;
    private String qstdsc,qstimg;
    private String qstlvl;
    private Date qstpstdat; 

    public int getQstcod() {
        return qstcod;
    }

    public void setQstcod(int qstcod) {
        this.qstcod = qstcod;
    }

    public int getQstcatcod() {
        return qstcatcod;
    }

    public void setQstcatcod(int qstcatcod) {
        this.qstcatcod = qstcatcod;
    }

    public String getQstdsc() {
        return qstdsc;
    }

    public void setQstdsc(String qstdsc) {
        this.qstdsc = qstdsc;
    }

    public Date getQstpstdat() {
        return qstpstdat;
    }

    public void setQstpstdat(Date qstpstdat) {
        this.qstpstdat = qstpstdat;
    }

    public String getQstimg() {
        return qstimg;
    }

    public void setQstimg(String qstimg) {
        this.qstimg = qstimg;
    }

    public String getQstlvl() {
        return qstlvl;
    }

    public void setQstlvl(String qstlvl) {
        this.qstlvl = qstlvl;
    }
    
    
}
