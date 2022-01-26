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
class Mid1 {
    private String scode,sname,htno;
    private int m1,sq1,assign1,sum1;

    Mid1(String scode, String sname, String htno, int m1, int sq1, int assign1, int sum1) {
         this.htno = htno;
        this.scode = scode;
        this.sname = sname;
        this.m1=m1;
        this.sq1=sq1;
        this.assign1 = assign1;
        this.sum1=sum1;
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

    public String getHtno() {
        return htno;
    }

    public void setHtno(String htno) {
        this.htno = htno;
    }

    public int getM1() {
        return m1;
    }

    public void setM1(int m1) {
        this.m1 = m1;
    }

    public int getSq1() {
        return sq1;
    }

    public void setSq1(int sq1) {
        this.sq1 = sq1;
    }

    public int getAssign1() {
        return assign1;
    }

    public void setAssign1(int assign1) {
        this.assign1 = assign1;
    }

    public int getSum1() {
        return sum1;
    }

    public void setSum1(int sum1) {
        this.sum1 = sum1;
    }

}
