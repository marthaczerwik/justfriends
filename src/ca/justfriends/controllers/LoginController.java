package ca.justfriends.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.justfriends.dao.DAO;

/**
 * Servlet implementation class LoginController Validates user login
 * credentials, redirects back to login.jsp if username/password invalid. If
 * valid, redirects to the user's dashboard.
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("on doget: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		DAO dao = new DAO();

		// validate if user exists
		if ((username == null) || (username.equals("")) || password == null || password.equals("")) {
			String loginError = "Invalid username or password";
			request.setAttribute("loginError", loginError);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} else {
			try {
				ResultSet rs = dao.checkUser(username, password);
				if (rs.next()) {
					String firstName = rs.getString("firstName");
					String usernameSession = rs.getString("username");
					String lastName = rs.getString("lastName");
					String email = rs.getString("email");
					String city = rs.getString("city");
					String provOrState = rs.getString("provOrState");
					String country = rs.getString("country");
					String gender = rs.getString("gender");
					String photo = rs.getString("photo");
					request.getSession().setAttribute("firstName", firstName);
					request.getSession().setAttribute("usernameSession", usernameSession);
					request.getSession().setAttribute("lastName", lastName);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("city", city);
					request.getSession().setAttribute("provOrState", provOrState);
					request.getSession().setAttribute("country", country);
					request.getSession().setAttribute("gender", gender);
					request.getSession().setAttribute("photo", photo);
					request.getRequestDispatcher("PrivateHome.jsp").forward(request, response);
					System.out.println("worked");
				} else {
					String loginError = "Invalid username or password";
					request.setAttribute("loginError", loginError);
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		doGet(request, response);

	}

}
