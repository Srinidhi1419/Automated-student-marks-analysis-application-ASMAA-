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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Student</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_view_single_student.jsp">View Single Student</a>
					<a class="dropdown-item" href="hod_view_year_student.jsp">View Year-wise Students</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_view_single_staff.jsp">View Single Staff</a>
					<a class="dropdown-item" href="hod_view_teach.jsp">View Teaching-wise Staff</a>
					<a class="dropdown-item" href="hod_view_nonteach.jsp">View Non-Teaching-wise Staff</a>
                                        <a class="dropdown-item" href="hod_add_subject.jsp">Add Subject</a>
                                        <a class="dropdown-item" href="hod_view_subject.jsp">View All Subjects</a>
					<a class="dropdown-item" href="hod_allocate_subject.jsp">Allocate Subject</a>
					<a class="dropdown-item" href="hod_view_subject_allocation.jsp">View Subject Allocation</a>
					<a class="dropdown-item" href="hod_set_incharge.jsp">Set Class Incharge</a>
					<a class="dropdown-item" href="hod_view_incharge.jsp">View Class Incharge</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Remarks</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_remarks.jsp">HOD Remarks </a>
					<a class="dropdown-item" href="hod_view_remarks.jsp">View Remarks</a>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="" data-target="#" data-toggle="modal">Attendance</a></li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Enter Student HT No.-->
<form action="hod_view_single_staff.jsp" method="post">
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
        System.out.println(session.getAttribute("dept"));
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from faculty where empid='"+empid+"' AND dept='"+session.getAttribute("dept")+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
    <center><img id="myimage" src="view1.jsp?empid=<%=rs.getString("empid")%>"  height="150" width="150"></center></br>
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
                <tr><th>Designations : </th><td><%if(rs.getString("design1")!=null){%><%=rs.getString("design1")%><%}%><%if(rs.getString("design2")!=null){%>,<%=rs.getString("design2")%><%}%><%if(rs.getString("design3")!=null){%>,<%=rs.getString("design3")%><%}%></td></tr>
                </table>
</div>
<div class="container">
        <h4>Education Qualification</h4><hr>
        <div class="table-responsive-sm">
            <table class="table table-bordered table-hover table-secondary table-striped text-center">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Reg. No</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
        </thead>
            <tr><td>1</td><td><%= rs.getString("reg1") %><td><%= rs.getString("qual1") %></td><td><%= rs.getString("inst1") %></td><td><%= rs.getString("yop1") %></td><td><%= rs.getString("marks1") %> %</td></tr>
            <tr><td>2</td><td><%= rs.getString("reg2") %><td><%= rs.getString("qual2") %></td><td><%= rs.getString("inst2") %></td><td><%= rs.getString("yop2") %></td><td><%= rs.getString("marks2") %> %</td></tr>
            <tr><td>3</td><td><%= rs.getString("reg3") %><td><%= rs.getString("qual3") %></td><td><%= rs.getString("inst3") %></td><td><%= rs.getString("yop3") %></td><td><%= rs.getString("marks3") %> %</td></tr>
            <tr><td>4</td><td><%= rs.getString("reg4") %><td><%= rs.getString("qual4") %></td><td><%= rs.getString("inst4") %></td><td><%= rs.getString("yop4") %></td><td><%= rs.getString("marks4") %> %</td></tr>
            <tr><td>5</td><td><%= rs.getString("reg5") %><td><%= rs.getString("qual5") %></td><td><%= rs.getString("inst5") %></td><td><%= rs.getString("yop5") %></td><td><%= rs.getString("marks5") %> %</td></tr>
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
