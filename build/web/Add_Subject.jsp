<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dept = (String)session.getAttribute("dept");
    String year = request.getParameter("year");
    String sem = request.getParameter("sem");
    String scode = request.getParameter("scode");
    String subject = request.getParameter("subject");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("insert into subjects(scode, subject, dept, year, sem)values(?,?,?,?,?)");
    ps.setString(1, scode);
    ps.setString(2, subject);
    ps.setString(3, dept);
    ps.setString(4, year);
    ps.setString(5, sem);
    int i = ps.executeUpdate();
    if(i>0){
        %>
                 <script>
                     alert("Subject Added Successfully...");
                     window.location="hod_add_subject.jsp";
                 </script>
                 
                 <%
    }else{
 %>
                 <script>
                     alert("Subject Adding Failed...");
                     window.location="hod_add_subject.jsp";
                 </script>
                 
                 <%
}
%>
