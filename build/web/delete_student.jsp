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
            String htno= request.getParameter("htno");
        Connection conn = DBConnection.getConnection();
          PreparedStatement ps1 = conn.prepareStatement("select * from student where htno='"+htno+"'");
          ResultSet rs=ps1.executeQuery();
          if(rs.next()){
             
                
                String hno=rs.getString(2);
                String name=rs.getString(3);
                String year=rs.getString("year");
                String sem=rs.getString("sem");
              
              System.out.println(name);
               PreparedStatement ps2 = conn.prepareStatement("insert into delete_student (htno,sname,year,sem,reason) values('"+hno+"','"+name+"','"+year+"','"+sem+"','"+reason+"')");
             
          
        PreparedStatement ps = conn.prepareStatement("delete from student where htno='"+htno+"'");
       
        ps2.executeUpdate();
        ps.executeUpdate();
        }
        response.sendRedirect("admin_view_single_student.jsp?msg=success");
        %>
       
    </body>
   
</html>
