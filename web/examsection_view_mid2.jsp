<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>View Mid II Marks</title>
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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Upload Marks</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_upload_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_upload_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_upload_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_upload_sem.jsp">Sem Marks</a>
				</div>
			</li>
                        <li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">View Marks</a>
                        <div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_view_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_view_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_view_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_view_sem.jsp">Sem Marks</a>
				</div>
                        </li>
			<li class="nav-item dropdown"><a class="nav-link py-0 text-white" href="" data-toggle="dropdown">Result Analysis</a>
                        <div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_resultanalysis_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_sem.jsp">Sem Marks</a>
				</div>
                        </li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>

<!--View Mid I Marks-->

<div class="container">
<div class="row">
<div class="col-12 jumbotron">
    <form action="examsection_view_mid2.jsp" method="post">
    <div class="container">
        <h4>View Mid-I Marks</h4><hr>
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
        <br/>
    </div> <br/>
	<center><input type="submit" class=" btn btn-primary" value="Submit"/></center>

    </div></form>
</div>
</div>
<div class="container">
<h2 class="text-center text-primary">Mid II Marks</h2>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Hall Ticket Number</th>
                <th>Sub Code</th>
                <th>M1</th>
                <th>Q1</th>
                <th>A1</th>
                <th>SUM1</th>
                <th>M2</th>
                <th>Q2</th>
                <th>A2</th>
                <th>SUM2</th>
                <th>BEST</th>
                               
            </tr>
        </thead>
        <%
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String sem = request.getParameter("sem");
       System.out.println(course+" "+branch+" "+year+" "+sem);
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from mid2 where course='"+course+"' and branch='"+branch+"' and year='"+year+"' and sem='"+sem+"'" );
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
    %>
        <tbody>
            <tr>
                <td><%= rs.getString("htno")%></td>
                <td><%= rs.getString("htno")%></td>
                <td><%= rs.getString("scode")%></td>
                <td><%= rs.getString("m1")%></td>
                <td><%= rs.getString("sq1")%></td>
                <td><%= rs.getString("assign1")%></td>
               	<td><%= rs.getString("sum1")%></td>
                <td><%= rs.getString("m2")%></td>
                <td><%= rs.getString("sq2")%></td>
                <td><%= rs.getString("assign2")%></td>
               	<td><%= rs.getString("sum2")%></td>
                <td><%= rs.getString("grandsum")%></td>
                
            </tr>
             </tbody><%}%>
        
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
</html>
