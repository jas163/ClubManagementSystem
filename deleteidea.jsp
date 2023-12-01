<%@page import="java.sql.*"%>
<html>

<body>
<%
    
    try {
	 String regis= request.getParameter("regis");
	    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root",
                "jasmine@1634");
         PreparedStatement stm = con.prepareStatement("DELETE FROM idea WHERE regis=?");
        stm.setString(1, regis);
        int x = stm.executeUpdate();
	 if(x>0) {
            response.sendRedirect("displayIdea.jsp");
}
else{
out.println("<p>No rows have been deleted.</p>");
}

        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>