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
<h2 class="text-center text-primary">Faculty Remarks</h2>
<form action="hod_remarks.jsp" method="post">  
<div class="container">
    <div class="row">
        <div class="col-sm-3 offset-4">
                Faculty Id*
                <input type="text" name="empid" class="form-control" placeholder="" required="" />
            </div>
        <div class="col-sm-3"><br/>
                <input type="submit" class=" btn r btn-primary" value="Submit"/>
            </div>
    </div>
</div><br/>
     <center></center>
</form>

<div class="row">
<div class="col-md-12" style="width:100%;">
    

<table id="example" class="display table table-bordered table-responsive-sm"  style="width:100%;">
        <thead>
            <tr>
                <th>S.No</th>
		<th>Employee ID</th>
                <th>Faculty Name</th>
                <th>Remarks</th>
                <th>Submit</th>
            </tr>
        </thead>
        <%
            Connection conn = DBConnection.getConnection();
                String dept = (String)session.getAttribute("dept");
                String empid = request.getParameter("empid");
    
                PreparedStatement ps = conn.prepareStatement("select * from faculty  where empid='"+empid+"' and dept='"+dept+"'");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
    %>
        <tbody>
           <tr>
               <td>1</td><form action="add_remark.jsp" method="post">
                <td><input type="text" name="empid" id="empid" value="<%= rs.getString("empid") %>" readonly=""/></td>
                <td><input type="text" name="ename" id="name" value="<%= rs.getString("ename") %>" readonly=""/></td>
                <td><input type="text" name="remark" id="remarks" value=""/></td>
                <td><input type="submit" name="submit" id="submit" class="text-white btn btn-primary"/></td></form>
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
