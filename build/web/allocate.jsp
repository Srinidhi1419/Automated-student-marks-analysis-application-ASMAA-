<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String empid = request.getParameter("empid");
    String ename = request.getParameter("ename");
    String dept = (String)session.getAttribute("dept");
    String year = request.getParameter("year");
    String sem = request.getParameter("sem");
    String subject = request.getParameter("subject");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("insert into allocate_subject(empid, ename, dept, year, sem, subject)values(?,?,?,?,?,?)");
    ps.setString(1, empid);
    ps.setString(2, ename);
    ps.setString(3, dept);
    ps.setString(4, year);
    ps.setString(5, sem);
    ps.setString(6, subject);
    int i = ps.executeUpdate();
    if(i>0){
        %>
                 <script>
                     alert("Subject Allocated Successfully...");
                     window.location="hod_allocate_subject.jsp";
                 </script>
                 
                 <%
    }else{
 %>
                 <script>
                     alert("Subject Allocation Failed...");
                     window.location="hod_allocate_subject.jsp";
                 </script>
                 
                 <%
}
%>
