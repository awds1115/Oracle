package util01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
/**
 * Servlet implementation class PlusServlet01
 */
@WebServlet("/PlusServlet01")
public class PlusServlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlusServlet01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// web brower에 한글을 표시하는 법 
		response.setContentType("text/html; charset=utf-8");
		
		//getParameter 를 사용해서 주소창에 키=밸류 값을 줄수있도록 만든다.
		String str1=req.getParameter("num1");
		String str2=req.getParameter("num2");
//		// getParameter로 받은 값들을 숫자로 바꾼 후 add 한다.
//		// 주소창엔 String(문자열)밖에 들어 갈 수 없기 때문 
//	
		int num1=Integer.parseInt(str1);
		int num2=Integer.parseInt(str2);
		int add=num1*num2;
		String outstr="<html><head><title>Plus</title></head><body>"+num1+"x"+num2+"="+add+"</body></html>";
		PrintWriter out=response.getWriter();
//		out.println("<html><head><title>Plus</title></head>");
//		out.println("<body>");
//		out.println(num1+"+"+num2+"="+add);
//		out.println("</body></html>");
		out.println(outstr);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
