<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String scode = request.getParameter("scode");
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("delete from subjects where scode='"+scode+"'");    
    int i = ps.executeUpdate();
    if(i>0){
        %>
                 <script>
                     alert("Subject Deleted Successfully...");
                     window.location="hod_view_subject.jsp";
                 </script>
                 
                 <%
    }else{
 %>
                 <script>
                     alert("Subject Removing Failed...");
                     window.location="hod_view_subject.jsp";
                 </script>
                 
                 <%
}
%>
