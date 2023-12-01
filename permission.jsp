<%@page import="java.sql.*"%>
<html>
<body>
    <%
        String event_name = request.getParameter("event_name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String place = request.getParameter("place");
        String club_name = request.getParameter("club_name");
        String phone = request.getParameter("phone");
	String approval = "review";
	String time = request.getParameter("time");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
            String query = "INSERT INTO permission(event_name, description, date, place, approval, club_name, phone, time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, event_name);
            stm.setString(2, description);
            stm.setString(3, date);
            stm.setString(4, place);
            stm.setString(5, approval);
            stm.setString(6, club_name);
            stm.setString(7, phone);
	    stm.setString(8, time);


            int rowsInserted = stm.executeUpdate();
            System.out.println("Data updated successfully.. " + rowsInserted + " row(s) affected");

            if (rowsInserted > 0) {
		 response.sendRedirect("createeventback.html");
            } else {
                out.println("<html><body><h1>Registration not successful, Please try again </h1></body></html>");
            }
            
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
%>
</body>
    </html>
