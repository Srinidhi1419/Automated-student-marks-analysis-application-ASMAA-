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
<!--Course-wise Students-->
<div class="container">
<h2 class="text-center text-primary">Course-wise Staff </h2>
<form action="admin_view_dept_staff.jsp" method="post">
        <div class="row">
            <div class="col-sm-3 offset-3">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-3">
                Department*
                <select id="Branch" name="dept" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            
        </div>
    <div class="row">
        <div class="col-12"><br/>
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
    </div>
</form>
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                 <th>S.No</th>
                <th>Employee ID</th>
                <th>Name of the Employee</th>
                <th>Department</th>
                <th>View</th>
            </tr>
        </thead>
        <%
        String course = request.getParameter("course");
        String dept = request.getParameter("dept");
        int count = 0;
       
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from faculty where course='"+course+"' and dept='"+dept+"'");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    count++;
                    System.out.println(count);
    %>
        <tbody>
            <tr>
                <td><%=count%></td>
                <td><%= rs.getString("empid")%></td>
                <td><%= rs.getString("ename")%></td>                
                <td><%= rs.getString("dept")%></td>               
                <td><a class="text-danger" href="admin_view_single_staff.jsp?empid=<%= rs.getString("empid")%>">View</a></td>
            </tr>
        </tbody><%}%>
    </table>
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
<script>
var courseinfo = {"BTech": ["CSE","ECE","EEE","CIVIL","MECH","AGRI"]}


window.onload = function () {
	
	//Get html elements
	var Course = document.getElementById("Course");
	var Branch = document.getElementById("Branch");	
	
	//Load countries
	for (var course in courseinfo) {
		Course.options[Course.options.length] = new Option(course, course);
	}
	
	Course.onchange = function () {
		Branch.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var branch = courseinfo[this.value];
		for (var i = 0; i < branch.length; i++) {
			Branch.options[Branch.options.length] = new Option(branch[i], branch[i]);
		}
	}	
}
</script>
</body>
</html>