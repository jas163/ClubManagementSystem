<%@page import="java.sql.*"%>
<html>
<body>
<%
    String searchEvent = request.getParameter("event_name"); // Get the search value from the request parameter

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root",
                "jasmine@1634");
        Statement stm = con.createStatement();

        String query = "SELECT * FROM clubregistration1";
        if (searchEvent != null && !searchEvent.isEmpty()) {
            // Add a WHERE clause to filter by event_name if the search value is provided
            query += " WHERE event_name = '" + searchEvent + "'";
        }

        ResultSet rs = stm.executeQuery(query);

        out.println("<html><body><h1>Student Data</h1>");
        
        // Add a form with the search bar
        out.println("<form method='post' action='/BackEventRegistrationServlet'>");
        out.println("<input type='text' name='event_name' placeholder='Search by Event Name'>");
        out.println("<input type='submit' value='Search'>");
        out.println("</form>");
        
        out.println("<table border='1'><tr><th>Regd</th><th>Name</th><th>Event Name</th></tr>");

        while (rs.next()) {
            String redg = rs.getString("redg");
            String name = rs.getString("name");
            String eventName = rs.getString("event_name");

            // Create a link to the servlet with the event name as a query parameter
            String servletURL = "/Another.jsp?event_name=" + eventName;
            out.println("<tr><td>" + redg + "</td><td>" + name + "</td><td><a href='" + servletURL + "'>" + eventName + "</a></td></tr>");
        }

        out.println("</table></body></html>");

        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>
