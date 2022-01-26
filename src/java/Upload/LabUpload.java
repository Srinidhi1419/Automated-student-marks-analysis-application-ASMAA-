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
@WebServlet(name = "LabUpload", urlPatterns = {"/LabUpload"})
@MultipartConfig(fileSizeThreshold = 1024*1024*100,maxFileSize = 1024*1024*50,maxRequestSize = 1024*1024*10)
public class LabUpload extends HttpServlet {

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
         List<Lab> labs = new ArrayList<>();
     BufferedReader reader = new BufferedReader(new InputStreamReader(fileContent));
      
        String line;
        while ((line = reader.readLine()) != null) {
            String[] attributes = line.split(",");
                Lab lab = createLab(attributes);                
                labs.add(lab);              
        }
       
        int i = 0;
        try{
            Connection conn = DBConnection.getConnection();        
        for (Lab l : labs) {
            System.out.println(l.getBcode());
            String bname=null;
            if(l.getBcode().equals("1")){
                bname="CIVIL";
            }else if(l.getBcode().equals("2")){
                bname="EEE";
            }else if(l.getBcode().equals("3")){
                bname="MECH";
            }else if(l.getBcode().equals("4")){
                bname="ECE";
            }else if(l.getBcode().equals("5")){
                bname="CSE";
            }else{
                bname="AGRI";
            }
            
            PreparedStatement ps = conn.prepareStatement("insert into lab (course, year, sem, regul, bcode, htno, scode, marks)values(?,?,?,?,?,?,?,?)");
            ps.setString(1, course);
            ps.setString(2, year);
            ps.setString(3, semester);
            ps.setString(4, regul);
            ps.setString(5, bname);
            ps.setString(6, l.getHtno());
            ps.setString(7, l.getScode());            
            ps.setInt(8, l.getMarks());
            ps.executeUpdate();
            i++;
        }
        System.out.println(i);
        if(i>0){
                out.println("<script>alert(\"Uploaded Successful\"); window.location=\"examsection_upload_lab.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Upload Failed\"); window.location=\"examsection_upload_lab.jsp\";</script>");
            } 
    }catch(Exception e){
        e.printStackTrace();
    }  
        
    }
private static Lab createLab(String[] metadata) {
        String bcode = metadata[0];
        String htno = metadata[1];
        String scode = metadata[2];              
        int marks = Integer.parseInt(metadata[3]);       
        return new Lab(bcode,htno, scode, marks);
    }
}
