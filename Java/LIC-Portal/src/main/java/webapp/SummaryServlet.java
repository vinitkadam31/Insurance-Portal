package webapp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Scala.Rules;
import models.GeneralQuestions;
import models.MedicalQuestion;
import models.UserInfo;

/**
 * Servlet implementation class SummaryServlet
 */
@WebServlet("/summary.do")
public class SummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SummaryServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("In summary servlet doGet customer name=> ");
		System.out.println(request.getParameter("customername"));
		String applid = request.getParameter("applid");
		String customerName = request.getParameter("customername");
		String isEmployee = request.getParameter("isemployee");
		String usertype = request.getParameter("usertype");
		
		//TODO: Delete this
		UserInfo user = connectivity.GetUserData(applid);
		request.setAttribute("name", user.name);
		request.setAttribute("email", user.userName);
		request.setAttribute("dob", user.dob);
		request.setAttribute("contact", user.contactno);
		request.setAttribute("gender", user.gender);
		request.setAttribute("address1", user.address1);
		request.setAttribute("address2", user.address2);
		request.setAttribute("city", user.city);
		request.setAttribute("state", user.state);
		request.setAttribute("country", user.country);
		request.setAttribute("pincode", user.pincode);
		
		ArrayList<UserInfo> users = connectivity.GetRegistractionDetails(applid);
		if(users.size() == 2 )
		{
			request.setAttribute("sameproposer", "no");
			request.setAttribute("namepr",users.get(0).name);
			request.setAttribute("emailpr", users.get(0).userName);
			request.setAttribute("dobpr", users.get(0).dob);
			request.setAttribute("contactpr", users.get(0).contactno);
			request.setAttribute("genderpr", users.get(0).gender);
			
			request.setAttribute("samepayer", "no");
			request.setAttribute("namepa", users.get(1).name);
			request.setAttribute("emailpa", users.get(1).userName);
			request.setAttribute("dobpa", users.get(1).dob);
			request.setAttribute("contactpa", users.get(1).contactno);
			request.setAttribute("genderpa", users.get(1).gender);
		}
		
		GeneralQuestions genQue = connectivity.GetGeneralData(applid);
		request.setAttribute("policy", genQue.productId);
		request.setAttribute("sumassured", genQue.sumassured);
		request.setAttribute("policyterm", genQue.policyterm);
		request.setAttribute("frequency", genQue.frequency);
		request.setAttribute("annualincome", genQue.annualincome);
		request.setAttribute("smoke", genQue.smoke);
		request.setAttribute("weight", genQue.weight);
		request.setAttribute("height", genQue.height);
		request.setAttribute("oldsumassured", genQue.prevsumassured);
		
		ArrayList<MedicalQuestion> medQue = connectivity.GetMedicalData(applid);
		int yesCount = 0;
		String yesnoString = "";
		if(medQue.size() != 0)
		{
			String answer = medQue.get(0).answer;
			request.setAttribute("tobacco", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(1).answer;
			request.setAttribute("heartdiseases", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(2).answer;
			request.setAttribute("diabetes", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(3).answer;
			request.setAttribute("cancer", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(4).answer;
			request.setAttribute("cerebralvasculardisease", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(5).answer;
			request.setAttribute("hepatitis", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(6).answer;
			request.setAttribute("alcoholtreatment", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(7).answer;
			request.setAttribute("depressiontreatment", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(8).answer;
			request.setAttribute("abnormallabs", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(9).answer;
			request.setAttribute("gastrointestinal", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(10).answer;
			request.setAttribute("prescriptionmedications", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(11).answer;
			request.setAttribute("deathincidence", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(12).answer;
			request.setAttribute("recklessdriving", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(13).answer;
			request.setAttribute("accidents", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(14).answer;
			request.setAttribute("traveledoutside", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
			
			answer = medQue.get(15).answer;
			request.setAttribute("hazardousactivities", answer);
			if(answer.equalsIgnoreCase("yes"))
			{
				yesCount++;
				yesnoString = yesnoString + "1";
			}
			else
				yesnoString = yesnoString + "0";
		}
		
		request.setAttribute("customername", customerName);
		request.setAttribute("applid", applid);
		request.setAttribute("isemployee", isEmployee);
		request.setAttribute("usertype", usertype);
		request.setAttribute("yesCount", yesCount);
		request.setAttribute("yesnoString", yesnoString);
		request.setAttribute("newapplication", request.getParameter("newapplication"));
		request.getRequestDispatcher("WEB-INF/views/summary.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//Submit Application
		String applid = request.getParameter("applid");
		String customerName = request.getParameter("customername");
		String actiontype = request.getParameter("actiontype");
		String usertype = request.getParameter("usertype");
		String flag;
		
		if(actiontype.equalsIgnoreCase("recalculate"))
		{
			//String yesCount = request.getParameter("yesCount");
			String yesnoString = request.getParameter("yesnoString");
			String oldsumassured = request.getParameter("oldsumassured");
			//calculate new amount
			//request.setAttribute("newsumassured", "100000");
			String sumassured = request.getParameter("hdnsumassured");
			System.out.println("oldsumassured: " + oldsumassured + ", hdnsumassured: " + sumassured);
			
			System.out.println("YesNoString: " + yesnoString + ", old: " + sumassured);
			float newsumassured = Rules.RecalculateAmt(yesnoString, Float.parseFloat(sumassured));
			//String newsumassured = "100000";
			connectivity.UpdateSumAssured(applid, sumassured, newsumassured);
			
			response.sendRedirect("/summary.do?applid=" + applid + "&customername=" + customerName + "&newsumassured=" + newsumassured + "&usertype=" + usertype);
		}
		else
		{
			if(actiontype.equalsIgnoreCase("submit"))
				flag = "U";
			else if(actiontype.equalsIgnoreCase("hold"))
				flag = "H";
			else
				flag = "R";
			
			System.out.println("Submit application");
			connectivity.SubmitApplication(applid, flag);
			if(flag == "U")
			{
				request.setAttribute("applicationsubmit", "true");	
				request.getRequestDispatcher("WEB-INF/views/home.jsp").forward(request, response);
			}
			else
			{
				response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
			}
		}
	}

}
