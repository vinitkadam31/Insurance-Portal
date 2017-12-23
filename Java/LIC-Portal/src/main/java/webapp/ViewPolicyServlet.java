package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewPolicyServlet
 */
@WebServlet(urlPatterns = "/viewpolicy.do")
public class ViewPolicyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPolicyServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println(request.getParameter("usertype1"));
		System.out.println("In View policy servlet page ie. verify doGet => " + request.getParameter("usertype"));
		request.setAttribute("usertype", request.getParameter("usertype"));
		request.getRequestDispatcher("WEB-INF/views/viewpolicy.jsp").forward(request, response);
		//request.getRequestDispatcher("forms/viewpolicy.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String applid = request.getParameter("applid");
		String customerName = request.getParameter("customername");
		String usertype = request.getParameter("usertype");
		String description = request.getParameter("description");
		connectivity.UpdatePolicyDescription(applid, description);
		System.out.println("Policy description updated successfully");
		
		connectivity.VerifyApplication(applid);
		System.out.println("Usertype in verify "+ usertype);
		request.setAttribute("usertype", usertype);
		response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
		//request.getRequestDispatcher("WEB-INF/views/viewpolicy.jsp").forward(request, response);
	}

}
