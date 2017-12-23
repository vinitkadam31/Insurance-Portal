package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApproveApplicationServlet
 */
@WebServlet("/approveapplication.do")
public class ApproveApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveApplicationServlet() {
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
		String applid = request.getParameter("applid");
		String usertype = request.getParameter("usertype");
		System.out.println("Approve application i.e. submit");
		connectivity.SubmitApplication(applid, "U");
		request.setAttribute("usertype", usertype);
		response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
