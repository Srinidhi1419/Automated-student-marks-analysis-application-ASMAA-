<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Branch-wise Students</title>
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
<!--Branch-wise Students-->
<div class="container">
    <div class="row">
        <div class="col-12"><h4>View Student Details</h4>
            <form action="principal_view_course_student.jsp" method="post">
        <div class="row">
            <div class="col-sm-3">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
        
            <div class="col-sm-3">
                Branch*
                <select id="Branch" name="branch" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            
            <div class="col-sm-3">    
                Year*
                <select id="Year" name="year" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Year--</option>
                </select>
            </div>
            
            <div class="col-sm-3">
                Semester*
                <select id="Semester" name="sem" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Semester--</option>
                </select>               
            </div>
            </div><br/>
            <div class="row">
            <div class="col-sm-3 offset-5">
                <center> <input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
            </div>
        </form>
        </div>        
    </div>
    <!-- Table for student details-->

<div class="container">              
            
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Hall Ticket Number</th>
                <th>Name of the Student</th>
                <th>year</th>
                <th>Sem</th>
                <th>View</th>
            </tr>
        </thead>
        <%
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String sem = request.getParameter("sem");
        System.out.println(course+" "+branch+" "+year+" "+sem);
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from student where course='"+course+"' AND branch='"+branch+"' AND year='"+year+"' AND sem='"+sem+"'");
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while(rs.next()){
            count++;
    %>
        <tbody>
            <tr>
                <td><%=count%></td>
                <td><%= rs.getString("htno")%></td>
                <td><%= rs.getString("sname")%></td>
                <td><%= rs.getString("year")%></td>
                <td><%= rs.getString("sem")%></td>               
                <td><a class="text-danger" href="principal_view_single_student.jsp?htno=<%= rs.getString("htno")%>">View</a></td>
            </tr>
        </tbody><%}%>
    </table>

        </div>
    </div>



<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<script>
var courseinfo = {"BTech": {"CSE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
		"ECE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "EEE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "CIVIL": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "MECH": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "AGRI": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},}}


window.onload = function () {
	
	//Get html elements
	var Course = document.getElementById("Course");
	var Branch = document.getElementById("Branch");	
	var Year = document.getElementById("Year");
	var Semester = document.getElementById("Semester");
	
	//Load countries
	for (var course in courseinfo) {
		Course.options[Course.options.length] = new Option(course, course);
	}
	
	//County Changed
	Course.onchange = function () {
		 
		 Branch.length = 1; // remove all options bar first
		 Year.length = 1; // remove all options bar first
		 Semester.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var branch in courseinfo[this.value]) {
			 Branch.options[Branch.options.length] = new Option(branch, branch);
		 }
	}
	
	//State Changed
	Branch.onchange = function () {		 
		 
		 Year.length = 1; // remove all options bar first
		 Semester.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var year in courseinfo[Course.value][this.value]) {
			 Year.options[Year.options.length] = new Option(year, year);
		 }
	}
	
	//City Changed
	Year.onchange = function () {
		Semester.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var semester = courseinfo[Course.value][Branch.value][this.value];
		for (var i = 0; i < semester.length; i++) {
			Semester.options[Semester.options.length] = new Option(semester[i], semester[i]);
		}
	}	
}
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
