<%@page import="javafx.scene.control.Alert"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Student Details</title>
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
<!--Enter Student HT No.-->
<form action="hod_view_single_student.jsp" method="post">
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
				<input type="text" class="form-control" name="htno" placeholder="Enter Hall Ticket No." required="">		
            </div>
            <div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form>
<!-- Table for student details-->
<div class="container">
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <%
                String htno = request.getParameter("htno");
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+htno+"'AND branch='"+session.getAttribute("dept")+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
    <center><img id="myimage" src="view.jsp?htno=<%=rs.getString("htno")%>"  height="150" width="150"></center></br>
			<tr><th>Hall Ticket Number : </th><td><%= rs.getString("htno")%></td></tr>
                <tr><th>Branch : </th><td><%= rs.getString("Branch") %></td></tr>
                <tr><th>Year : </th><td><%= rs.getString("Year") %></td></tr>
                <tr><th>Semester : </th><td><%= rs.getString("sem") %></td></tr>
                <tr><th>Student's Name : </th><td><%= rs.getString("sname") %></td></tr>
                <tr><th>Father's Name : </th><td><%= rs.getString("fname") %></td></tr>
                <tr><th>Father's Occupation : </th><td><%= rs.getString("foccup") %></td></tr>
                <tr><th>Mother's Name : </th><td><%= rs.getString("mname") %></td></tr>
                <tr><th>Mother's Occupation : </th><td><%= rs.getString("moccup") %></td></tr>
                <tr><th>Category : </th><td><%= rs.getString("caste") %></td></tr>
                <tr><th>Student Admission Type : </th><td><%= rs.getString("stype") %></td></tr>
                <tr><th>Student Type : </th><td><%= rs.getString("htype") %></td></tr>
                <tr><th>CET Rank : </th><td><%= rs.getString("cet") %></td></tr>
                <tr><th>Aadhar Number : </th><td><%= rs.getString("aadhar") %></td></tr>
                <tr><th>Date of Birth : </th><td><%= rs.getString("dob") %></td></tr>
                <tr><th>Blood Group : </th><td><%= rs.getString("blood") %></td></tr>
                <tr><th>PRESENT ADDRESS : </th><td><%= rs.getString("caddr") %></td></tr>
                <tr><th>PERMANENT ADDRESS : </th><td><%= rs.getString("paddr") %></td></tr>
                <tr><th>Student Cell Number : </th><td><%= rs.getString("smno") %></td></tr>
                <tr><th>Parent Cell Number : </th><td><%= rs.getString("pmno") %></td></tr>
                <tr><th>Parent Landline Number : </th><td><%= rs.getString("plno") %></td></tr>
                <tr><th>Student Email Id : </th><td><%= rs.getString("semail") %></td></tr>
                <tr><th>Parent Email Id : </th><td><%= rs.getString("pemail") %></td></tr>
</table>
</div>
<div class="container">
        <h4>Education Qualification</h4><hr>
        <div class="table-responsive-sm">
            <table class="table table-bordered table-hover table-secondary table-striped text-center">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
        </thead>
            <tr><td>1</td><td><%= rs.getString("ssc") %></td><td><%= rs.getString("inst1") %></td><td><%= rs.getString("yop1") %></td><td><%= rs.getString("marks1") %> %</td></tr>
            <tr><td>2</td><td><%= rs.getString("inter") %></td><td><%= rs.getString("inst2") %></td><td><%= rs.getString("yop2") %></td><td><%= rs.getString("marks2") %> %</td></tr>
            <tr><td>3</td><td><%= rs.getString("other") %></td><td><%= rs.getString("inst3") %></td><td><%= rs.getString("yop3") %></td><td><%= rs.getString("marks3") %> %</td></tr>
        </table>
            <%}%>	
        </div>
</div>
        <div class="container">
    <h4>Academics</h4><hr>
    <h5>I Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count5= 0;
                PreparedStatement ps6 = conn.prepareStatement("select * from semester where htno='"+request.getAttribute("htno")+"' and year='I' and sem='I' ");
                ResultSet rs6 = ps6.executeQuery();
                while(rs6.next()){count5++;
    %>
    <tr><td><%=count5%></td><td><%=rs6.getString("scode")%></td><td><%= rs6.getString("sname") %></td><td><%= rs6.getString("grade") %></td><td><%= rs6.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>
<div class="container">
    <hr>
    <h5>I Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count= 0;
                PreparedStatement ps1 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='I' and sem='II' ");
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){count++;
    %>
    <tr><td><%=count%></td><td><%=rs1.getString("scode")%></td><td><%= rs1.getString("sname") %></td><td><%= rs1.getString("grade") %></td><td><%= rs1.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>

<div class="container">
    <h4>Academics</h4><hr>
    <h5>II Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count6= 0;
                PreparedStatement ps7 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='II' and sem='I' ");
                ResultSet rs7 = ps7.executeQuery();
                while(rs7.next()){count6++;
    %>
    <tr><td><%=count6%></td><td><%=rs7.getString("scode")%></td><td><%= rs7.getString("sname") %></td><td><%= rs7.getString("grade") %></td><td><%= rs7.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>

<div class="container"><hr>
    <h5>II Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count1= 0;
                PreparedStatement ps2 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='II' and sem='II' ");
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next()){count1++;
    %>
    <tr><td><%=count1%></td><td><%=rs2.getString("scode")%></td><td><%= rs2.getString("sname") %></td><td><%= rs2.getString("grade") %></td><td><%= rs2.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>
<div class="container"><hr>
    <h5>III Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count2= 0;
                PreparedStatement ps3 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='III' and sem='I' ");
                ResultSet rs3 = ps3.executeQuery();
                while(rs3.next()){count2++;
    %>
    <tr><td><%=count2%></td><td><%=rs3.getString("scode")%></td><td><%= rs3.getString("sname") %></td><td><%= rs3.getString("grade") %></td><td><%= rs3.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>
<div class="container"><hr>
    <h5>III Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count3= 0;
                PreparedStatement ps4 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='III' and sem='II' ");
                ResultSet rs4 = ps4.executeQuery();
                while(rs4.next()){count3++;
    %>
    <tr><td><%=count3%></td><td><%=rs4.getString("scode")%></td><td><%= rs4.getString("sname") %></td><td><%= rs4.getString("grade") %></td><td><%= rs4.getInt("credits") %></td></tr>
             <%}%>   
</table>
</div>
<div class="container"><hr>
    <h5>IV Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count4= 0;
                PreparedStatement ps5 = conn.prepareStatement("select * from semester where htno='"+request.getParameter("htno")+"' and year='IV' and sem='I' ");
                ResultSet rs5 = ps5.executeQuery();
                while(rs5.next()){count4++;
    %>
    <tr><td><%=count4%></td><td><%=rs5.getString("scode")%></td><td><%= rs5.getString("sname") %></td><td><%= rs5.getString("grade") %></td><td><%= rs5.getInt("credits") %></td></tr>
             <%}%>   
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

</html>
