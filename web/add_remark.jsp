<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dept = (String)session.getAttribute("dept");
    String empid = request.getParameter("empid");
    String ename = request.getParameter("ename");
    String remark = request.getParameter("remark");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("insert into remarks(empid, ename, dept, remark)values(?,?,?,?)");
    ps.setString(1, empid);
    ps.setString(2, ename);
    ps.setString(3, dept);
    ps.setString(4, remark);
    int i = ps.executeUpdate();
    if(i>0){
        %>
                 <script>
                     alert("Remark Added Successfully...");
                     window.location="hod_remarks.jsp";
                 </script>
                 
                 <%
    }else{
 %>
                 <script>
                     alert("Remark Adding Failed...");
                     window.location="hod_remarks.jsp";
                 </script>
                 
                 <%
}
%>
