<%@page import="java.sql.*"%>
<html>
<body>
<%! String user,pwd;
%>
<%
user=request.getParameter("username");
pwd=request.getParameter("password");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false","root","jasmine@1634");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from coordinator_table where name='"+user+"' and password='"+pwd+"'");
if (rs.next())
{
response.sendRedirect("coEventbuttons.html");
}
else{
out.println("<html><b><center><h1>Invalid Username</h1></center></b></html>");
}
con.close();
}
catch(Exception e){
out.println(e.getMessage());
}
%>
</body>
</html>