<%-- 
    Document   : ButtonReallocation
    Created on : Aug 9, 2022, 6:28:20 AM
    Author     : ETHEL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.* " %>
<%@page import="java.util.* " %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>On click Reallocation </title>
    </head>
    <body>
        <%
try{

     
   
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/groupdb","root",""); //Create connection using your ID and Password
    Statement st1=con1.createStatement();
    
// COUNT ALL EMPLOYEES.
//To do, count number of employees in the staff table
              int totalEmployees=0;
              ResultSet Employees = st1.executeQuery("SELECT COUNT(staffID) as employees FROM staff ");
                while(Employees.next()){                
                totalEmployees = Employees.getInt("employees");                                                  
            }
            out.println("Total Employees = " + totalEmployees);
//    PROMPT MANAGER FOR THE MONTH HE WANTS USING A SEERVLET.
//    TO DO;,
// GET RATIO OF SALES 
    LocalDate today = LocalDate.now();
    int month = today.getMonthValue(); 
//    FOR PRODUCT LINE 1
//     SELECT SUM INSTEAD OF ADDING ___SELECT ONLY WHAT WE WANT

    ResultSet resultset = st1.executeQuery("SELECT SUM(Sale) as TS FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND productLineID ='1'");
    int sales1 = 0;
    while(resultset.next()){
    sales1 = resultset.getInt("TS");
      out.println("Sales from PL1 = " +sales1 );
    }
    //    FOR PRODUCT LINE 2
//     SELECT SUM INSTEAD OF ADDING ___SELECT ONLY WHAT WE WANT

    ResultSet resultset2 = st1.executeQuery("SELECT SUM(Sale) as TS2 FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND productLineID ='2'");
    int sales2 =0;
    while(resultset2.next()){
    sales2 = resultset2.getInt("TS2");
      out.println("Sales from PL2 = " +sales2 );
    }
//    LINE 3
    ResultSet resultset3 = st1.executeQuery("SELECT SUM(Sale) as TS3 FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND productLineID ='3'");
   int sales3 = 0;
    while(resultset3.next()){
    sales3 = resultset3.getInt("TS3");
      out.println("Sales from PL3 = " +sales3 );
    }
//    FOR PRODUCT LINE 4
    ResultSet resultset4= st1.executeQuery("SELECT SUM(Sale) as TS4 FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND productLineID ='4'");
    int sales4 = 0;
    while(resultset4.next()){
     sales4= resultset4.getInt("TS4");
      out.println("Sales from PL4 = " +sales4 );
    }
    
//    TO DO: GET NUMBER OF EMPLOYEES FROM RATIO

    
    int totalMonthlySales = sales1+sales2+sales3+sales4;
    out.println("Total monthly Sales  = " + totalMonthlySales);
    
    //THESE ARE PRIORITIES, PUT IN AN ARRAY LIST
   float ApproximateEmp1 = ((float)sales1/totalMonthlySales)*totalEmployees;
   float ApproximateEmp2 = ((float)sales2/totalMonthlySales)*totalEmployees;
   float ApproximateEmp3 = ((float)sales3/totalMonthlySales)*totalEmployees;
   float ApproximateEmp4 = ((float)sales4/totalMonthlySales)*totalEmployees;
   
    ArrayList<Float> ApproxemployeeNumber_list = new ArrayList<Float>(Arrays.asList(ApproximateEmp1,ApproximateEmp2,ApproximateEmp3,ApproximateEmp4));
    out.println("This is the list of Approximate employees "+ApproxemployeeNumber_list);
    
//    Get highest priority line and least priority line
  float hP = Collections.max(ApproxemployeeNumber_list);
    
   out.println("Approximate employees" + ApproximateEmp1+","+ApproximateEmp2+","+ApproximateEmp3+","+ApproximateEmp4 );
   int newNumberEmployees = Math.round(ApproximateEmp1)+Math.round(ApproximateEmp2)+Math.round(ApproximateEmp3)+Math.round(ApproximateEmp4);
   out.println("New number of employees " + newNumberEmployees);
   
   int finalEmp1 = Math.round(ApproximateEmp1);
   int finalEmp2 = Math.round(ApproximateEmp2);
   int finalEmp3 = Math.round(ApproximateEmp3);
   int finalEmp4 = Math.round(ApproximateEmp4);
   
   
    HashMap<Float,Integer> priorityMap = new HashMap<Float,Integer>();
    priorityMap.put(ApproximateEmp1,1);
    priorityMap.put(ApproximateEmp2,2);
    priorityMap.put(ApproximateEmp3,3);
    priorityMap.put(ApproximateEmp4,4);
 
    if(priorityMap.get(hP) == 1){
            finalEmp1 = finalEmp1+1;            
     }
     else if(priorityMap.get(hP) == 2 ){
            finalEmp2 = finalEmp2+1;
            }
     else if(priorityMap.get(hP) == 3 ){
            finalEmp3 = finalEmp3+1;
            }            
            else{
            finalEmp4 = finalEmp4+1;          
            
            }
      
      
   
   
//   CASE 1 ----WE GET THE EXACT NUMBER OF AVAILABLE EMPLOYEES

              ArrayList<String> staffIDS_productLine1 = new ArrayList<String>();
              ArrayList<String> staffIDS_productLine2 = new ArrayList<String>();
              ArrayList<String> staffIDS_productLine3 = new ArrayList<String>();
              ArrayList<String> staffIDS_productLine4 = new ArrayList<String>();
        if(newNumberEmployees==totalEmployees){
               //Ratio finalEmp1:finalEmp2:finalEmp3:finalEmp4
              //Execute query to return 4 sets of staff IDs using Offset and limit clauses;
              //Create 4 arrraylists to hold the 4 sets of staff IdS              
              //Get staff id, update department at that point(Do this in a loop)
              
              //Get the first finalEmp1 staff IDs to be assigned to product line 1
              ResultSet staff_productline1 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmp1+ " Offset 0");
              
              while(staff_productline1.next()){                
                String staffId_1 = staff_productline1.getString("StaffID");                 
                staffIDS_productLine1.add(staffId_1);                                     
            } 
            out.println(staffIDS_productLine1); 
            
            //Skip the first two and get the one staff ID to be assigned to product line 2
             ResultSet staff_productline2 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmp2+ " Offset "+ finalEmp1+"");
             
              while(staff_productline2.next()){                
                String staffId_2 = staff_productline2.getString("StaffID");                 
                staffIDS_productLine2.add(staffId_2);                                     
            } 
            out.println(staffIDS_productLine2);    
            
            //Skip the first 3, get next 2 staff IDs for PL3;
            ResultSet staff_productline3 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmp3+" Offset " +(finalEmp1+finalEmp2)+"");
             
              while(staff_productline3.next()){                
                String staffId_3 = staff_productline3.getString("StaffID");                 
                staffIDS_productLine3.add(staffId_3);                                     
            } 
            out.println(staffIDS_productLine3);   
            
            //Skip the first 5, get next 5 staff IDs for PL4;
            ResultSet staff_productline4 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmp4+ " Offset "+ (finalEmp1+finalEmp2+finalEmp3)+"");
             
              while(staff_productline4.next()){                
                String staffId_4 = staff_productline4.getString("StaffID");                 
                staffIDS_productLine4.add(staffId_4);                                     
            } 
            out.println(staffIDS_productLine4); 
                     
            }
