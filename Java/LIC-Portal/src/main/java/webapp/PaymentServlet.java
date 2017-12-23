package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In payment servlet page => " + request.getParameter("usertype"));
		request.setAttribute("usertype", request.getParameter("usertype"));
		request.setAttribute("applid", request.getParameter("applid"));
		request.setAttribute("customername", request.getParameter("customername"));
		request.getRequestDispatcher("WEB-INF/views/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String usertype = request.getParameter("usertype");
		String applid = request.getParameter("applid");
		String amount = request.getParameter("amount");
		String customername = request.getParameter("customername");
		request.setAttribute("usertype", usertype);
		String message = connectivity.SubmitPayment(applid, amount);
		
		if(message.equalsIgnoreCase("s"))
		{
			response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
		}
		else
		{
			response.sendRedirect("/viewpolicy.do?usertype=" + usertype + "&applid=" + applid + "&customername=" + customername + "&message=" + message);
		}
		
		// INsert payment info in database
		
	}

}
