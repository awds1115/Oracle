package util01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class number
 */
@WebServlet("/number")
public class number extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public number() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// 한글을 사용하게 해주는 코드 중요***
		response.setContentType("text/html; charset=utf-8");
		String str1=req.getParameter("num1");
		String str2=req.getParameter("num2");
		String str3=req.getParameter("num3");
		int num1=Integer.parseInt(str1);
		int num2=Integer.parseInt(str2);
		int num3=Integer.parseInt(str3);
		req.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<html><head><title>gegege</title><body>");
	    int x1=(int) ((-num2)+(Math.sqrt(Math.pow(num2,2)-(4*(num1*num3)))))/(2*num1);
	    int x2=(int) ((-num2)-(Math.sqrt(Math.pow(num2,2)-(4*(num1*num3)))))/(2*num1);
	    out.println("엑스일 =" +x1+"<br>"+"엑스이 =" +x2);
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
