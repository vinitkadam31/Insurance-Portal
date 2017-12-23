package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditMedicalDetailServlet
 */
@WebServlet("/editmedicaldetails.do")
public class EditMedicalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMedicalDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("tobacco", request.getParameter("tobacco"));
		request.setAttribute("heartdiseases", request.getParameter("heartdiseases"));
		request.setAttribute("diabetes", request.getParameter("diabetes"));
		request.setAttribute("cancer", request.getParameter("cancer"));
		request.setAttribute("cerebralvasculardisease", request.getParameter("cerebralvasculardisease"));
		request.setAttribute("hepatitis", request.getParameter("hepatitis"));
		request.setAttribute("alcoholtreatment", request.getParameter("alcoholtreatment"));
		request.setAttribute("depressiontreatment", request.getParameter("depressiontreatment"));
		request.setAttribute("abnormallabs", request.getParameter("abnormallabs"));
		request.setAttribute("gastrointestinal", request.getParameter("gastrointestinal"));
		request.setAttribute("prescriptionmedications", request.getParameter("prescriptionmedications"));
		request.setAttribute("deathincidence", request.getParameter("deathincidence"));
		request.setAttribute("recklessdriving", request.getParameter("recklessdriving"));
		request.setAttribute("accidents", request.getParameter("accidents"));
		request.setAttribute("traveledoutside", request.getParameter("traveledoutside"));
		request.setAttribute("acchazardousactivitiesidents", request.getParameter("acchazardousactivitiesidents"));
		request.getRequestDispatcher("WEB-INF/views/medicalquestion.jsp").forward(request, response);
	}

}
