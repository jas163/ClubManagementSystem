<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Details</title>
</head>
<body>
    <h1>Event Details</h1>
    
    <%-- Retrieve the event name from the request parameter --%>
    <% String eventName = request.getParameter("event_name"); %>
    

   
    
    <%-- Database query to retrieve the row based on the event name --%>
    <% try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Create a connection to the database
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false","root","jasmine@1634");

        
        // Prepare the SQL statement
        String sql = "SELECT * FROM clubregistration1 WHERE event_name = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, eventName);
        
        // Execute the query
        ResultSet rs = pstmt.executeQuery();
        
        // Process the result set
        while (rs.next()) {
            // Retrieve the column values
            String redg = rs.getString("redg");
            String name = rs.getString("name");
            // ... Retrieve other column values as needed
            
            // Display the retrieved data
            out.println("<h2>Registration Number: " + redg + "</h2>");
            out.println("<p>Event Name: " + eventName + "</p>");
            out.println("<p>Name: " + name + "</p>");
            // ... Display other column values as needed
        }
        
        // Close the database connections
        rs.close();
        pstmt.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } %>
    
</body>
</html>
