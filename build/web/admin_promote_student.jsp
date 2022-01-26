<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Promote Student</title>
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
<!--Promote Student-->
<div class="container">
<h2 class="text-center text-primary">Promote Students</h2>
<form action="admin_promote_student.jsp" method="post" >
        <div class="row">
            <div class="offset-md-2 col-sm-2">
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select id="Branch" name="branch" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
	    <div class="col-sm-2">
                <select id="Year" name="year" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Year--</option>
                </select>
            </div>
			<div class="col-sm-2">
                <select id="Semester" name="sem" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Sem--</option>
                </select>
            </div>
			<div class="col-sm-2">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form>


<form action="student_promote.jsp" method="post">
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
				<th>Hall Ticket Number</th>
                <th>Name of Student</th>
                <th>Promote</th>
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
                
                <td><input type="checkbox" name="chkpromote[]" value="<%= rs.getString("htno")%>" id="selectall" /></td>
			</tr>
        </tbody>
        <%}%>
</table>
<div class="offset-4 col-8">
<input type="checkbox" id="selectall" onClick="selectAll(this)" />Select All
<input type="submit" name="promote" id="promote" class="btn btn-success" value="Promote"/>&nbsp;<input type="submit" name="cancel" id="cancel" class="btn btn-danger" value="Cancel" />
</div>
</form>
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
<script language="JavaScript">
	function selectAll(source) {
		checkboxes = document.getElementsByName('chkpromote[]');
		for(var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>
</html>
