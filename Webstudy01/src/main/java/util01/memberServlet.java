package util01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberServlet
 */
@WebServlet("/memberServlet")
public class memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberServlet() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name=req.getParameter("realname");
		String[] argender=req.getParameterValues("gender");
		String id=req.getParameter("userid");
		String pw1=req.getParameter("passcode1");
		String pw2=req.getParameter("passcode2");
		String mobile=req.getParameter("mobile");
		String[] arinterest=req.getParameterValues("interest");
		String outstr = "<html><head><title>개인정보</title></head><body>";
		if(name==null || argender==null || id==null || pw1==null || pw2==null || mobile==null || arinterest==null) {
			outstr+="입력하지 않은 값이 있습니다.";
			
		} else if(pw1.equals(pw2)==false){
			 outstr+="비밀번호가 같지 않습니다.";
		} else {
			String gen = "";
			for(int i=0; i<argender.length; i++) {
				gen=argender[i];
			}
			String in = "";
			for(int j=0; j<arinterest.length; j++) {
				in+=arinterest[j]+", ";
			}
			outstr+="실명: "+name+"<br> 성별: "+gen+"<br> 아이디: "+id+"<br> 비밀번호: "
			+pw1+"<br> 비밀번호 확인: "+pw2+"<br> 모바일번호: "+mobile+"<br> 관심분야: "+in;
		}
			outstr+="</body></html>";
			PrintWriter out=response.getWriter();
			out.println(outstr);
	}

}
