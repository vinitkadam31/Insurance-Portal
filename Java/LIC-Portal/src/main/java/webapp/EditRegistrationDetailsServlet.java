package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditRegistrationDetailsServlet
 */
@WebServlet(urlPatterns = "/editregistrationdetails.do")
public class EditRegistrationDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRegistrationDetailsServlet() {
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
		request.setAttribute("sameproposer", request.getParameter("sameproposer"));
		request.setAttribute("namepr", request.getParameter("namepr"));
		request.setAttribute("emailpr", request.getParameter("emailpr"));
		request.setAttribute("dobpr", request.getParameter("dobpr"));
		request.setAttribute("contactpr", request.getParameter("contactpr"));
		request.setAttribute("genderpr", request.getParameter("genderpr"));
		
		request.setAttribute("samepayer", request.getParameter("samepayer"));
		request.setAttribute("namepa", request.getParameter("namepa"));
		request.setAttribute("emailpa", request.getParameter("emailpa"));
		request.setAttribute("dobpa", request.getParameter("dobpa"));
		request.setAttribute("contactpa", request.getParameter("contactpa"));
		request.setAttribute("genderpa", request.getParameter("genderpa"));
		
		request.getRequestDispatcher("WEB-INF/views/registerdetails.jsp").forward(request, response);
	}

}
