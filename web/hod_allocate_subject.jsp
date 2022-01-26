<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Allocate Subject</title>
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
<!--Allocate Subject-->
<div class="container">
<h2 class="text-center text-primary">Allocate Subject</h2>
<form action="hod_allocate_subject.jsp" method="post" >
        <div class="row">
            <div class="offset-sm-4 col-sm-3">
                Employee ID:<input type="text" class="form-control" name="empid"/>
            </div>
            <div class="col-sm-3"><br/>
                <input type="submit" class="btn btn-success" name="submit" required="">
            </div>
        </div>
</form>


<%
String dept = (String)session.getAttribute("dept");
String empid = request.getParameter("empid");
%>
<div class="row">
<div class="col-md-12" style="width:100%;">
<form action="allocate.jsp" method="post"/> 
<table id="example" class="display table table-bordered table-responsive-sm">
        <thead>
            <tr>
                <th>S.No</th>
		<th>Faculty ID</th>
                <th>Faculty Name</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Subject Name</th>
                <th>Allocate</th>
            </tr>
        </thead>
        <%
         Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from faculty where dept='"+dept+"' and empid='"+empid+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){                
                
                
        %>
        <tbody>
            <tr>
                <td>1</td>
                <td><input type="text" name="empid" id="empid" value="<%= rs.getString("empid") %>" readonly=""/></td>
                <td><input type="text" name="ename" id="name" value="<%= rs.getString("ename") %>" readonly=""/></td>
                <td><select id="Year" name="year" required="">
                        <option>--Select Year--</option>
                        
                    </select>
                </td>
                <td>
                    <select id="Semester" name="sem" required="">
                        <option>--Select Semester--</option>
                        
                    </select>
                </td>
                        <td><select name="subject"><option>--Select Subject--</option><%
                    PreparedStatement ps3 = conn.prepareStatement("select * from subjects where dept='"+dept+"'");
                    ResultSet rs3 = ps3.executeQuery();
                    while(rs3.next()){%><option><%= rs3.getString("subject") %></option><%}%></select></td>
                <td><input type="submit" class="btn btn-success text-white" value="Allocate"/></td>
               
            </tr>
        </tbody><%}%>
    </table>
</form>	
</div>
</div>
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
<script>
var courseinfo = {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]}


window.onload = function () {
	
	//Get html elements
	
	var Year = document.getElementById("Year");
	var Semester = document.getElementById("Semester");
	
	//Load countries
	for (var year in courseinfo) {
		Year.options[Year.options.length] = new Option(year, year);
	}
	
	
	//City Changed
	Year.onchange = function () {
		Semester.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var semester = courseinfo[this.value];
		for (var i = 0; i < semester.length; i++) {
			Semester.options[Semester.options.length] = new Option(semester[i], semester[i]);
		}
	}	
}
</script>
</html>
