<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     
    </head>
    <body>
        <%  String reason= request.getParameter("reason");
            String empid= request.getParameter("empid");
            PreparedStatement ps1=null;
            ResultSet rs=null;
        Connection conn = DBConnection.getConnection();
     
        ps1 = conn.prepareStatement("select * from faculty where empid='"+empid+"'");
        rs=ps1.executeQuery();
        if(rs.next()){
                String empno=rs.getString("empid");
                String ename=rs.getString("ename");
                String dept=rs.getString("dept");
                //String sem=rs.getString("sem");
              
              
               PreparedStatement ps2 = conn.prepareStatement("insert into staff_delete (empid,ename,dept,reason) values('"+empno+"','"+ename+"','"+dept+"','"+reason+"')");
             Statement stmt=conn.createStatement();  
             stmt.addBatch("delete from faculty where empid='"+empid+"'");  
             stmt.addBatch("delete from nonfaculty where empid='"+empid+"'");  
          
       // PreparedStatement ps = conn.prepareStatement("delete from faculty where empid='"+empid+"'");
      
        ps2.executeUpdate();
        //ps.executeUpdate();
        stmt.executeBatch();
        }
        ps1 = conn.prepareStatement("select * from nonfaculty where empid='"+empid+"'");
          
          rs=ps1.executeQuery();
          if(rs.next()){
                String empno=rs.getString("empid");
                String ename=rs.getString("ename");
                String dept=rs.getString("dept");
                //String sem=rs.getString("sem");
              
              
               PreparedStatement ps2 = conn.prepareStatement("insert into staff_delete (empid,ename,dept) values('"+empno+"','"+ename+"','"+dept+"')");
             Statement stmt=conn.createStatement();  
             stmt.addBatch("delete from faculty where empid='"+empid+"'");  
             stmt.addBatch("delete from nonfaculty where empid='"+empid+"'");  
          
       // PreparedStatement ps = conn.prepareStatement("delete from faculty where empid='"+empid+"'");
      
        ps2.executeUpdate();
        //ps.executeUpdate();
        stmt.executeBatch();
        }
        response.sendRedirect("admin_delete_staff.jsp?msg=success");
        %>
       
    </body>
   
</html>
