<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>View Lab Marks</title>
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
<!--View Lab Marks-->
<h2 class="text-center text-primary">Lab Marks</h2>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Hall Ticket Number</th>
                <th>Lab Code</th>
                <th>Marks</th>
                               
            </tr>
        </thead>
        <%
        
       
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from lab");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
    %>
        <tbody>
            <tr>
                <td><%= rs.getString("htno")%></td>
                <td><%= rs.getString("htno")%></td>
                <td><%= rs.getString("scode")%></td>
                
               	<td><%= rs.getString("marks")%></td>
                
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

</html>
