package webapp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.MedicalQuestion;
import models.UserInfo;

/**
 * Servlet implementation class MedicalQuestionsServlet
 */
@WebServlet("/medicalquestions.do")
public class MedicalQuestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
	HelperClass hlp;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicalQuestionsServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
        hlp = new HelperClass();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("WEB-INF/views/medicalquestions.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<MedicalQuestion> data = new ArrayList<MedicalQuestion>();
		MedicalQuestion que = new MedicalQuestion();
		
		int counter = 1;
		String tobacco = request.getParameter("tobacco");
		data.add(hlp.CreateMedicalQuestionObject(counter, tobacco));
		
		counter++;
		String heartdiseases = request.getParameter("heartdiseases");
		data.add(hlp.CreateMedicalQuestionObject(counter, heartdiseases));
		
		counter++;
		String diabetes = request.getParameter("diabetes");
		data.add(hlp.CreateMedicalQuestionObject(counter, diabetes));
		
		counter++;
		String cancer = request.getParameter("cancer");
		data.add(hlp.CreateMedicalQuestionObject(counter, cancer));
		
		counter++;
		String cerebralvasculardisease = request.getParameter("cerebralvasculardisease");
		data.add(hlp.CreateMedicalQuestionObject(counter, cerebralvasculardisease));

		counter++;
		String hepatitis = request.getParameter("hepatitis");
		data.add(hlp.CreateMedicalQuestionObject(counter, hepatitis));
		
		counter++;
		String alcoholtreatment = request.getParameter("alcoholtreatment");
		data.add(hlp.CreateMedicalQuestionObject(counter, alcoholtreatment));
		
		counter++;
		String depressiontreatment = request.getParameter("depressiontreatment");
		counter++;data.add(hlp.CreateMedicalQuestionObject(counter, depressiontreatment));
		
		counter++;
		String abnormallabs = request.getParameter("abnormallabs");
		data.add(hlp.CreateMedicalQuestionObject(counter, abnormallabs));
		
		counter++;
		String gastrointestinal = request.getParameter("gastrointestinal");
		data.add(hlp.CreateMedicalQuestionObject(counter, gastrointestinal));
		
		counter++;
		String prescriptionmedications = request.getParameter("prescriptionmedications");
		data.add(hlp.CreateMedicalQuestionObject(counter, prescriptionmedications));
		
		counter++;
		String deathincidence = request.getParameter("deathincidence");
		data.add(hlp.CreateMedicalQuestionObject(counter, deathincidence));
		
		counter++;
		String recklessdriving = request.getParameter("recklessdriving");
		data.add(hlp.CreateMedicalQuestionObject(counter, recklessdriving));
		
		counter++;
		String accidents = request.getParameter("accidents");
		data.add(hlp.CreateMedicalQuestionObject(counter, accidents));
		
		counter++;
		String traveledoutside = request.getParameter("traveledoutside");
		data.add(hlp.CreateMedicalQuestionObject(counter, traveledoutside));
		
		counter++;
		String hazardousactivities = request.getParameter("hazardousactivities");
		data.add(hlp.CreateMedicalQuestionObject(counter, hazardousactivities));
		
		//connectivity.GetSummary();
		
		//TODO: Delete this
		/*request.setAttribute("name", "Shri");
		request.setAttribute("email", "Shri@binghamton");
		request.setAttribute("dob", "10/12/2014");
		request.setAttribute("contact", "12212");
		request.setAttribute("gender", "Male");
		
		request.setAttribute("sameproposer", "no");
		request.setAttribute("namepr", "Vinit");
		request.setAttribute("emailpr", "Vinit@binghamton");
		request.setAttribute("dobpr", "11/06/2014");
		request.setAttribute("contactpr", "12212");
		request.setAttribute("genderpr", "Male");
		
		request.setAttribute("samepayer", "no");
		request.setAttribute("namepa", "Kedar");
		request.setAttribute("emailpa", "Kedar@binghamton");
		request.setAttribute("dobpa", "09/05/2014");
		request.setAttribute("contactpa", "12212");
		request.setAttribute("genderpa", "Male");*/
		
		String applid = request.getParameter("applid");
		String customerName = request.getParameter("customername");
		connectivity.InsertMedicalData(data, applid, customerName);
		request.setAttribute("customername", customerName);
		request.setAttribute("applid", applid);
		
		response.sendRedirect("/summary.do?applid=" + applid + "&customername=" + customerName + "&newapplication=true");
		//request.getRequestDispatcher("WEB-INF/views/summary.jsp").forward(request, response);
		//doGet(request, response);
	}

}
