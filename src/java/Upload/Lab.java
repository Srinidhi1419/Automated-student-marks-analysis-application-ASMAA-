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
class Lab {
    private String bcode;
    private String htno;
    private String scode;
    private int marks;

    Lab(String bcode, String htno, String scode, int marks) {
        this.bcode = bcode;
        this.htno = htno;
        this.scode = scode;
        this.marks = marks;        
    }

    public String getBcode() {
        return bcode;
    }

    public void setBcode(String bcode) {
        this.bcode = bcode;
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

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }    
    
}
