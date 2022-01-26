/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import DBConnection.DBConnection;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Prudvi
 */
@WebServlet(name = "StudentDetails", urlPatterns = {"/StudentDetails"})
@MultipartConfig(fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
public class StudentDetails extends HttpServlet {
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            InputStream inputStream = null;
            String htno = request.getParameter("htno");
            String sname = request.getParameter("sname");
            String aadhar = request.getParameter("aadhar");
            String fname = request.getParameter("fname");
            String foccup = request.getParameter("foccup");  
            String mname = request.getParameter("mname"); 
            String moccup = request.getParameter("moccup");
            String caste = request.getParameter("caste");
            String stype = request.getParameter("stype");
            String htype = request.getParameter("htype");
            String cet = request.getParameter("cet");
            String dob = request.getParameter("dob");
            String blood = request.getParameter("blood");
            String caddr = request.getParameter("caddr");
            String paddr = request.getParameter("paddr");
            String smno = request.getParameter("smno");
            String pmno = request.getParameter("pmno");
            String plno = request.getParameter("plno");
            String semail = request.getParameter("semail");
            String pemail = request.getParameter("pemail");
            String ssc = request.getParameter("ssc");
            String inst1 = request.getParameter("inst1");
            String yop1 = request.getParameter("yop1");
            String marks1 = request.getParameter("marks1");
            String inter = request.getParameter("inter");
            String inst2 = request.getParameter("inst2");
            String yop2 = request.getParameter("yop2");
            String marks2 = request.getParameter("marks2");
            String other = request.getParameter("other");
            String inst3 = request.getParameter("inst3");
            String yop3 = request.getParameter("yop3");
            String marks3 = request.getParameter("marks3");
            String course = request.getParameter("course");
            String branch = request.getParameter("branch");
            String year = request.getParameter("year");
            String sem = request.getParameter("sem");
            String regul = request.getParameter("regul");
            
            Part filePart = request.getPart("photo");
            if(filePart!=null){
                inputStream = filePart.getInputStream();
            }            
            
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into student(htno, sname, aadhar, fname, foccup, mname, moccup, caste, stype, htype, cet, dob, blood, caddr, paddr, smno, pmno, plno, semail, pemail, ssc, inst1, yop1, marks1, inter, inst2, yop2, marks2, other, inst3, yop3, marks3, course, year, branch, sem, regul, photo,pass)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, htno);
            ps.setString(2, sname);
            ps.setString(3, aadhar);
            ps.setString(4, fname);
            ps.setString(5, foccup);
            ps.setString(6, mname);
            ps.setString(7, moccup);
            ps.setString(8, caste);
            ps.setString(9, stype);
            ps.setString(10, htype);
            ps.setString(11, cet);
            ps.setString(12, dob);
            ps.setString(13, blood);
            ps.setString(14, caddr);
            ps.setString(15, paddr);
            ps.setString(16, smno);
            ps.setString(17, pmno);
            ps.setString(18, plno);
            ps.setString(19, semail);
            ps.setString(20, pemail);
            ps.setString(21, ssc);
            ps.setString(22, inst1);
            ps.setString(23, yop1);
            ps.setString(24, marks1);
            ps.setString(25, inter);
            ps.setString(26, inst2);
            ps.setString(27, yop2);
            ps.setString(28, marks2);
            ps.setString(29, other);
            ps.setString(30, inst3);
            ps.setString(31, yop3);
            ps.setString(32, marks3);
            ps.setString(33, course);
            ps.setString(34, year);
            ps.setString(35, branch);
            ps.setString(36, sem);
            ps.setString(37, regul);
            
            if(inputStream!=null){
                ps.setBlob(38, inputStream);
            }
            ps.setString(39, htno);
            int i = ps.executeUpdate();
            
            if(i>0){
                out.println("<script>alert(\"Submitted Successful\"); window.location=\"admin_add_student.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Submiting Failed\"); window.location=\"admin_add_student.jsp\";</script>");
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
