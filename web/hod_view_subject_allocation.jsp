<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Subject Allocation</title>
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
					<a class="dropdown-item" href="hod_view_single_student.html">View Single Student</a>
					<a class="dropdown-item" href="hod_view_year_student.html">View Year-wise Students</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_view_single_staff.html">View Single Staff</a>
					<a class="dropdown-item" href="hod_view_teach.html">View Teaching-wise Staff</a>
					<a class="dropdown-item" href="hod_view_nonteach.html">View Non-Teaching-wise Staff</a>
					<a class="dropdown-item" href="hod_allocate_subject.html">Allocate Subject</a>
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
			<li class="nav-item last"><a class="nav-link active py-0 text-white" href="" data-target="#" data-toggle="modal">Attendance</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--View Subject Allocation-->
<div class="container">
<h2 class="text-center text-primary">View Subject Allocation</h2>

<div class="row">
<div class="col-md-12">
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
		<th>Faculty ID</th>
                <th>Faculty Name</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Subject Name</th>
            </tr>
        </thead>
         <% int count=0;
             String dept = (String)session.getAttribute("dept");
         Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from allocate_subject where dept='"+dept+"'");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){                
                count++;
                
        %>
        <tbody>
           <tr>
                <td><%=count%></td>
                <td><%=rs.getString("empid")%></td>
                <td><%=rs.getString("ename")%></td>
                <td><%=rs.getString("year")%></td>
                <td><%=rs.getString("sem")%></td>
                <td><%=rs.getString("subject")%></td>
            </tr>
        </tbody><%}%>
    </table>
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

</html>
