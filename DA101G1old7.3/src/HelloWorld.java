

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld2")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int count=0;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();

		out.println("<!Doctype html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8>'");
		out.println("<title>Hello World</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<BIG>Hello World , 世界你好 !</BIG>"+(++count));
		out.println("</body>");
		out.println("</html>");
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
