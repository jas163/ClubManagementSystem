<%@page import="java.sql.*"%>
<html>
<head>
  <title>My Webpage</title>
  <style>
.event-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-bottom: 20px;
}

.event-details {
  width: calc(25% - 20px); /* Adjust the width as desired */
  margin: 10px;
  padding: 10px;
  background-color: #f9f9f9;
  text-align: center;
}

.event-details h2 {
  margin: 0;
  font-size: 24px;
}

.event-details p {
  margin: 0;
  font-size: 16px;
}

.event-details {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
  text-align: center;
}

.event-details h2 {
  margin: 0;
  font-size: 24px;
}

.event-details p {
  margin: 0;
  font-size: 16px;
}
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
background-image:url("sharepageimage.jpg");
    }

    header {
      background-color: #f9f9f9;
      padding: 10px;
      display: flex;
      align-items: center;
      justify-content: space-between;
background-image:url("sharepageimage.jpg");
    }

    header .logo {
      display: flex;
      align-items: center;
    }

    header .logo img {
      width: 50px;
      height: 50px;
      margin-right: 10px;
    }

    header .logo span {
      font-weight: bold;
    }

    header .buttons {
      display: flex;
    }

    header .buttons button {
      margin-left: 10px;
    }

    .content {
      display: flex;
      margin-top: 20px;
    }

    .content .image {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}


    .content .image img {
  width: 300px; /* Increase the width as desired */
  height: 300px; /* Increase the height as desired */
  border-radius: 50%;
  object-fit: cover;
}

    .content .details {
      flex: 1;
      padding: 0 20px;
    }

    .content .details h2 {
      margin-top: 0;
 font-size: 34px;
    }

    .content .details p {
      margin-bottom: 20px;
  font-size: 24px;
    }

    .gallery {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .gallery .thumbnail {
  margin: 0 10px;
  width: 200px; /* Increase the width as desired */
  height: 200px; /* Increase the height as desired */
  position: relative;
}
    .gallery .thumbnail img {
      max-width: 100%;
      height: auto;
      cursor: pointer;
    }

    .gallery .thumbnail .overlay {
      position: absolute;
      top: 0;
      left: 0;
      background-color: rgba(0, 0, 0, 0.7);
      color: #fff;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0;
      transition: opacity 0.3s ease-in-out;
    }

    .gallery .thumbnail:hover .overlay {
      opacity: 1;
    }

    .register-button {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .register-button button {
      padding: 10px 20px;
      background-color: #f442df;
      color: #fff;
      border: none;
      border-radius: 15px;
      cursor: pointer;
    }
button{
background-color:black;margin-left:10px;border-radius:10px;padding:15px;width:90px;color:#fff;
}
button a{
color:rgb(246, 237, 237);font-weight:bold;font-size:10px;
}
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="logo.png" alt="Logo">
      <span>Shri Vishnu Engineering College For Women</span>
    </div>
   
<ul>

<a href="homepage.html"><button>HOME</button></a>
<a href="boxes.html"><button>CLUBS</button></a>
<a href="index.html"><button>LOGIN</button></a>
</ul>
  </header>

  <div class="content">
    <div class="image">
      <img src="rhythmicthunders.jpg" alt="Main Image">
    </div>
    <div class="details">
      <h2>RHYTHMIC THUNDERS</h2>
      <p>Dance is an art form consisting of sequences of body movements with aesthetic and often symbolic value, either improvised or purposefully selected.<br>
      Dance can be categorized and described by its choreography, by its repertoire of movements, done simultaneously with music or with instruments; or by its historical period or place of origin.<br>
      Rhythmic thunders provides us these facilities and enhances the dance lovers to explore more forms of dance.</p>
    </div>
  </div>
<br><br>
  <div class="gallery">
    <div class="thumbnail">
      <img src="rt1.jpeg" alt="Image 1">
      <div class="overlay">
        <p>Text about Image 1</p>
      </div>
    </div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <div class="thumbnail">
      <img src="rt2.jpg" alt="Image 2">
      <div class="overlay">
        <p>Text about Image 2</p>
      </div>
    </div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <div class="thumbnail">
      <img src="rt3.jpeg" alt="Image 3">
      <div class="overlay">
        <p>Text about Image 3</p>
      </div>
    </div>
  </div><br>
<h2>Events</h2>
<%
    String event_name = request.getParameter("event_name"); 
    String place = request.getParameter("place"); 
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root",
                "jasmine@1634");
       PreparedStatement stm = con.prepareStatement("SELECT * FROM permission WHERE approval = 'yes' ");
           
            ResultSet rs = stm.executeQuery();
int eventCount=0;
%>
<div class="event-container">
<%
            while(rs.next()) {
eventCount++;
	
              
%>
<div class="event-details">
  <h2><%=rs.getString("event_name")%></h2>
  <p>Date: <%=rs.getString("date")%></p>
  <p>Time: <%=rs.getString("time")%></p>
  <p>Venue: <%=rs.getString("place")%></p>
</div>
<%    
            // Check if 4 events have been displayed, then start a new row
            if (eventCount % 3 == 0) {
%>
</div>
<div class="event-container">
<%    
}
}con.close();
} catch (Exception e) {
e.printStackTrace();
}

%> 
</div>

  <div class="register-button">
    <a href="eventregistration.html"><button>Register Now</button></a>
  </div>
</body>
</html>