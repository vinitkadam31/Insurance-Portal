package webapp;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import models.GeneralQuestions;
import models.MedicalQuestion;
import models.PaymentSchedule;
import models.Product;
import models.UserInfo;
import models.ViewPolicyData;

public class DBConectivity {
	public Connection conn;
	
	public DBConectivity()
	{
		try
		{
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcle";
			String username = "c##vinit";
			String password = "1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
		}catch(Exception e){System.out.println(e);}
	}
	
	public String ValidateCredentials(String username, String password)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select * from sys_user where username='"+username+"' AND password = '"+ password + "'";
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		           System.out.println(rs.getString(4));
		           return rs.getString(4);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String GetApplid(String username)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select * from global_t where username='"+username+"'";
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		           System.out.println(rs.getString(1));
		           return rs.getString(1);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String GetApplicationCompletCount(String applid)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "SELECT COUNT(*) FROM WORKFLOW_STAGE WHERE STAGE = 'ISSUE' AND STAGESTATUS = 'C' AND APPLID = " + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		           System.out.println(rs.getString(1));
		           return rs.getString(1);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String GetCustViewApplCount(String applid)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select COUNT(g.applid) from global_t g, workflow_Stage w,cust_policy_details c,products p,stage s where g.applid = w.applid and g.applid = c.applid and p.productid = c.productid and w.stage = s.stage and s.stage = 'CUSTENTRY' and w.stagestatus = 'P' and g.applid =" + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		           System.out.println(rs.getString(1));
		           return rs.getString(1);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public int InsertNewCustomer(UserInfo user)
	{
		InsertUsers(user);
		return InsertGlobalUser(user);
	}
	
	public String ConvertToDateFormat(String input)
	{
		try
		{
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			//Date date = ;
			return dateFormat.format(dateFormat.parse(input));
		}
		catch(Exception ex)
		{
			
		}
		return GetCurrentDate();
	}
	
	public int InsertGlobalUser(UserInfo user)
	{
		try{
			int applId =Integer.parseInt(GetUniqueApplid()) + 1;
			Statement statement = conn.createStatement();
			//String queryString = "insert into sys_user(USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID) values(userid.nextval,'abhi','abhi','C',to_date('25-11-2017', 'dd-mm-yyyy'),'abhi')";
			String queryString = "insert into global_t(APPLID, USERNAME, NAME, DOB, CONTACTNO, GENDER, ADDRESS1, ADDRESS2, CITY, STATE, COUNTRY, PINCODE) values(" + applId + ", '" + user.userName + "', '" + user.name + "', '" + ConvertToDateFormat(user.dob) + "', " + user.contactno + ", '" + user.gender + "', '" + user.address1 + "', '" + user.address2 + "', '" + user.city + "', '" + user.state + "', '" + user.country + "', '" + user.pincode + "')";
			System.out.println(queryString);
			statement.executeUpdate(queryString);
			//conn.commit();
			return applId;
		}catch(Exception e){System.out.println(e);}
		return 0;
	}
	
	public void InsertUsers(UserInfo user)
	{
		try{
			int userId =Integer.parseInt(GetUniqueUserid()) + 1;
			Statement statement = conn.createStatement();
			//String queryString = "insert into sys_user(USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID) values(userid.nextval,'abhi','abhi','C',to_date('25-11-2017', 'dd-mm-yyyy'),'abhi')";
			String queryString = "insert into sys_user(USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID) values(" + userId + ",'" + user.userName + "','" + user.password +"','" + "C" + "', '" + GetCurrentDate() + "','" + user.userName + "')";
			
			System.out.println(queryString);
			statement.executeUpdate(queryString);
			//conn.commit();
		}catch(Exception e){System.out.println(e);}
		
	}
	