//            CASE WHEN ITS LESS BY ONE, ADD ONE EMPLOYEE TO HIGHEST PRIORITY PL

            else if(newNumberEmployees<totalEmployees){

                ResultSet staff_productline1 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmp1+ " Offset 0");
              
              while(staff_productline1.next()){                
                String staffId_1 = staff_productline1.getString("StaffID");                 
                staffIDS_productLine1.add(staffId_1);                                     
            } 
            out.println(staffIDS_productLine1); 
            
            //Skip the first two and get the one staff ID to be assigned to product line 2
             ResultSet staff_productline2 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmp2+ " Offset "+ finalEmp1+"");
             
              while(staff_productline2.next()){                
                String staffId_2 = staff_productline2.getString("StaffID");                 
                staffIDS_productLine2.add(staffId_2);                                     
            } 
            out.println(staffIDS_productLine2);    
            
            //Skip the first 3, get next 2 staff IDs for PL3;
            ResultSet staff_productline3 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmp3+" Offset " +(finalEmp1+finalEmp2)+"");
             
              while(staff_productline3.next()){                
                String staffId_3 = staff_productline3.getString("StaffID");                 
                staffIDS_productLine3.add(staffId_3);                                     
            } 
            out.println(staffIDS_productLine3);   
            
            //Skip the first 5, get next 5 staff IDs for PL4;
            ResultSet staff_productline4 = st1.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmp4+ " Offset "+ (finalEmp1+finalEmp2+finalEmp3)+"");
             
              while(staff_productline4.next()){                
                String staffId_4 = staff_productline4.getString("StaffID");                 
                staffIDS_productLine4.add(staffId_4);                                     
            } 
            out.println(staffIDS_productLine4);                     
            }
