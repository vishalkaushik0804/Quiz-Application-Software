
package buslogic;

import java.sql.Date;


public class clsregprp {
    private int regcod;
    private String regeml,regpwd,regrol;
    private Date regdat;

    public int getRegcod() {
        return regcod;
    }

    public void setRegcod(int regcod) {
        this.regcod = regcod;
    }

    public String getRegeml() {
        return regeml;
    }

    public void setRegeml(String regeml) {
        this.regeml = regeml;
    }

    public String getRegpwd() {
        return regpwd;
    }

    public void setRegpwd(String regpwd) {
        this.regpwd = regpwd;
    }

    public Date getRegdat() {
        return regdat;
    }

    public void setRegdat(Date regdat) {
        this.regdat = regdat;
    }

    public String getRegrol() {
        return regrol;
    }

    public void setRegrol(String regrol) {
        this.regrol = regrol;
    }
}