	public void InsertRegistractionDetails(ArrayList<UserInfo> users, String applid, String customerName)
	{
		for(int i = 0; i< 2; i++)
		{
			System.out.println(users.get(i).userName);
			try{
				int custId =Integer.parseInt(GetUniqueCustid()) + 1;
				Statement statement = conn.createStatement();
				String queryString = "insert into customer_details(CUSTOMERID, APPLID, NAME, DOB, CONTACTNO, EMAILID, GENDER, MAKERID, MAKEDATE) values (" + custId + ", " + applid + ", '" + users.get(i).name + "', '" + ConvertToDateFormat(users.get(i).dob) + "', " + users.get(i).contactno + ", '" + users.get(i).userName + "', '" + users.get(i).gender + "', '" + customerName + "', '" + GetCurrentDate() + "')";
				System.out.println(queryString);
				statement.executeUpdate(queryString);
			}catch(Exception e){System.out.println(e);}
		}
		
		
	}
	
	public ArrayList<Product> GetAllProducts()
	{
		ArrayList<Product> dataList = new ArrayList<Product>();
		try
		{
		Statement statement = conn.createStatement();
		   String queryString = "select * from PRODUCTS";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	        	Product data = new Product();
	        	data.setProductId(rs.getString(1));
	        	System.out.println("Product Id - " + rs.getString(1));
	        	data.setProductName(rs.getString(2));
	        	System.out.println("Product Name - " + rs.getString(2));
	        	dataList.add(data);
	        }
		}  catch(Exception e){System.out.println(e);}
		return dataList;
	}
	
	public void InsertGeneralQuestions(GeneralQuestions genQue, String applid, String customerName)
	{
		try{
			int policyDetailId =Integer.parseInt(GetUniquePolicyDetailId()) + 1;
			Statement statement = conn.createStatement();
			
			String queryString = "insert into CUST_POLICY_DETAILS(POLICYID, APPLID, PRODUCTID, AMTREQUESTED, POLICYTERM, FREQUENCY, ANNUAL_INCOME, SMOKE, HEIGHT, WEIGHT, MAKERID, MAKEDATE) values (" + policyDetailId + ", " + applid + ", " + genQue.productId + ", " + genQue.sumassured + ", " + genQue.policyterm + ", '" + genQue.frequency + "', " + genQue.annualincome + ", '" + genQue.smoke + "', '" + genQue.height + "', '" + genQue.weight + "', '" + customerName + "', '" + GetCurrentDate() + "')";
			System.out.println(queryString);
			statement.executeUpdate(queryString);
		}catch(Exception e){System.out.println(e);}
	}
	
	public void InsertMedicalData(ArrayList<MedicalQuestion> data, String applid, String username)
	{
		for(int i = 0; i< data.size(); i++)
		{
			System.out.println(data.get(i).questionNo + " : " + data.get(i).answer);
			try{
				Statement statement = conn.createStatement();
				String queryString = "insert into cust_questions (APPLID, QUESTIONNO, ANSWER, MAKERID, MAKEDATE, TEXT)values (" + applid + ", " + data.get(i).questionNo + ", '" + data.get(i).answer + "', '" + username + "', '" + GetCurrentDate() + "', null)";
				System.out.println(queryString);
				statement.executeUpdate(queryString);
			}catch(Exception e){System.out.println(e);}
		}
		
	}
	
	public void GetSummary()
	{
		
	}
	
	public UserInfo GetUserData(String applid)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select * from global_t where APPLID = " + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	UserInfo user = new UserInfo();
		        	user.userName = rs.getString(2);
		        	user.name = rs.getString(3);
		        	user.dob = rs.getString(4);
		        	user.contactno = rs.getString(5);
		        	user.gender = rs.getString(6);
		        	user.address1 = rs.getString(7);
		        	user.address2 = rs.getString(8);
		        	user.city = rs.getString(9);
		        	user.state = rs.getString(10);
		        	user.country = rs.getString(11);
		        	user.pincode = rs.getString(12);
		           return user;
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public ArrayList<UserInfo> GetRegistractionDetails(String applid)
	{
		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select * from customer_details where APPLID = " + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        if(rs == null)
		        	return null;
		        while (rs.next()) {
		        	UserInfo user = new UserInfo();
		        	System.out.println("Abt to print 3th column");
		        	user.name = rs.getString(3);
		        	System.out.println("Abt to print 4th column");
		        	user.dob = rs.getString(4);
		        	System.out.println("Abt to print 5th column");
		        	user.contactno = rs.getString(5);
		        	System.out.println("Abt to print 6th column");
		        	user.userName = rs.getString(6);
		        	System.out.println("Abt to print 7th column");
		        	user.gender = rs.getString(7);
		        	System.out.println("Abt to print 9th column");
		        	System.out.println(rs.getString(9));
		        	System.out.println(rs.getString(10));
		        	user.customerUsertype = rs.getString(10);
		        	users.add(user);
		        }
		}  catch(Exception e){System.out.println(e);}
		return users;
	}
	
	public GeneralQuestions GetGeneralData(String applid)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select PRODUCTID, AMTREQUESTED, POLICYTERM, FREQUENCY, ANNUAL_INCOME, SMOKE, HEIGHT, WEIGHT, PREV_AMTREQUESTED from cust_policy_details where APPLID = " + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	GeneralQuestions genQue = new GeneralQuestions();
		        	genQue.productId = rs.getString(1);
		        	genQue.sumassured = rs.getString(2);
		        	genQue.policyterm = rs.getString(3);
		        	genQue.frequency = rs.getString(4);
		        	genQue.annualincome = rs.getString(5);
		        	genQue.smoke = rs.getString(6);
		        	genQue.height = rs.getString(7);
		        	genQue.weight = rs.getString(8);
		        	genQue.prevsumassured = rs.getString(9);
		           return genQue;
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public ArrayList<MedicalQuestion> GetMedicalData(String applid)
	{
		ArrayList<MedicalQuestion> data = new ArrayList<MedicalQuestion>();
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select * from cust_questions where APPLID = " + applid;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	MedicalQuestion que = new MedicalQuestion();
		        	que.questionNo = Integer.parseInt(rs.getString(2));
		        	que.answer = rs.getString(3);
		        	que.comments = rs.getString(6);
		        	data.add(que);
		        }
		}  catch(Exception e){System.out.println(e);}
		return data;
	}
	
	String GetCurrentDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public void SubmitApplication(String applid, String flag)
	{
		try
		{
			System.out.println("Application Id =>" + applid);
			CallableStatement callableStatement =  conn.prepareCall("call sp_update_wkflw(?,?,?)");
			
			callableStatement.setInt(1,Integer.parseInt(applid));
			callableStatement.setString(2, flag);
			callableStatement.registerOutParameter(3, Types.VARCHAR);
			
			callableStatement.execute();
			String str = callableStatement.getString(3);
			System.out.println("Out para =>  " + str);
		}catch(Exception e){System.out.println(e);}
		
	}
	
	public UserInfo GetUserTypeOfActiveUser()
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select USERNAME, USERTYPE from sys_user where status = 'true'";
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	UserInfo info = new UserInfo();
		        	info.userName = rs.getString(1);
		        	info.customerUsertype = rs.getString(2);
		           return info;
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String GetApplidByUsername(String username)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select APPLID from global_t where USERNAME = '" + username + "'";
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	return rs.getString(1);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String SetStatusAsInactive()
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "update sys_user s set s.status = 'false'";
			   System.out.println(queryString);
				statement.executeUpdate(queryString);
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String SetStatusAsActive(String username)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "update sys_user s set s.status = 'true' where username = '" + username + "'";
			   System.out.println(queryString);
				statement.executeUpdate(queryString);
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public String GetProductTenureById(int productId)
	{
		try {
			   Statement statement = conn.createStatement();
			   String queryString = "select PRODUCTTENURE from products where productId = " + productId;
			   System.out.println(queryString);
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		        	return rs.getString(1);
		        }
		}  catch(Exception e){System.out.println(e);}
		return null;
	}
	
	public ArrayList<ViewPolicyData> GetAllVerificationPendingApplications(String stageName)
	{
		ArrayList<ViewPolicyData> dataList = new ArrayList<ViewPolicyData>();
		try
		{
			System.out.println("Executing SQL statement.....");
		Statement statement = conn.createStatement();
		String queryString = "select g.applid,g.name,p.productdesc,s.stagedesc, w.isverified,c.remarks from global_t g, workflow_Stage w,cust_policy_details c,products p,stage s where g.applid = w.applid and g.applid = c.applid and p.productid = c.productid and w.stage = s.stage and s.stage = '" + stageName + "' and w.stagestatus = 'P'";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	        	ViewPolicyData data = new ViewPolicyData();
	        	data.setApplicationId(rs.getString(1));
	        	data.setCustomerName(rs.getString(2));
	        	data.setProductName(rs.getString(3));
	        	data.setStageDesc(rs.getString(4));
	        	data.setIsVerified(rs.getString(5));
	        	data.setRemarks(rs.getString(6));
	        	data.setAppStatus("");
	    		dataList.add(data);
	           System.out.println("In SQL setIsVerified" + rs.getString(5));
	        }
		}  catch(Exception e){System.out.println(e);}
		return dataList;
	}
	
	public ArrayList<ViewPolicyData> GetCustViewApplicationByApplid(String applid)
	{
		ArrayList<ViewPolicyData> dataList = new ArrayList<ViewPolicyData>();
		try
		{
			System.out.println("Executing SQL statement.....");
		Statement statement = conn.createStatement();
		String queryString = "select g.applid,g.name,p.productdesc,s.stagedesc, w.isverified,c.remarks,'P' from global_t g, workflow_Stage w,cust_policy_details c,products p,stage s where g.applid = w.applid and g.applid = c.applid and p.productid = c.productid and w.stage = s.stage and s.stage = 'CUSTENTRY' and w.stagestatus = 'P' and g.applid = " + applid + " union select g.applid,g.name,p.productdesc,s.stagedesc, w.isverified,c.remarks,'R' from global_t g, workflow_Stage w,cust_policy_details c,products p,stage s where g.applid = w.applid and g.applid = c.applid and p.productid = c.productid and w.stage = s.stage and s.stage = 'CUSTENTRY' and w.stagestatus = 'J' and g.applid = " + applid;
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	        	ViewPolicyData data = new ViewPolicyData();
	        	data.setApplicationId(rs.getString(1));
	        	data.setCustomerName(rs.getString(2));
	        	data.setProductName(rs.getString(3));
	        	data.setStageDesc(rs.getString(4));
	        	data.setIsVerified(rs.getString(5));
	        	data.setRemarks(rs.getString(6));
	        	data.setAppStatus(rs.getString(7));
	    		dataList.add(data);
	           System.out.println("In SQL setIsVerified" + rs.getString(5));
	        }
		}  catch(Exception e){System.out.println(e);}
		return dataList;
	}
	
	/*public ArrayList<ViewPolicyData> GetCustViewApplicationByApplid(String applid)
	{
		ArrayList<ViewPolicyData> dataList = new ArrayList<ViewPolicyData>();
		try
		{
			System.out.println("Executing SQL statement.....");
		Statement statement = conn.createStatement();
		String queryString = "select g.applid,g.name,p.productdesc,s.stagedesc, w.isverified,c.remarks from global_t g, workflow_Stage w,cust_policy_details c,products p,stage s where g.applid = w.applid and g.applid = c.applid and p.productid = c.productid and w.stage = s.stage and s.stage = 'CUSTENTRY' and w.stagestatus = 'P' and g.applid = " + applid;
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	        	ViewPolicyData data = new ViewPolicyData();
	        	data.setApplicationId(rs.getString(1));
	        	data.setCustomerName(rs.getString(2));
	        	data.setProductName(rs.getString(3));
	        	data.setStageDesc(rs.getString(4));
	        	data.setIsVerified(rs.getString(5));
	        	data.setRemarks(rs.getString(6));
	    		dataList.add(data);
	           System.out.println("In SQL setIsVerified" + rs.getString(5));
	        }
		}  catch(Exception e){System.out.println(e);}
		return dataList;
	}*/
	
	public ArrayList<PaymentSchedule> GetScheduleGraphInfoByApplid(String applid)
	{
		ArrayList<PaymentSchedule> dataList = new ArrayList<PaymentSchedule>();
		try
		{
			System.out.println("Executing SQL statement.....");
		Statement statement = conn.createStatement();
		String queryString = "select * from CUST_POLICY_SCH where applid = " + applid;
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	        	PaymentSchedule data = new PaymentSchedule();
	        	data.applid = rs.getString(2);
	        	data.dueDate = rs.getString(3);
	        	data.installmentNo = rs.getString(4);
	        	data.dueAmount = rs.getString(5);
	        	data.paidAmount = rs.getString(6);
	        	data.paidFlag = rs.getString(7);
	    		dataList.add(data);
	           System.out.println("In SQL setIsVerified" + rs.getString(5));
	        }
		}  catch(Exception e){System.out.println(e);}
		return dataList;
	}
	
	public void VerifyApplication(String applid)
	{
		try{
			Statement statement = conn.createStatement();
			
			String queryString = "update workflow_stage s set s.isverified = 'T' where s.applid = " + applid;
			System.out.println(queryString);
			statement.executeUpdate(queryString);
		}catch(Exception e){System.out.println(e);}
	}
	
	void UpdateSumAssured(String applid, String oldSumAssured, float newSumAssured)
	{
		try{
			Statement statement = conn.createStatement();
			String queryString = "update cust_policy_details c set c.prev_amtrequested = " + oldSumAssured + " ,c.amtrequested = " + newSumAssured + " where applid = " + applid;
			System.out.println(queryString);
			statement.executeUpdate(queryString);
		}catch(Exception e){System.out.println(e);}
	}
	
	void UpdatePolicyDescription(String applid, String description)
	{
		try{
			Statement statement = conn.createStatement();
			
			String queryString = "update cust_policy_details c set c.remarks = '" + description + "' where applid = " + applid;
			System.out.println(queryString);
			statement.executeUpdate(queryString);
		}catch(Exception e){System.out.println(e);}
	}
	
	public String SubmitPayment(String applid, String amount)
	{
		try
		{
			System.out.println("Application Id =>" + applid);
			CallableStatement callableStatement =  conn.prepareCall("call sp_payment_sch(?,?,?)");
			
			callableStatement.setInt(1,Integer.parseInt(applid));
			callableStatement.setInt(2,Integer.parseInt(amount));
			callableStatement.registerOutParameter(3, Types.VARCHAR);
			
			callableStatement.execute();
			String str = callableStatement.getString(3);
			System.out.println("Out para =>  " + str);
			return str;
		}catch(Exception e){System.out.println(e);}
		return null;
	}
	
	String GetUniqueUserid()
	{
		try
		{
		Statement statement = conn.createStatement();
		   String queryString = "select * from sys_user ORDER BY UserId DESC";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	           return rs.getString(1);
	        }
		}  catch(Exception e){System.out.println(e);}
		return "0";
	}
	
	String GetUniqueApplid()
	{
		try
		{
		Statement statement = conn.createStatement();
		   String queryString = "select * from global_t ORDER BY APPLID DESC";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	           return rs.getString(1);
	        }
		}  catch(Exception e){System.out.println(e);}
		return "0";
	}
	
	String GetUniqueCustid()
	{
		try
		{
		Statement statement = conn.createStatement();
		   String queryString = "select * from customer_details ORDER BY CUSTOMERID DESC";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	           return rs.getString(1);
	        }
		}  catch(Exception e){System.out.println(e);}
		return "0";
	}
	
	String GetUniquePolicyDetailId()
	{
		try
		{
		Statement statement = conn.createStatement();
		   String queryString = "select * from CUST_POLICY_DETAILS ORDER BY POLICYID DESC";
		   System.out.println(queryString);
	        ResultSet rs = statement.executeQuery(queryString);
	        while (rs.next()) {
	           return rs.getString(1);
	        }
		}  catch(Exception e){System.out.println(e);}
		return "0";
	}
	
	/*public boolean ValidateCredentials(String username1, String password1)
	{
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcle";
			String username = "c##vinit";
			String password = "1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
			   Statement statement = conn.createStatement();
		        String queryString = "select * from sys_user where username='"+username1+"' AND password = '"+ password1 + "'";
		        ResultSet rs = statement.executeQuery(queryString);
		        while (rs.next()) {
		           System.out.println(rs.getString(2));
		           return true;
		        }
			   
		}  catch(Exception e){System.out.println(e);}
		return false;
	}*/
}