////            CASE WHEN ITS more BY ONE, reduce ONE EMPLOYEE from least PRIORITY PL on condition its greater than 1....
////Direct it to the next least priority line;  
// First forget we need atleast 1 per product line........TO DO, SORT ARRAYLIST IN ASCENDING ORDER , AND DETERMINE NEXT LEAST PRIORITY LINE
           else if(newNumberEmployees>totalEmployees){   
           
              //Execute query to return 4 sets of staff IDs using Offset and limit clauses;
              //Create 4 arrraylists to hold the 4 sets of staff IdS              
              //Get staff id, update department at that point(Do this in a loop)
             
            ResultSet staff_productline1 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmployeesLine1+ " Offset 0");
              
              while(staff_productline1.next()){                
                String staffId_1 = staff_productline1.getString("StaffID");                 
                staffIDS_productLine1.add(staffId_1);                                     
            } 
            out.println(staffIDS_productLine1); 
            
            //Skip the first two and get the one staff ID to be assigned to product line 2
             ResultSet staff_productline2 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalEmployeesLine2+ " Offset "+ finalEmployeesLine1+"");
             
              while(staff_productline2.next()){                
                String staffId_2 = staff_productline2.getString("StaffID");                 
                staffIDS_productLine2.add(staffId_2);                                     
            } 
            out.println(staffIDS_productLine2);    
            
            //Skip the first 3, get next 2 staff IDs for PL3;
            ResultSet staff_productline3 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmployeesLine3+" Offset " +(finalEmployeesLine1 +finalEmployeesLine2)+"");
             
              while(staff_productline3.next()){                
                String staffId_3 = staff_productline3.getString("StaffID");                 
                staffIDS_productLine3.add(staffId_3);                                     
            } 
            out.println(staffIDS_productLine3);   
            
            //Skip the first 5, get next 5 staff IDs for PL4;
            ResultSet staff_productline4 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalEmployeesLine4 + " Offset "+ (finalEmployeesLine1 + finalEmployeesLine2 +finalEmployeesLine3)+"");
             
              while(staff_productline4.next()){                
                String staffId_4 = staff_productline4.getString("StaffID");                 
                staffIDS_productLine4.add(staffId_4);                                     
            } 
            out.println(staffIDS_productLine4); 
            
             }
            else{
            out.println("There's an error");
            }
            
            
            //Now we have the different staff Ids for the categories of product lines , execute updates for each seperately
//            
            int n_productLine1=0;
            int n_productLine2=0;
            int n_productLine3=0;
            int n_productLine4=0;
            // Assign product line 1 staff
            while(n_productLine1<staffIDS_productLine1.size()){
                st1.executeUpdate("UPDATE staff SET productLineID = '1' WHERE StaffID = '"+ staffIDS_productLine1.get(n_productLine1)+"'");           
                n_productLine1++;
            }
            
            //Assign product line 2 staff
            while(n_productLine2<staffIDS_productLine2.size()){
                st1.executeUpdate("UPDATE staff SET productLineID = '2' WHERE StaffID = '"+ staffIDS_productLine2.get(n_productLine2)+"'");           
                n_productLine2++;
            }
            
            //Assign product line 3 staff
            while(n_productLine3<staffIDS_productLine3.size()){
                st1.executeUpdate("UPDATE staff SET productLineID = '3' WHERE StaffID = '"+ staffIDS_productLine3.get(n_productLine3)+"'");           
                n_productLine3++;
            }
            
            //Assign product line 4 staff
            while(n_productLine4<staffIDS_productLine4.size()){
                st1.executeUpdate("UPDATE staff SET productLineID = '4' WHERE StaffID = '"+ staffIDS_productLine4.get(n_productLine4)+"'");           
                n_productLine4++;
            }  
}

catch(Exception error){
    out.println(error);
}
 %>
    
    </body>
</html>

