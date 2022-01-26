<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Course-wise Staff</title>
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/bootstrap.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<link href="datatables/jquery.dataTables.min.css" rel="stylesheet"/>
<script src="datatables/jquery.dataTables.min.js"></script>
<style>		
</style>
</head>
<body>
<!--Top-->
<div class="container-fluid">
<div class="row">
<div class="col-12">
<img src="images/slide.png" width="100%"/>
</div>
</div>
</div>
<!--Menu -->
<nav class="navbar navbar-expand-md sticky-top padding navbar-dark bg-dark">
<div class="container-fluid">
    <a class="navbar-brand"></a>
	<button class="navbar-toggler" type="button" data-target="#navmenu" data-toggle="collapse"><span class="navbar-toggler-icon"></span></button>
	<div class="collapse navbar-collapse justify-content-center" id="navmenu">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_attendance.jsp">Submit Attendance</a></li>
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_view_attendance.jsp">View Attendance</a></li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Course-wise Students-->
<div class="container">
<h2 class="text-center text-primary">Submit Attendance</h2>
<form action="faculty_submit_attendance.jsp" method="post">
<table id="example" class="display table table-bordered table-responsive-sm"  style="width:100%;">
        <thead>
            <tr>
                <th>S.No</th>
		<th>Faculty Id</th>
                <th>Faculty Name</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Subject</th>
                <th>Add Attendance</th>
            </tr>
        </thead>
<tbody>
        <%
        int count = 0;
       String empid = (String)session.getAttribute("empid");
       String dept = (String)session.getAttribute("dept");
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from allocate_subject where dept='"+dept+"' AND empid='"+empid+"'");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    count++;
                    System.out.println(count);
    %>
        
            <tr>
                <td><%=count%></td>
                <td><%= rs.getString("empid")%></td>
                <td><%= rs.getString("ename")%></td>                
                <td><input type="hidden" name="year" value="<%= rs.getString("year")%>" /><%= rs.getString("year") %></td>
                <td><input type="hidden" name="sem" value="<%= rs.getString("sem")%>" /><%= rs.getString("sem") %></td>
                <td><%= rs.getString("subject")%></td>
                <td><input type="submit" class="btn btn-success text-white" value="Add Attendance"/></td>
            </tr>
        <%}%></tbody>
    </table>
</form>
</div>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<!--Footer-->
<div class="container-fluid padding bg-dark footer">
<div class="row welcome text-center">
<div class="col-xs-12 col-sm-12 col-md-6">
	<h4  class="text-secondary">Address</h4>
	<p></p>
</div>
<div class="col-xs-12 col-sm-12 col-md-6">
	<h4  class="text-secondary">Follow Us</h4>
	<p></p>
</div>
</div>
</div>
</body>
</html>