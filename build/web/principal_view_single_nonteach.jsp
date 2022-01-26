<%@page import="javafx.scene.control.Alert"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Staff Details</title>
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/bootstrap.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">View Student</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="principal_view_single_student.jsp">Single Student</a>
					<a class="dropdown-item" href="principal_view_course_student.jsp">View Students</a>
					
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Attendance</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="principal_Day_Wise_Attendance.jsp">Day-wise</a>
					<a class="dropdown-item" href="principal_Branch_Wise_Attendance.jsp">Branch-wise</a>
					<a class="dropdown-item" href="principal_Student_Wise_Attendance.jsp">Student-wise</a>
					<a class="dropdown-item" href="principal_Date_Wise_Attendance.jsp">Date-wise</a>
					<a class="dropdown-item" href="principal_Hour_Wise_Attendance.jsp">Hourly-wise</a>
				</div>
			
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">View Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="principal_view_single_staff.jsp">Single Staff</a>
					<a class="dropdown-item" href="principal_view_teach.jsp">Teaching Staff-wise</a>
					<a class="dropdown-item" href="principal_view_nonteach.jsp">Non-Teaching Staff-wise</a>
					<a class="dropdown-item" href="principal_view_branch_staff.jsp">Branch-wise</a>
				</div>
			</li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Enter Student HT No.-->
<form action="principal_view_single_staff.jsp" method="post">
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
		<input type="text" class="form-control" name="empid" placeholder="Enter Employee Id" required="">		
            </div>
            <div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form>
<!-- Table for student details-->
<h2 class="col-12 text-center">Staff Details</h2>
<div class="container">
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <%
        String empid = request.getParameter("empid");
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from nonfaculty where empid='"+empid+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
    <center><img id="myimage" src="view2.jsp?empid=<%=rs.getString("empid")%>"  height="150" width="150"></center></br>
			<tr><th>Employee ID : </th><td><%= rs.getString("empid")%></td></tr>
                <tr><th>Employee Name :</th><td><%= rs.getString("ename") %></td></tr>
                <tr><th>Date of Birth : </th><td><%= rs.getString("dob") %></td></tr>
                <tr><th>Contact Number : </th><td><%= rs.getString("emno") %></td></tr>
                <tr><th>Email : </th><td><%= rs.getString("email") %></td></tr>
                <tr><th>Aadhar Number : </th><td><%= rs.getString("aadhar") %></td></tr>
                <tr><th>Gender : </th><td><%= rs.getString("gender") %></td></tr>
                <tr><th>Date of Joining : </th><td><%= rs.getString("doj") %></td></tr>
                <tr><th>Course : </th><td><%= rs.getString("course") %></td></tr>
                <tr><th>Department : </th><td><%= rs.getString("dept") %></td></tr>
                <tr><th>Designations : </th><td><%= rs.getString("designation") %></td></tr>
                <%}%>
                </table>
</div>

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
