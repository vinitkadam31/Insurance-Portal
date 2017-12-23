package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditPolicyDetailsServlet
 */
@WebServlet("/editpolicydetails.do")
public class EditPolicyDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPolicyDetailsServlet() {
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
		request.setAttribute("policy", request.getParameter("policy"));
		request.setAttribute("sumassured", request.getParameter("sumassured"));
		request.setAttribute("policyterm", request.getParameter("policyterm"));
		request.setAttribute("frequency", request.getParameter("frequency"));
		request.setAttribute("annualincome", request.getParameter("annualincome"));
		request.setAttribute("smoke", request.getParameter("smoke"));
		request.setAttribute("weight", request.getParameter("weight"));
		request.setAttribute("Height", request.getParameter("Height"));
		request.getRequestDispatcher("WEB-INF/views/generalquestions.jsp").forward(request, response);
	}

}
