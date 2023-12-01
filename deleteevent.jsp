

<%@page import="java.sql.*"%>
<html>


<%
try {
    String event_name = request.getParameter("event_name");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
    PreparedStatement stm = con.prepareStatement("DELETE FROM permission WHERE event_name=?");
    stm.setString(1, event_name);
    int x = stm.executeUpdate();
    if (x > 0) {
       response.sendRedirect("afterdelete.html");
    } else {
	response.sendRedirect("nodelete.html");
    }
    con.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    out.println("Error: " + e.getMessage());
}
%>

</html>