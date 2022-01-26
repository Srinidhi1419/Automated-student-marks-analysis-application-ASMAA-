<%@page import="javafx.scene.control.Alert"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Student Details</title>
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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Student</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="admin_add_student.jsp">Add Student</a>
					<a class="dropdown-item" href="admin_update_student.jsp">Update Student Details</a>
					<a class="dropdown-item" href="admin_promote_student.jsp">Student Promotion</a>
					<a class="dropdown-item" href="admin_delete_student.jsp">Delete Student</a>
                                        <a class="dropdown-item" href="admin_view_single_student.jsp">View Single Student</a>
                                        <a class="dropdown-item" href="admin_view_student.jsp">View Students</a>					
					<a class="dropdown-item" href="admin_view_deleted_student.jsp">View Deleted Students</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="admin_add_teach.jsp">Add Teaching Staff</a>
					<a class="dropdown-item" href="admin_add_nonteach.jsp">Add Non-Teaching Staff</a>
					<a class="dropdown-item" href="admin_view_single_staff.jsp">View Single Staff</a>
					<a class="dropdown-item" href="admin_view_dept_staff.jsp">View Department-wise Staff</a>
					<a class="dropdown-item" href="admin_view_course_staff.jsp">View Course-wise Staff</a>
					<a class="dropdown-item" href="admin_update_teach.jsp">Update Staff Details</a>
                                        <a class="dropdown-item" href="admin_update_nonteach.jsp">Update Non-Teaching Staff Details</a>
					<a class="dropdown-item" href="admin_delete_staff.jsp">Delete Staff</a>
					<a class="dropdown-item" href="admin_view_deleted_staff.jsp">View Deleted Staff</a>
				</div>
			</li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Enter Student HT No.-->
<form action="admin_view_single_student.jsp" method="post">
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
				<input type="text" class="form-control" name="htno" placeholder="Enter Hall Ticket No." required="">		
            </div>
            <div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form>
<!-- Table for student details-->
<h2 class="col-12 text-center">Student Details</h2>
<div class="container">
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <%
        String htno = request.getParameter("htno");
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+htno+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
    <center><img id="myimage" src="view.jsp?htno=<%=rs.getString("htno")%>"  height="150" width="150"></center></br>
			<tr><th>Hall Ticket Number : </th><td><%= rs.getString("htno")%></td></tr>
                <tr><th>Branch : </th><td><%= rs.getString("Branch") %></td></tr>
                <tr><th>Year : </th><td><%= rs.getString("Year") %></td></tr>
                <tr><th>Semester : </th><td><%= rs.getString("sem") %></td></tr>
                <tr><th>Student's Name : </th><td><%= rs.getString("sname") %></td></tr>
                <tr><th>Father's Name : </th><td><%= rs.getString("fname") %></td></tr>
                <tr><th>Father's Occupation : </th><td><%= rs.getString("foccup") %></td></tr>
                <tr><th>Mother's Name : </th><td><%= rs.getString("mname") %></td></tr>
                <tr><th>Mother's Occupation : </th><td><%= rs.getString("moccup") %></td></tr>
                <tr><th>Category : </th><td><%= rs.getString("caste") %></td></tr>
                <tr><th>Student Admission Type : </th><td><%= rs.getString("stype") %></td></tr>
                <tr><th>Student Type : </th><td><%= rs.getString("htype") %></td></tr>
                <tr><th>CET Rank : </th><td><%= rs.getString("cet") %></td></tr>
                <tr><th>Date of Birth : </th><td><%= rs.getString("dob") %></td></tr>
                <tr><th>Blood Group : </th><td><%= rs.getString("blood") %></td></tr>
                <tr><th>Aadhar Number : </th><td><%= rs.getString("aadhar") %></td></tr>
                <tr><th>PRESENT ADDRESS : </th><td><%= rs.getString("caddr") %></td></tr>
                <tr><th>PERMANENT ADDRESS : </th><td><%= rs.getString("paddr") %></td></tr>
                <tr><th>Student Cell Number : </th><td><%= rs.getString("smno") %></td></tr>
                <tr><th>Parent Cell Number : </th><td><%= rs.getString("pmno") %></td></tr>
                <tr><th>Parent Alternate Number : </th><td><%= rs.getString("plno") %></td></tr>
                <tr><th>Student Email Id : </th><td><%= rs.getString("semail") %></td></tr>
                <tr><th>Parent Email Id : </th><td><%= rs.getString("pemail") %></td></tr>
</table>
</div>
<div class="container">
        <h4>Education Qualification</h4><hr>
        <div class="table-responsive-sm">
            <table class="table table-bordered table-hover table-secondary table-striped text-center">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
        </thead>
            <tr><td>1</td><td><%= rs.getString("ssc") %></td><td><%= rs.getString("inst1") %></td><td><%= rs.getString("yop1") %></td><td><%= rs.getString("marks1") %> %</td></tr>
            <tr><td>2</td><td><%= rs.getString("inter") %></td><td><%= rs.getString("inst2") %></td><td><%= rs.getString("yop2") %></td><td><%= rs.getString("marks2") %> %</td></tr>
            <tr><td>3</td><td><%= rs.getString("other") %></td><td><%= rs.getString("inst3") %></td><td><%= rs.getString("yop3") %></td><td><%= rs.getString("marks3") %> %</td></tr>
        </table>
            <%}%>	
        </div>
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
