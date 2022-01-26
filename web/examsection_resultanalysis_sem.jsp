<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Sem Result Analysis</title>
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/bootstrap.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<link href="datatables/jquery.dataTables.min.css" rel="stylesheet"/>
<script src="datatables/jquery.dataTables.min.js"></script>

<style>	
     body {
        counter-reset: Serial;
    }
    tr td:first-child:after {
        counter-increment: Serial;
        content:  counter(Serial);
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
<div class="container">
<div class="row">
<div class="col-12 jumbotron">
    <form action="examsection_resultanalysis_sem.jsp" method="post">
    <div class="container">
        <h4> Semester Marks Analysis</h4><hr>
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
<!--Mid I ressult analysis-->
<h2 class="text-center text-primary">Sem Result Analysis</h2>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Subject Name</th>
               <!-- <th>Faculty Name</th> -->
                <th>Number of Students</th>
                <th>Number of Pass</th>
                <th>Number of Fail</th>
                <th>Pass %</th>
                               
            </tr>
        </thead>
        <%
        String course=request.getParameter("course");
        String year=request.getParameter("year");
        String sem=request.getParameter("sem");
        String branch=request.getParameter("branch");
        //String regul=request.getParameter("regul");
       ResultSet rs=null;
              PreparedStatement ps=null;
       
                Connection conn = DBConnection.getConnection();
              // ps = conn.prepareStatement("SELECT branch ,scode,sname ,COUNT(branch)as count FROM mid1 GROUP BY branch");
               // ps = conn.prepareStatement("SELECT * FROM semester where scode like '"+regul+"%' and year='"+year+"' and sem='"+sem+"'");
                // pass count
                
               
                ps = conn.prepareStatement("select sname, count(*) as count, sum(case grade when 'F' then 0 else 1 end) as pass, sum(case grade when 'F' then 1 else 0 end) as fail,round(sum(case grade when 'F' then 0 else 1 end)*100/count(*), 2) as pass_perc from semester where course='"+course+"' and year='"+year+"' and sem= '"+sem+"' and branch='"+branch+"' group by sname");
                rs = ps.executeQuery();
                System.out.println(course +" "+branch+" "+ year+" "+" "+sem);
                while(rs.next()){              
                    
    %>
        <tbody>
            <tr>
               
                <td> </td>
                <td><%= rs.getString("sname")%></td>
                <td><%= rs.getString("count")%></td>
                <td><%= rs.getString("pass")%></td>
                <td><%= rs.getString("fail")%></td>
                <td><%= rs.getString("pass_perc")%></td>
                
                
            </tr>
             </tbody><%}%>
        
    </table>

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
        console.log("vanakkam")
	
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
