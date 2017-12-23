package webapp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UserInfo;

/**
 * Servlet implementation class RegistrationDetailsServlet
 */
@WebServlet("/registrationDetails.do")
public class RegistrationDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationDetailsServlet() {
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
		request.getRequestDispatcher("WEB-INF/views/registerdetails.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		
		String sameProposer = request.getParameter("sameproposer");
		String applid = request.getParameter("applid");
		if(sameProposer.equalsIgnoreCase("yes"))
		{
			UserInfo user = connectivity.GetUserData(applid);
			users.add(user);
		}
		else
		{
			UserInfo user = new UserInfo();
			user.sameProposer = request.getParameter("sameproposer");
			user.name = request.getParameter("namepr");
			
			user.userName = request.getParameter("emailpr");
			user.dob = request.getParameter("dobpr");
			user.contactno = request.getParameter("contactpr");
			user.gender = request.getParameter("genderpr");
			user.customerUsertype = "pr";
			users.add(user);
		}
		String samePayer = request.getParameter("samepayer");
		if(samePayer.equalsIgnoreCase("yes"))
		{
			UserInfo user = connectivity.GetUserData(applid);
			users.add(user);
		}
		else
		{
			UserInfo user = new UserInfo();
			user.name = request.getParameter("namepa");
			user.userName = request.getParameter("emailpa");
			user.dob = request.getParameter("dobpa");
			user.contactno = request.getParameter("contactpa");
			user.gender = request.getParameter("genderpa");
			user.customerUsertype = "pa";
			users.add(user);
		}
		
		String customerName = request.getParameter("customername");
		connectivity.InsertRegistractionDetails(users, applid, customerName);
		request.setAttribute("customername", customerName);
		request.setAttribute("applid", applid);
		System.out.println("In register detail servlet page and applid = " + request.getParameter("applid"));
		
		request.getRequestDispatcher("WEB-INF/views/generalquestions.jsp").forward(request, response);
	}

}
