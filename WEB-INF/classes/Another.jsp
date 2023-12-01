<%@page import="java.sql.*"%>
<html>
<body>
<%
        String eventName = request.getParameter("event_name");
        
        // Perform actions or logic specific to the event
        // For example, retrieve additional information from the database, process data, etc.
        
        // Set the response content type
        
        
        
        out.println("<html><body>");
        out.println("<h1>Event Details</h1>");
        out.println("<p>Event Name: " + eventName + "</p>");
        // Display additional event details or perform other actions based on the event name
        
        out.println("</body></html>");
    %>
</body>
</html>