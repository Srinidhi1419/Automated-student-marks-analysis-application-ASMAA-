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
class Mid2 {
    private String scode,sname,htno;
    private int m1,sq1,assign1,sum1,m2,sq2,assign2,sum2,GrandSum;

    Mid2(String scode, String sname, String htno, int m1, int sq1, int assign1, int sum1, int m2, int sq2, int assign2, int sum2, int GrandSum) {
        this.htno = htno;
        this.scode = scode;
        this.sname = sname;
        this.m1=m1;
        this.sq1=sq1;
        this.assign1 = assign1;
        this.sum1=sum1;
        this.m2=m2;
        this.sq2=sq2;
        this.assign2=assign2;
        this.sum2=sum2;
        this.GrandSum=GrandSum;
       
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

    public int getM2() {
        return m2;
    }

    public void setM2(int m2) {
        this.m2 = m2;
    }

    public int getSq2() {
        return sq2;
    }

    public void setSq2(int sq2) {
        this.sq2 = sq2;
    }

    public int getAssign2() {
        return assign2;
    }

    public void setAssign2(int assign2) {
        this.assign2 = assign2;
    }

    public int getSum2() {
        return sum2;
    }

    public void setSum2(int sum2) {
        this.sum2 = sum2;
    }

    public int getGrandSum() {
        return GrandSum;
    }

    public void setGrandSum(int GrandSum) {
        this.GrandSum = GrandSum;
    }
    
}
