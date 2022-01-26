/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import DBConnection.DBConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SemesterUpload", urlPatterns = {"/SemesterUpload"})
@MultipartConfig(fileSizeThreshold = 1024*1024*100,maxFileSize = 1024*1024*50,maxRequestSize = 1024*1024*10)
public class SemesterUpload extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String course = request.getParameter("course");
        String year = request.getParameter("year");
        String regul = request.getParameter("regul");
        String semester = request.getParameter("sem");
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
    //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
    InputStream fileContent = filePart.getInputStream();
         List<Sem> sems = new ArrayList<>();
     BufferedReader reader = new BufferedReader(new InputStreamReader(fileContent));
      
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
            String[] attributes = line.split(",");
                Sem sem = createSem(attributes);                
                sems.add(sem);              
        }
       
        int i = 0;
        try{
            Connection conn = DBConnection.getConnection();
        for (Sem s : sems) {
            
            PreparedStatement ps1 = conn.prepareStatement("select * from semester where htno='"+s.getHtno()+"' AND scode='"+s.getScode()+"' ");
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()){
            PreparedStatement ps2 = conn.prepareStatement("update semester set grade='"+s.getGrade()+"',credits='"+s.getCredits()+"' where htno='"+s.getHtno()+"' AND scode='"+s.getScode()+"' ");
                ps2.executeUpdate();
                i++;
            }else{
            
            PreparedStatement ps = conn.prepareStatement("insert into semester(course, year, sem, regul, htno, scode, sname, grade,credits,branch)values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, course);
            ps.setString(2, year);
            ps.setString(3, semester);
            ps.setString(4, regul);            
            ps.setString(5, s.getHtno());
            ps.setString(6, s.getScode());
            ps.setString(7, s.getSname());
            ps.setString(8, s.getGrade());
            ps.setInt(9, s.getCredits());
            ps.setString(10, s.getBranch());
            ps.executeUpdate();
            i++;
        }}
        System.out.println(i);
        if(i>0){
                out.println("<script>alert(\"Uploaded Successful\"); window.location=\"examsection_upload_sem.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Upload Failed\"); window.location=\"examsection_upload_sem.jsp\";</script>");
            }   
    }catch(Exception e){
        e.printStackTrace();
    }  
        
    }
private static Sem createSem(String[] metadata) {
        String htno = metadata[0];
        String scode = metadata[1];
        String sname = metadata[2];
        String grade = metadata[3];        
        int credits = Integer.parseInt(metadata[4]);  
        return new Sem(htno, scode, sname,grade,credits);
    }
}
