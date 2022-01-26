<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
int status = Integer.parseInt(request.getParameter("status"));
if(status==1){
    if(name.equals("Administrative")&&password.equals("Administrative")){
        response.sendRedirect("admin_index.jsp?msg=LoginSuccessfull");
    }    
    
}else if(status==2){
    if(name.equals("principal")&&password.equals("principal")){
        response.sendRedirect("principal_index.jsp?msg=LoginSuccessfull");
    }
    
    
}else if(status==3){
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("select * from faculty where empid='"+name+"'AND pass='"+password+"' AND design2='HOD'");
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("empid", rs.getString("empid"));
        session.setAttribute("ename", rs.getString("ename"));
        session.setAttribute("dept", rs.getString("dept"));
        
        response.sendRedirect("hod_index.jsp?msg=LoginSuccessfull");
    }else{
        response.sendRedirect("index.html?msg=LoginFailed");
    }   
    
}else if(status==4){
    if(name.equals("Exam")&&password.equals("Exam")){
        response.sendRedirect("examsection_index.jsp?msg=LoginSuccessfull");
    }
}else if(status==5){
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+name+"' AND pass='"+password+"'");
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("htno", rs.getString("htno"));
        session.setAttribute("sname", rs.getString("sname"));
        
        response.sendRedirect("student_index.jsp?msg=LoginSuccessfull");
    }else{
        response.sendRedirect("index.html?msg=LoginFailed");
    }
}else if(status==6){
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("select * from faculty where empid='"+name+"'AND pass='"+password+"'");
    ResultSet rs = ps.executeQuery();
    PreparedStatement ps1 = conn.prepareStatement("select * from nonfaculty where empid='"+name+"'AND pass='"+password+"'");
    ResultSet rs1 = ps1.executeQuery();
    if(rs.next()){
        session.setAttribute("empid", rs.getString("empid"));
        session.setAttribute("ename", rs.getString("ename"));
        session.setAttribute("dept", rs.getString("dept"));
        
        response.sendRedirect("faculty_index.jsp?msg=LoginSuccessfull");
    }else if(rs1.next()){
        session.setAttribute("empid", rs1.getString("empid"));
        session.setAttribute("ename", rs1.getString("ename"));
        session.setAttribute("dept", rs1.getString("dept"));
        
        response.sendRedirect("faculty_index.jsp?msg=LoginSuccessfull");        
    }else{
        response.sendRedirect("index.html?msg=LoginFailed");
    }
    
}
    else{
    
}
%>