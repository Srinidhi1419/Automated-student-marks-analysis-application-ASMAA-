/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

/**
 *
 * @author Prudvi
 */
public class Sem {
    private String htno;
    private String scode;
    private String sname;
    private String grade;
    private int credits;
    
    Sem(String htno, String scode, String sname, String grade, int credits) {
        this.htno = htno;
        this.scode = scode;
        this.sname = sname;
        this.grade= grade;
        this.credits = credits;
    }

    public String getHtno() {
        return htno;
    }

    public void setHtno(String htno) {
        this.htno = htno;
    }

    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }
    public String getBranch(){
        switch(this.htno.substring(6,8))
        {
            case "01": return "CIVIL";
            case "02": return "EEE";
            case "03": return "MECH";
            case "04": return "ECE";
            case "05": return "CSE";
            case "35": return "AGRI";
            default :return "-";
                
        }
    }
}
