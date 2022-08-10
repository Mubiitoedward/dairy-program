<%-- 
    Document   : report
    Created on : Aug 5, 2022, 11:19:36 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*,java.io.*,java.util.*,java.lang.*"%>
        <%!String sql,sql2,sql3;%>
        <%!Integer line[] ={};%>
        <%!Integer like[] ={};%>
        <%!Integer dislike[] ={};%>
        <%!Integer bar_label[] ={};%>
        <%!String dislike_label[] ={};%>
        <%!ArrayList<Integer> arrayList = new ArrayList<Integer>(Arrays.asList(line));%>
        <%!ArrayList<Integer> arrayLike = new ArrayList<Integer>(Arrays.asList(like));%><!-- like -->
        <%!ArrayList<Integer> arrayDisLike = new ArrayList<Integer>(Arrays.asList(dislike));%><!-- dislike -->
        <%!ArrayList<String> x_dislike = new ArrayList<String>(Arrays.asList(dislike_label));%><!-- line label -->
        <%!ArrayList<Integer> lineLabel = new ArrayList<Integer>(Arrays.asList(bar_label));%><!-- line label -->
        <%!Connection con=null;%>
        <%!Statement st=null;%>
        <%!ResultSet result;%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/report.css">
         <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
         
        <title>Report</title>
    </head>
    <body>
       
        
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
//            out.println("Driver Registered");
        try{
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/groupdb","root","");
            
            }
             catch(SQLException e){
                 out.println("Connection failed Sir,try farming leave Netbeans alone");
                 e.printStackTrace();
            }
         
                        
            
         }catch(ClassNotFoundException e){
               out.println("Where is the Driver?");
               e.printStackTrace();}
          
            
            %>
            <%
                sql2="select * from sales";
                sql3="select extract(MONTH from Date) from sales";
                sql="select * from products";
            
            st=con.createStatement();
            ResultSet sales=st.executeQuery(sql2);
            while(sales.next()){ //resultset for bar graph
            
             
              arrayList.add(sales.getInt("Sale")); 
          }
                
           ResultSet sal=st.executeQuery(sql3);
            while(sal.next()){ //resultset for bar graph
            lineLabel.add(sal.getInt("extract(MONTH from Date)"));
        
          }
            
            ResultSet salz=st.executeQuery(sql);
            while(salz.next()){ //resultset for bar graph
            x_dislike.add("'"+salz.getString("ProductName")+"'");
            arrayLike.add(salz.getInt("ProductLineID"));
        
          }

                %>
        <jsp:include page="NavBar.jsp"/>
        <section class="main">
            <jsp:include page="sidebar.jsp"/>
            <div class="main--content">
               <div class="charts">
                <div class="chart">
                    <h2>Sales (past 12 months)</h2>
                    <div>
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
                <div class="chart doughnut-chart">
                    <h2>Products</h2>
                    <div>
                        <canvas id="doughnut"></canvas>
                    </div>
                </div>
            </div>
            </div>
        </section>
            <script src="assets/js/main.js"></script>
            <script src="assets/js/chart.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    <script>
        var ctx = document.getElementById("lineChart").getContext("2d");
        var myChart = new Chart(ctx, {
        type: 'bar',
          data: {
        labels: <%out.println(lineLabel);%>,
        datasets: [{
            label: 'Total sales',
            data: <%out.println(arrayList);%>,
            backgroundColor: [
                'orange'

            ],
            borderColor: 'rgb(41, 155, 99)',

            borderWidth: 1
        }]
    },
    options: {
        responsive: true
    },
    //plugins:[ChartDataLabels]
    });
    </script>
    <script>
        var ctx2 = document.getElementById('doughnut').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'doughnut',
    data: {
        labels: <%out.println(x_dislike);%>,

        datasets: [{
            label: 'Products',
            data: <%out.println(arrayLike);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true
    }
});
    </script>
    <%
        lineLabel.clear();
        arrayList.clear();
        x_dislike.clear();
        arrayLike.clear();
        %>
    </body>
</html>
