<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String emp = request.getParameter("emp");
    String[] empolyee = emp.split(" - ");
    String empid = Array.get(empolyee, 0).toString();
    String ename = Array.get(empolyee, 1).toString();
    String dept = (String)session.getAttribute("dept");
    String year = request.getParameter("year");
    String sem = request.getParameter("sem");
    int i =0;
    Connection conn = DBConnection.getConnection();
    
     PreparedStatement ps3 = conn.prepareStatement("select * from incharge where empid='"+empid+"'");
        ResultSet rs3 = ps3.executeQuery();
        if(rs3.next()){
            %>
            <script>
                alert("This  Faculty is already Assigned");
                window.location="hod_set_incharge.jsp";
            </script>
            <% }else{

PreparedStatement ps1 = conn.prepareStatement("select * from incharge where dept='"+dept+"' AND year='"+year+"' AND sem='"+sem+"'");
    ResultSet rs = ps1.executeQuery();
    if(rs.next()){      
       
        PreparedStatement ps2 = conn.prepareStatement("update incharge set empid='"+empid+"',ename='"+ename+"' where dept='"+dept+"' AND year='"+year+"' AND sem='"+sem+"'");
        i = ps2.executeUpdate();
        }else{

    PreparedStatement ps = conn.prepareStatement("insert into incharge(dept, year, sem, empid, ename)values(?,?,?,?,?)");
    ps.setString(1, dept);
    ps.setString(2, year);
    ps.setString(3, sem);
    ps.setString(4, empid);
    ps.setString(5, ename);
    i = ps.executeUpdate();
}
    if(i>0){
        %>
                 <script>
                     alert("Incharge Assigned Successfully...");
                     window.location="hod_set_incharge.jsp";
                 </script>
                 
                 <%
    }else{
 %>
                 <script>
                     alert("Incharge Assign Failed...");
                     window.location="hod_set_incharge.jsp";
                 </script>
                 
                 <%
}}
%>
