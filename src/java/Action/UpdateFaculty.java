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
@WebServlet(name = "UpdateFaculty", urlPatterns = {"/UpdateFaculty"})
@MultipartConfig(fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
public class UpdateFaculty extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            InputStream inputStream = null;
            
            String empid = request.getParameter("empid");
            String dob = request.getParameter("dob");
            String emno = request.getParameter("emno");
            String email = request.getParameter("email");
            String ename = request.getParameter("ename");  
            String aadhar = request.getParameter("aadhar"); 
            String gender = request.getParameter("gender");
            String doj = request.getParameter("doj");
            String qual = request.getParameter("qual");
            String design1 = request.getParameter("design1");
            String design2 = request.getParameter("design2");
            String design3 = request.getParameter("design3");
            String design4 = request.getParameter("design4");
            String course = request.getParameter("course");
            String dept = request.getParameter("dept");
            String reg1 = request.getParameter("reg1");
            String reg2 = request.getParameter("reg2");
            String reg3 = request.getParameter("reg3");
            String reg4 = request.getParameter("reg4");
            String reg5 = request.getParameter("reg5");
            String qual1 = request.getParameter("qual1");
            String inst1 = request.getParameter("inst1");
            String yop1 = request.getParameter("yop1");
            String marks1 = request.getParameter("marks1");
            String qual2 = request.getParameter("qual2");
            String inst2 = request.getParameter("inst2");
            String yop2 = request.getParameter("yop2");
            String marks2 = request.getParameter("marks2");
            String qual3 = request.getParameter("qual3");
            String inst3 = request.getParameter("inst3");
            String yop3 = request.getParameter("yop3");
            String marks3 = request.getParameter("marks3");
            String qual4 = request.getParameter("qual4");
            String inst4 = request.getParameter("inst4");
            String yop4 = request.getParameter("yop4");
            String marks4 = request.getParameter("marks4");
            String qual5 = request.getParameter("qual4");
            String inst5 = request.getParameter("inst5");
            String yop5 = request.getParameter("yop5");
            String marks5 = request.getParameter("marks5");
            
            
            Part filePart = request.getPart("photo");
            if(filePart!=null){
                inputStream = filePart.getInputStream();
            }
            
            
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("update faculty set empid=?, dob=?, emno=?, email=?, ename=?, aadhar=?, gender=?,doj=?, qual=?, design1=?, design2=?, design3=?, design4=?,course=?, dept=?, reg1=?, reg2=?, reg3=?, reg4=?, reg5=?, qual1=?,inst1=?, yop1=?, marks1=?, qual2=?, inst2=?, yop2=?, marks2=?,qual3=?, inst3=?, yop3=?, marks3=?, qual4=?, inst4=?, yop4=?,marks4=?, qual5=?, inst5=?, yop5=?, marks5=?, photo=? where empid='"+empid+"'");
            ps.setString(1, empid);
            ps.setString(2, dob);
            ps.setString(3, emno);
            ps.setString(4, email);
            ps.setString(5, ename);
            ps.setString(6, aadhar);
            ps.setString(7, gender);
            ps.setString(8, doj);
            ps.setString(9, qual);
            ps.setString(10, design1);
            ps.setString(11, design2);
            ps.setString(12, design3);
            ps.setString(13, design4);
            ps.setString(14, course);
            ps.setString(15, dept);
            ps.setString(16, reg1);
            ps.setString(17, reg2);
            ps.setString(18, reg3);
            ps.setString(19, reg4);
            ps.setString(20, reg5);
            ps.setString(21, qual1);
            ps.setString(22, inst1);
            ps.setString(23, yop1);
            ps.setString(24, marks1);
            ps.setString(25, qual2);
            ps.setString(26, inst2);
            ps.setString(27, yop2);
            ps.setString(28, marks2);
            ps.setString(29, qual3);
            ps.setString(30, inst3);
            ps.setString(31, yop3);
            ps.setString(32, marks3);
            ps.setString(33, qual4);
            ps.setString(34, inst4);
            ps.setString(35, yop4);
            ps.setString(36, marks4);
            ps.setString(37, qual5);
            ps.setString(38, inst5);
            ps.setString(39, yop5);
            ps.setString(40, marks5);
            if(inputStream!=null){
                ps.setBlob(41, inputStream);
            }
            
            int i = ps.executeUpdate();
            
            if(i>0){
                out.println("<script>alert(\"Submitted Successful\"); window.location=\"admin_add_teach.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Submiting Failed\"); window.location=\"admin_add_teach.jsp\";</script>");
            }           
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
