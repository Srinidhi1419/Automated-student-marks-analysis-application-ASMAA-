<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <% 
        String course = request.getParameter("course");
        String branch = (String)session.getAttribute("dept");
        String year = request.getParameter("year");
        String sem = request.getParameter("sem");
        String hour = request.getParameter("hour");
        String date = request.getParameter("date");
        System.out.println(course+" "+branch+" "+year+" "+sem+" "+hour+" "+date);
       Connection conn = DBConnection.getConnection();
       PreparedStatement ps5 = conn.prepareStatement("select * from attendance where date='"+date+"'");
       ResultSet rs5 = ps5.executeQuery();
       if(rs5.next()){
           
       
       PreparedStatement ps4 = conn.prepareStatement("select * from attendance where "+hour+" IS NULL and date='"+date+"'");
       ResultSet rs4 = ps4.executeQuery();
       if(rs4.next()){
           
       int i =0;    
       PreparedStatement ps = conn.prepareStatement("select * from student where course='"+course+"' and branch='"+branch+"' and year='"+year+"' and sem='"+sem+"'");
       ResultSet rs = ps.executeQuery();        
        while(rs.next()){
            
        String htno = rs.getString("htno");
            PreparedStatement ps1 = conn.prepareStatement("select * from attendance where htno='"+htno+"' and date='"+date+"'");
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()){
                int total=rs1.getInt("total");
                total=total+Integer.parseInt(request.getParameter(htno));
                PreparedStatement ps2 = conn.prepareStatement("update attendance set "+hour+" = '"+Integer.parseInt(request.getParameter(htno))+"',total='"+total+"' where htno='"+htno+"' and date='"+date+"' ");
                i = ps2.executeUpdate();
                
            }else{
                PreparedStatement ps3 = conn.prepareStatement("insert into attendance(htno, date, "+hour+",total, course, branch,year, sem)values(?,?,?,?,?,?,?,?)");
                ps3.setString(1, htno);
                ps3.setString(2, date);
                ps3.setInt(3, Integer.parseInt(request.getParameter(htno)));
                ps3.setInt(4, Integer.parseInt(request.getParameter(htno)));
                ps3.setString(5, course);
                ps3.setString(6, branch);
                ps3.setString(7, year);
                ps3.setString(8, sem);
                i = ps3.executeUpdate();
            }
        
        }if(i>0){
           %>
                 <script>
                     alert("Attendance added Successfull...");
                     window.location="faculty_attendance.jsp";
                 </script>
                 
                 <%   
        }
       }else{
            %><script>
                     alert("Attendance Already Submitted...");
                     window.location="faculty_attendance.jsp";
                 </script><%
       }


}else{

int i =0;    
       PreparedStatement ps = conn.prepareStatement("select * from student where course='"+course+"' and branch='"+branch+"' and year='"+year+"' and sem='"+sem+"'");
       ResultSet rs = ps.executeQuery();        
        while(rs.next()){
            String htno = rs.getString("htno");
            PreparedStatement ps3 = conn.prepareStatement("insert into attendance(htno, date, "+hour+",total, course, branch,year, sem)values(?,?,?,?,?,?,?,?)");
                ps3.setString(1, htno);
                ps3.setString(2, date);
                ps3.setInt(3, Integer.parseInt(request.getParameter(htno)));
                ps3.setInt(4, Integer.parseInt(request.getParameter(htno)));
                ps3.setString(5, course);
                ps3.setString(6, branch);
                ps3.setString(7, year);
                ps3.setString(8, sem);
                i = ps3.executeUpdate();
}
if(i>0){
           %>
                 <script>
                     alert("Attendance added Successfull...");
                     window.location="faculty_attendance.jsp";
                 </script>
                 
                 <%   
        }

}
    %>
   