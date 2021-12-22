package util02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class danSeverlet01
 */
@WebServlet("/danSeverlet01")
public class danSeverlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public danSeverlet01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String dan=req.getParameter("dan");
		String outstr="";
		if(dan==null) {
			outstr="No dan number.";
		} else {
			int num1=Integer.parseInt(dan);
			
			for(int i=1; i<10; i++) {
				outstr+=num1+"x"+i+"="+(num1*i)+"<br>"; 
			}
		}
		
		PrintWriter out=response.getWriter();
		out.println("<html><head><title>gugudan</title><body>");
		out.println(outstr);
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
