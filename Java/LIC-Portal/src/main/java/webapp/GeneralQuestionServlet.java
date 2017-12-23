package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Scala.Rules;
import models.GeneralQuestions;

/**
 * Servlet implementation class GeneralQuestionServlet
 */
@WebServlet("/generalquestions.do")
public class GeneralQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/views/generalquestions.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		GeneralQuestions genQue = new GeneralQuestions();
		genQue.productId = request.getParameter("policy");
		genQue.sumassured = request.getParameter("sumassured");
		genQue.policyterm = request.getParameter("policyterm");
		genQue.frequency = request.getParameter("frequency");
		
		genQue.annualincome = request.getParameter("annualincome");
		genQue.smoke = request.getParameter("smoke");
		genQue.weight = request.getParameter("weight");
		genQue.height = request.getParameter("height");
		String applid = request.getParameter("applid");
		String customerName = request.getParameter("customername");
		System.out.println("Policy: " + genQue.productId + ", Frequency: " + genQue.frequency);
		System.out.println(genQue.sumassured + ", " + genQue.policyterm + ", " + genQue.annualincome + ", " + genQue.smoke + ", " + genQue.weight + ", " + genQue.height);
		//Validation
		boolean isError = false;
		String errorMessage = "";
		if((Rules.isStringEmpty(genQue.sumassured)  || Rules.isStringEmpty(genQue.policyterm) || Rules.isStringEmpty(genQue.annualincome) || Rules.isStringEmpty(genQue.smoke) || Rules.isStringEmpty(genQue.weight) || Rules.isStringEmpty(genQue.height)))
		{
			isError = true;
			errorMessage = "Please fill all required fields";
		}
		
		if(!isError && genQue.productId.equalsIgnoreCase("-1"))
		{
			isError = true;
			errorMessage = "Please select appropriate policy";
		}
		
		if(!isError && genQue.frequency.equalsIgnoreCase("s"))
		{
			isError = true;
			errorMessage = "Please select appropriate frequency";
		}
		
		String tenure = connectivity.GetProductTenureById(Integer.parseInt(genQue.productId));
		if(!isError && !Rules.insuranceAmountCheck(Integer.parseInt(genQue.sumassured), Integer.parseInt(genQue.annualincome)))
		{
			//Error message annual income is not enough for this policy
			errorMessage = "Annual income is not enough for this policy";
			isError = true;
		}
		
		if(!isError && !Rules.isProductIdYear(Integer.parseInt(genQue.productId), Integer.parseInt(tenure), Integer.parseInt(genQue.policyterm)))
		{
			//Error message Policy term should be less than tenure
			errorMessage = "Policy term should be less than tenure";
			isError = true;
		}
		
		if(isError)
		{
			request.setAttribute("customername", customerName);
			request.setAttribute("applid", applid);
			request.setAttribute("message", errorMessage);
			request.getRequestDispatcher("WEB-INF/views/generalquestions.jsp").forward(request, response);
		}
		else
		{
			connectivity.InsertGeneralQuestions(genQue, applid, customerName);
			request.setAttribute("customername", customerName);
			request.setAttribute("applid", applid);
			
			request.getRequestDispatcher("WEB-INF/views/medicalquestions.jsp").forward(request, response);
		}
		
	}

}
