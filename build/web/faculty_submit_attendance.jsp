<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Submit Attendance</title>
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
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_submit_attendance.html">Submit Attendance</a></li>
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_view_attendance.jsp">View Attendance</a></li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
</br>
<!--Submit Attendance--->
<div class="container">
<h2 class="text-center text-primary">Submit Attendance</h2>

<form action="submit_attendance.jsp" method="post">
        <div class="row">
            <div class="col-sm-3">Date*
                <center><input type="date" name="date" class="form-control" required=""/></center>
            </div>
            <div class="col-sm-3">
                Hour*
                <select id="Hour" name="hour" class="form-control" size="1" required="">
                    <option>--Select Hour--</option>
                    <option value="h1">1st Hour</option>
                    <option value="h2">2nd Hour</option>
                    <option value="h3">3rd Hour</option>
                    <option value="h4">4th Hour</option>
                    <option value="h5">5th Hour</option>
                    <option value="h6">6th Hour</option>
                    <option value="h7">7th Hour</option>
                </select>
            </div>
            
        </div>

<div class="row">
<div class="col-md-12"><br/>
    
<table id="example" class="display table table-bordered table-responsive-sm"  style="width:100%;">
                <thead>
            <tr>
                <th>S.No</th>
                <th>Hall Ticket Number</th>
                <th>Name of Student</th>
                <th>Present</th>
                <th>Absent</th>
                <th>Remarks</th>
            </tr>
        </thead>
       <%
        String course = "BTech";
        String hour = request.getParameter("hour");
        String date = request.getParameter("date");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String sem = request.getParameter("sem");
        Connection conn = DBConnection.getConnection();
        int i = 0;
        
        PreparedStatement ps = conn.prepareStatement("select * from student where course='"+course+"' and branch='"+session.getAttribute("dept")+"' and year='"+year+"' and sem='"+sem+"'");
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
                  
            i++;
        
    %>
        <tbody>
            <tr><td><%= i %></td>
               <td><%= rs.getString("htno") %></td>
               <td><%= rs.getString("sname") %></td>
               <td><input type="radio" name="<%=rs.getString("htno")%>" value="1" checked="checked"/></td>
               <td><input type="radio" name="<%=rs.getString("htno")%>" value="0" /></td>
        
            </tr>
			
        </tbody><%}%>
    </table>
<div class="text-center">
    <input type="hidden" name="course" value="<%= course %>"/>
    <input type="hidden" name="year" value="<%= year %>"/>
    <input type="hidden" name="branch" value="<%= branch %>"/>
    <input type="hidden" name="sem" value="<%= sem %>"/>
    <input type="hidden" name="date" value="<%= date %>"/>
    <input type="hidden" name="hour" value="<%= hour %>"/><br/>
    <input type="submit" name="submit" value="Submit" class="btn btn-success"/>&emsp;&emsp;&emsp;	
	<input type="submit" name="cancel" value="Cancel" class="btn btn-danger"/>
</div>
   <br/> 

</div>
</div></form>	
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
</html>
