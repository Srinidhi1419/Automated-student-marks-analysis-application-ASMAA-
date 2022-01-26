<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%            Connection conn = DBConnection.getConnection();
               String fruits[]= request.getParameterValues("chkpromote[]");
               
    for(int i=0;i<fruits.length;i++){
    String htno = fruits[i];
    System.out.println("htno");
     PreparedStatement ps1 = conn.prepareStatement("select * from student where htno='"+htno+"'");
          ResultSet rs=ps1.executeQuery();
          if(rs.next()){
                String year=rs.getString("year");
                String sem=rs.getString("sem");
                if(sem.equals("I")){
                
                 PreparedStatement ps = conn.prepareStatement("update student set sem='II' where htno='"+htno+"'");
                 ps.executeUpdate();
                 %>
                 <script>
                     alert("Promoted Successfully...");
                     window.location="admin_promote_student.jsp";
                 </script>
                 
                 <%
                }
                else if(sem.equals("II")){
                if(year.equals("I")){
                     PreparedStatement ps = conn.prepareStatement("update student set year='II',sem='I' where htno='"+htno+"'");
                 ps.executeUpdate();
                 %>
                 <script>
                     alert("Promoted Successfully...");
                     window.location="admin_promote_student.jsp";
                 </script>
                 
                 <%
                }
                else if(year.equals("II")){
                    PreparedStatement ps = conn.prepareStatement("update student set year='III',sem='I' where htno='"+htno+"'");
                 ps.executeUpdate();
                 %>
                 <script>
                     alert("Promoted Successfully...");
                     window.location="admin_promote_student.jsp";
                 </script>
                 
                 <%
                }
                 else if(year.equals("III")){
                     PreparedStatement ps = conn.prepareStatement("update student set year='IV' ,sem='I'where htno='"+htno+"'");
                 ps.executeUpdate();
                 %>
                 <script>
                     alert("Promoted Successfully...");
                     window.location="admin_promote_student.jsp";
                 </script>
                 
                 <%
                 }
                 else {
                 %>
                 <script>
                     alert("You Can't Promote");
                     window.location="admin_promote_student.jsp";
                 </script>
                 
                 <% }
                
                }
          
  
                }
    
    }
    %>
