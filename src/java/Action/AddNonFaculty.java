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
@WebServlet(name = "AddNonFaculty", urlPatterns = {"/AddNonFaculty"})
@MultipartConfig(fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*100)
public class AddNonFaculty extends HttpServlet {
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
            String empid = request.getParameter("empid");
            String dob = request.getParameter("dob");
            String emno = request.getParameter("emno");
            String email = request.getParameter("email");
            String ename = request.getParameter("ename");  
            String aadhar = request.getParameter("aadhar"); 
            String gender = request.getParameter("gender");
            String doj = request.getParameter("doj");
            String qual = request.getParameter("qual");
            String course = request.getParameter("course");
            String dept = request.getParameter("dept");
            String design = request.getParameter("design");
            Part filePart = request.getPart("photo");
            if(filePart!=null){
                inputStream = filePart.getInputStream();
            }
            
            
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into nonfaculty(empid, dob, emno, email, ename, aadhar, gender,doj, qual, designation, course, dept, photo,pass)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, empid);
            ps.setString(2, dob);
            ps.setString(3, emno);
            ps.setString(4, email);
            ps.setString(5, ename);
            ps.setString(6, aadhar);
            ps.setString(7, gender);
            ps.setString(8, doj);
            ps.setString(9, qual);            
            ps.setString(10, design);
            ps.setString(11, course);
            ps.setString(12, dept);
            if(inputStream!=null){
                ps.setBlob(13, inputStream);
            }
            ps.setString(14, empid);
            int i = ps.executeUpdate();
            if(i>0){
                out.println("<script>alert(\"Submitted Successful\"); window.location=\"admin_add_nonteach.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Submiting Failed\"); window.location=\"admin_add_nonteach\";</script>");
            }           
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
