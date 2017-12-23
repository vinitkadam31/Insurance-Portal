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
 * Servlet implementation class PaymentScheduleServlet
 */
@WebServlet("/paymentschedule.do")
public class PaymentScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String applid = request.getParameter("applid");
		String showgraph = request.getParameter("showgraph");
		System.out.println("In payment schedule doGet applid =>" + applid + ", showgraph=>" + showgraph);
		request.setAttribute("applid", applid);
		request.setAttribute("showgraph", showgraph);
		request.setAttribute("message", request.getParameter("message"));
		request.getRequestDispatcher("WEB-INF/views/paymentschedule.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String applid = request.getParameter("applid");
		String showgraph = request.getParameter("showgraph");
		GeneralQuestions questions = connectivity.GetGeneralData(applid);
		System.out.println("Hello");
		int frequencyInt = 0;
		String frequency = "";
		if(questions.frequency.equalsIgnoreCase("M"))
		{
			frequencyInt = 1;
			frequency = "Monthly";
		}
		else if(questions.frequency.equalsIgnoreCase("Q"))
		{
			frequencyInt = 3;
			frequency = "Quaterly";
		}
		else if(questions.frequency.equalsIgnoreCase("H"))
		{
			frequencyInt = 6;
			frequency = "Half-yearly";
		}
		else if(questions.frequency.equalsIgnoreCase("Y"))
		{
			frequencyInt = 12;
			frequency = "Yearly";
		}
		System.out.println("questions.sumassured: "+ questions.sumassured + ", term:"+ questions.policyterm + ",frequency" + frequencyInt);
		
		float installmentAmt = Rules.installment(Float.valueOf(questions.sumassured), Float.valueOf(questions.policyterm), Float.valueOf(frequencyInt));
		String message = frequency +" Installment is " + installmentAmt + " for " + questions.policyterm + " year";
		//Monthly Installment is temp for year
		//request.setAttribute("usertype", usertype);
		request.setAttribute("applid", applid);
		request.setAttribute("message", message);
		response.sendRedirect("/paymentschedule.do?applid=" + applid + "&showgraph="+ showgraph + "&message="+ message);
	}

}
