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
        <div class="col-12"><h4 align="center">View Single Student Wise Attendance</h4>
            <form action="principal_Student_Wise_Attendance.jsp" method="post">
        <div class="row">
            <div class="col-sm-3 offset-3">
                Enter Roll Number*
                <input type="text" name="htno" class="form-control" required=""/>
                    
            </div>
            <div class="col-sm-3">
                Select Date*
                <input type="date" name="date" class="form-control" required=""/>
                
            </div>
            <div class="col-sm-3"><br><input type="hidden" name="status" value="1"/>
                <input type="submit" class="btn btn-success" name="submit" required="">
            </div>
            </div>
        </form>
            <br/>
            <center><strong>(OR)</strong></center>
            <br/>
            <form action="principal_Student_Wise_Attendance.jsp" method="post">
        <div class="row">
            <div class="col-sm-3">
                Enter Roll Number*
                <input type="text" name="htno" class="form-control" required=""/>
                    
            </div>
            <div class="col-sm-3">
                Select From Date*
                <input type="date" name="fdate" class="form-control" required=""/>
                    
            </div>
            <div class="col-sm-3">
                Select To Date*
                <input type="date" name="tdate" class="form-control" required=""/>
                    
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
}
    if(request.getParameter("fdate")!=null){
    c = true;
}
%>
<% if(c){ %>
<div class="container">    <hr>          
    <h4 align="center"><strong>View Attendance</strong></h4>
<table id="example" class="display table table-bordered table-responsive-sm" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Date</th>
                <th>htno</th>
                <th>Hour1</th>
                <th>Hour2</th>
                <th>Hour3</th>
                <th>Hour4</th>
                <th>Hour5</th>
                <th>Hour6</th>
                <th>Hour7</th>
            </tr>
        </thead>
        <%
        String date = request.getParameter("date");
        String fdate = request.getParameter("fdate");
        String tdate = request.getParameter("tdate");
        String htno = request.getParameter("htno");
        String status = request.getParameter("status");
        String sql=null;
        if(status=="1"){
            sql="select * from attendance where date='"+date+"' and htno='"+htno+"'";
        }else{
            sql="SELECT * FROM attendance WHERE htno='"+htno+"'and date BETWEEN  '"+fdate+"' AND '"+tdate+"'";
        }
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
    %>
        <tbody><%while(rs.next()){%>
            <tr>
                <td>1</td>
                <td><%=rs.getString("date")%></td>
                <td><%=htno%></td>
                <td><%if(rs.getString("h1")!=null){%><%=rs.getString("h1")%><%}%></td>
                <td><%if(rs.getString("h2")!=null){%><%=rs.getString("h2")%><%}%></td>
                <td><%if(rs.getString("h3")!=null){%><%=rs.getString("h3")%><%}%></td>
                <td><%if(rs.getString("h4")!=null){%><%=rs.getString("h4")%><%}%></td>
                <td><%if(rs.getString("h5")!=null){%><%=rs.getString("h5")%><%}%></td>
                <td><%if(rs.getString("h6")!=null){%><%=rs.getString("h6")%><%}%></td>
                <td><%if(rs.getString("h7")!=null){%><%=rs.getString("h7")%><%}%></td>
                
            </tr><%}%>
        </tbody>
    </table>
        </div>
<%}%>
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

