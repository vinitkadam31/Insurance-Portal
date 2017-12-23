package webapp;
import java.util.ArrayList;

import models.MedicalQuestion;
import models.PaymentSchedule;
import models.PolicyData;
import models.Product;
import models.UserInfo;
import models.ViewPolicyData;

public class HelperClass {
	DBConectivity connectivity;
	public HelperClass()
	{
		connectivity = new DBConectivity();
	}
	
	public ArrayList<Product> GetAllProducts()
	{
		return connectivity.GetAllProducts();
	}
	
	public ArrayList<ViewPolicyData> GetAllPolicies()
	{
		System.out.println("GetAllPolicies Initiate");
		UserInfo user = connectivity.GetUserTypeOfActiveUser();
		String stageName = "NOTHING";
		String applid = "0";
		switch(user.customerUsertype)
		{
			case "VER":
			case "E":
				stageName = "VERIFY";
				break;
				
			case "L1MEDAPPR":
				stageName = "L1MED";
				break;
				
			case "L1NMEDAPPR":
				stageName = "L1NONMED";
				break;
				
			case "ISSUE":
				stageName = "ISSUE";
				break;
				
			case "PAY":
				stageName = "PAY";
				break;
				
			case "C":
				stageName = "CUSTENTRY";
				applid = connectivity.GetApplid(user.userName);
				break;
		}
		System.out.println("GetAllPolicies usertype = " + user.customerUsertype + ", stage name = " + stageName);
		if(stageName.equalsIgnoreCase("CUSTENTRY"))
			return connectivity.GetCustViewApplicationByApplid(applid);
		else
			return connectivity.GetAllVerificationPendingApplications(stageName);
		/*ArrayList<ViewPolicyData> dataList = new ArrayList<ViewPolicyData>();
		ViewPolicyData temp = new ViewPolicyData();
		temp.setApplicationId("12");
		temp.setCustomerName("Vinit Kadam");
		temp.setProductName("100000");
		dataList.add(temp);
		
		temp = new ViewPolicyData();
		temp.setProductName("100005");
		dataList.add(temp);
		
		temp = new ViewPolicyData();
		temp.setProductName("100010");
		dataList.add(temp);
		
		return dataList;*/
	}
	
	public ArrayList<PaymentSchedule> GetScheduleGraphInfo()
	{
		UserInfo user = connectivity.GetUserTypeOfActiveUser();
		String applid = connectivity.GetApplid(user.userName);
		return connectivity.GetScheduleGraphInfoByApplid(applid);
		/*ArrayList<PaymentSchedule> dataList = new ArrayList<PaymentSchedule>();
		PaymentSchedule temp = new PaymentSchedule();
		temp.dueDate = "10/10/2017";
		temp.dueAmount = "10000";
		temp.paidAmount = "10000";
		temp.paidFlag = "Y";
		dataList.add(temp);
		
		temp.dueDate = "10/10/2018";
		temp.dueAmount = "20000";
		temp.paidAmount = "5000";
		temp.paidFlag = "N";
		dataList.add(temp);
		
		temp.dueDate = "10/10/2019";
		temp.dueAmount = "10000";
		temp.paidAmount = "10000";
		temp.paidFlag = "N";
		dataList.add(temp);
		
		return dataList;*/
	}
	
	public MedicalQuestion CreateMedicalQuestionObject(int questionNo, String answer)
	{
		MedicalQuestion que = new MedicalQuestion();
		que.questionNo = questionNo;
		que.answer = answer;
		System.out.println(questionNo + " - " + answer);
		return que;
	}
}
