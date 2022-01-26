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
import java.sql.Connection;
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
@WebServlet(name = "Mid2Upload", urlPatterns = {"/Mid2Upload"})
@MultipartConfig(fileSizeThreshold = 1024*1024*100,maxFileSize = 1024*1024*50,maxRequestSize = 1024*1024*10)
public class Mid2Upload extends HttpServlet {

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
        String branch = request.getParameter("branch");
        String sem = request.getParameter("sem");
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
    //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
    InputStream fileContent = filePart.getInputStream();
         List<Mid2> mid2 = new ArrayList<>();
     BufferedReader reader = new BufferedReader(new InputStreamReader(fileContent));
      
        String line;
        while ((line = reader.readLine()) != null) {
            String[] attributes = line.split(",");
                Mid2 mid21 = createMid2(attributes);                
                mid2.add(mid21);              
        }
       
        int i = 0;
        try{
            Connection conn = DBConnection.getConnection();
        for (Mid2 m2 : mid2) {
            System.out.println(m2);
            
            PreparedStatement ps = conn.prepareStatement("insert into mid2(scode, sname, htno, m1, sq1, assign1, sum1, m2, sq2, assign2, sum2, grandsum, course, branch, year, sem)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, m2.getScode());
            ps.setString(2, m2.getSname());
            ps.setString(3, m2.getHtno());
            ps.setInt(4, m2.getM1());
            ps.setInt(5, m2.getSq1());
            ps.setInt(6, m2.getAssign1());
            ps.setInt(7, m2.getSum1());
            ps.setInt(8, m2.getM2());
            ps.setInt(9, m2.getSq2());
            ps.setInt(10, m2.getAssign2());
            ps.setInt(11, m2.getSum2());
            ps.setInt(12, m2.getGrandSum());
            ps.setString(13, course);
            ps.setString(14, branch);
            ps.setString(15, year);
            ps.setString(16, sem);
            ps.executeUpdate();
            i++;
        }
        System.out.println(i);
        if(i>0){
                out.println("<script>alert(\"Uploaded Successful\"); window.location=\"examsection_upload_mid2.jsp\";</script>");
            }else{
                out.println("<script>alert(\"Upload Failed\"); window.location=\"examsection_upload_mid2.jsp\";</script>");
            } 
    }catch(Exception e){
        e.printStackTrace();
    }  
        
    }
private static Mid2 createMid2(String[] metadata) {
        
        String scode = metadata[0];
        String sname = metadata[1];
        String htno = metadata[2];
        int m1 = Integer.parseInt(metadata[3]);       
        int sq1 = Integer.parseInt(metadata[4]);
        int assign1 = Integer.parseInt(metadata[5]);       
        int sum1 = Integer.parseInt(metadata[6]);
        int m2 = Integer.parseInt(metadata[7]);       
        int sq2 = Integer.parseInt(metadata[8]);
        int assign2 = Integer.parseInt(metadata[9]);       
        int sum2 = Integer.parseInt(metadata[10]);
        int GrandSum = Integer.parseInt(metadata[11]);
        
        return new Mid2(scode,sname,htno,m1,sq1,assign1,sum1,m2,sq2,assign2,sum2,GrandSum);
    }
}
