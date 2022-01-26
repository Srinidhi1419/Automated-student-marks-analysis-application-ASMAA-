<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Principal Dashboard</title>
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
<div class="container">
    <div class="row">
        <div class="col-12"><h4 align="center">View Branch Wise Attendance</h4>
            <form action="principal_Branch_Wise_Attendance.jsp" method="post">
                <div class="row">
            <div class="col-sm-3">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-3">
                Department*
                <select id="Branch" name="branch" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            
        
            <div class="col-sm-3">
                Select Date*
                <input type="date" name="date" class="form-control" required=""/>
                    
            </div>           
            <div class="col-sm-3"><br>
                <input type="submit" class="btn btn-success" name="submit" required="">
            </div>
            </div>
        </form>
        </div>   
        
    </div>
</div>
<br/>
<%boolean c = false;
    if(request.getParameter("date")!=null){
    c = true;
}%>
<% if(c){ %>
<div class="container">              
            
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>YEAR</th>
                <th>Total No. of Students</th>
                <th>Total No. of Present</th>
                <th>Total No. of Absent</th>
                <th>Attendance Percentage(%)</th>
            </tr>
        </thead>
        <%
        String date = request.getParameter("date");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");
        System.out.println(date);
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement("select count(*),sum(h1 or h2 or h3 or h4 or h5 or h6 or h7) from attendance where date='"+date+"' and branch='"+branch+"' and course='"+course+"' and year='I'");
        ResultSet rs = ps.executeQuery();
        PreparedStatement ps1 = conn.prepareStatement("select count(*),sum(h1 or h2 or h3 or h4 or h5 or h6 or h7) from attendance where date='"+date+"' and branch='"+branch+"' and course='"+course+"' and year='II'");
        ResultSet rs1 = ps1.executeQuery();
        PreparedStatement ps2 = conn.prepareStatement("select count(*),sum(h1 or h2 or h3 or h4 or h5 or h6 or h7) from attendance where date='"+date+"' and branch='"+branch+"' and course='"+course+"' and year='III'");
        ResultSet rs2 = ps2.executeQuery();
        PreparedStatement ps3 = conn.prepareStatement("select count(*),sum(h1 or h2 or h3 or h4 or h5 or h6 or h7) from attendance where date='"+date+"' and branch='"+branch+"' and course='"+course+"' and year='IV'");
        ResultSet rs3 = ps3.executeQuery();
        
    %>
        <tbody>
            <tr>
                <td>1</td>
                <td>I</td><%if(rs.next()){%>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><%= rs.getInt(1) - rs.getInt(2) %></td>
                <% float s1 = rs.getInt(2);
                float s2 = rs.getInt(1);
                float p = (s1/s2)*100;
             String strDouble1 = String.format("%.2f", p);%>
                <td><%= strDouble1 %></td>
                <%}%>
            </tr>
            <tr>
                <td>2</td>
                <td>II</td><%if(rs1.next()){%>
                <td><%= rs1.getInt(1) %></td>
                <td><%= rs1.getInt(2) %></td>
                <td><%= rs1.getInt(1) - rs1.getInt(2) %></td>
                <% float s1 = rs1.getInt(2);
                float s2 = rs1.getInt(1);
                float p = (s1/s2)*100;
             String strDouble1 = String.format("%.2f", p);%>
                <td><%= strDouble1 %></td>
                <%}%>
            </tr>
            <tr>
                <td>3</td>
                <td>III</td><%if(rs2.next()){%>
                <td><%= rs2.getInt(1) %></td>
                <td><%= rs2.getInt(2) %></td>
                <td><%= rs2.getInt(1) - rs2.getInt(2) %></td>
                <% float s1 = rs2.getInt(2);
                float s2 = rs2.getInt(1);
                float p = (s1/s2)*100;
             String strDouble1 = String.format("%.2f", p);%>
                <td><%= strDouble1 %></td>
                <%}%>
            </tr>
            <tr>
                <td>4</td>
                <td>IV</td><%if(rs3.next()){%>
                <td><%= rs3.getInt(1) %></td>
                <td><%= rs3.getInt(2) %></td>
                <td><%= rs3.getInt(1) - rs3.getInt(2) %></td>
                <% float s1 = rs3.getInt(2);
                float s2 = rs3.getInt(1);
                float p = (s1/s2)*100;
             String strDouble1 = String.format("%.2f", p);%>
                <td><%= strDouble1 %></td>
                <%}%>
            </tr>
           
        </tbody>
    </table><%
    PreparedStatement ps6 = conn.prepareStatement("select count(*),sum(h1 or h2 or h3 or h4 or h5 or h6 or h7) from attendance where date='"+date+"' and branch='"+branch+"'");
        ResultSet rs6 = ps6.executeQuery();
     if(rs6.next()){
    %>
    <h6><strong><u>College wise: </u></strong><br/>Total No. of Students :&emsp;<%= rs6.getInt(1) %>
                <br/>Total No. of Present :&emsp;<%= rs6.getInt(2) %>
                <br/>Total No. of Absent :&emsp;<%= rs6.getInt(1) - rs6.getInt(2) %>
                

                
                
                <% float s1 = rs6.getInt(2);
                float s2 = rs6.getInt(1);
                float p = (s1/s2)*100;
             String strDouble1 = String.format("%.2f", p);%>
                <br/>Attendance Percentage(%): &emsp;<%= strDouble1 %> % </h6>
        </div>
<%}}%>
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
</html>

