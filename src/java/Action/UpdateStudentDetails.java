/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import DBConnection.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
@MultipartConfig(fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
@WebServlet(name = "UpdateStudentDetails", urlPatterns = {"/UpdateStudentDetails"})
public class UpdateStudentDetails extends HttpServlet {

    

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
            InputStream inputStream1 = null;
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
            PreparedStatement ps = conn.prepareStatement("update student set  sname=?, aadhar=?, fname=?, foccup=?, mname=?, moccup=?, caste=?, stype=?, htype=?, cet=?, dob=?, blood=?, caddr=?, paddr=?, smno=?, pmno=?, plno=?, semail=?, pemail=?, ssc=?, inst1=?, yop1=?, marks1=?, inter=?, inst2=?, yop2=?, marks2=?, other=?, inst3=?, yop3=?, marks3=?, course=?, year=?, branch=?, sem=?, regul=?, photo=? where htno='"+htno+"'");
           
            ps.setString(1, sname);
            ps.setString(2, aadhar);
            ps.setString(3, fname);
            ps.setString(4, foccup);
            ps.setString(5, mname);
            ps.setString(6, moccup);
            ps.setString(7, caste);
            ps.setString(8, stype);
            ps.setString(9, htype);
            ps.setString(10, cet);
            ps.setString(11, dob);
            ps.setString(12, blood);
            ps.setString(13, caddr);
            ps.setString(14, paddr);
            ps.setString(15, smno);
            ps.setString(16, pmno);
            ps.setString(17, plno);
            ps.setString(18, semail);
            ps.setString(19, pemail);
            ps.setString(20, ssc);
            ps.setString(21, inst1);
            ps.setString(22, yop1);
            ps.setString(23, marks1);
            ps.setString(24, inter);
            ps.setString(25, inst2);
            ps.setString(26, yop2);
            ps.setString(27, marks2);
            ps.setString(28, other);
            ps.setString(29, inst3);
            ps.setString(30, yop3);
            ps.setString(31, marks3);
            ps.setString(32, course);
            ps.setString(33, year);
            ps.setString(34, branch);
            ps.setString(35, sem);
            ps.setString(36, regul);
            
            if(inputStream!=null){
                ps.setBlob(37, inputStream);
            }
           
            int i = ps.executeUpdate();
            
            if(i>0){
                out.println("<script>alert(\"Updated Successful\"); window.location=\"admin_update_student.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Updating Failed\"); window.location=\"admin_update_student.jsp\";</script>");
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

}
