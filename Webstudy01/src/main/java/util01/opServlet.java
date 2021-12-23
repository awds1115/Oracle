package util01;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class opServlet
 */
@WebServlet("/opServlet")
public class opServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public opServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		doPost(req,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); // 
		req.setCharacterEncoding("UTF-8");  // 한글입력 데이터 유지
		String value1=req.getParameter("value1");
		String value2=req.getParameter("value2");
		String operator=req.getParameter("operator");
		if( value1==null || value2==null || operator==null) {
			return; // validation(유효성 검사) 해줘야함
		}
		int num1=Integer.parseInt(value1);
		int num2=Integer.parseInt(value2);
		PrintWriter out=response.getWriter();
		String outstr="<html<head><title>개인정보</title></head><body>";
		if(operator.equals("+")) {
			outstr+=(num1+num2)+"</body></html>";
		} else if(operator.equals("-")) {
			outstr+="value1:"+num1+"<br> value2:"+num2+"<br> operator:"+operator+"<br> result:"+(num1-num2)+"</body></html>";
		} else if(operator.equals("*")) {
			outstr+="value1:"+num1+"<br> value2:"+num2+"<br> operator:"+operator+"<br> result:"+(num1*num2)+"</body></html>";
		} else if(operator.equals("/")) {
			outstr+="value1:"+num1+"<br> value2:"+num2+"<br> operator:"+operator+"<br> result:"+(num1/num2)+"</body></html>";
		}
			out.println(outstr);
				
		
	}

}
