package ca.justfriends.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.justfriends.dao.DAO;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String userPassword = request.getParameter("password");
		String userPassword2 = request.getParameter("password2");
		String birthday = request.getParameter("birthday");
		String city = request.getParameter("city");
		String provOrState = request.getParameter("provOrState");
		String country = request.getParameter("country");
		String gender = request.getParameter("gender");
		String photo = request.getParameter("profilePic");
		String fnError = null;
		String lnError = null;
		String unError = null;
		String passError = null;
		String passReError = null;
		String emError = null;
		String cnError = null;
		String provError = null;
		String cityError = null;
		String photoError = null;
		int errorCount = 0;

// validate all fields before creating user

// validate first name
		if ((firstName == null) || firstName.equals("")) {
			fnError = "First name required.";
			request.setAttribute("fnError", fnError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^[a-zA-Z]+$");
			Matcher matcher = pattern.matcher(firstName);
			if (!matcher.find()) {
				fnError = "First name must contain only letters.";
			request.setAttribute("fnError", fnError);
			errorCount++;
		}}

// validate last name
		if ((lastName == null) || lastName.equals("")) {
			lnError = "Last name required.";
			request.setAttribute("lnError", lnError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^[a-zA-Z]+$");
			Matcher matcher = pattern.matcher(lastName);
			if (!matcher.find()) {
				lnError = "Last name must contain only letters.";
			request.setAttribute("lnError", lnError);
			errorCount++;
		}}

// validate username
		if ((username == null) || username.equals("")) {
			unError = ("Username required.");
			request.setAttribute("unError", unError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^\\w+$");
			Matcher matcher = pattern.matcher(username);
			if (!matcher.find()) {
				unError = "Username must contain only letters, numbers, or underscores.";
			request.setAttribute("unError", unError);
			errorCount++;
		}}

// validate email
		if ((email == null) || email.equals("")) {
			emError = "Email address required.";
			request.setAttribute("emError", emError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^[a-zA-Z0-9]+@{1}[a-zA-Z]+\\.[a-z]{2,}$");
			Matcher matcher = pattern.matcher(email);
			if (!matcher.find()) {
				emError = "Email must follow pattern: abc@email.com.";
			request.setAttribute("emError", emError);
			errorCount++;
		}}

// validate password
		if ((userPassword == null) || userPassword.equals("")) {
			passError = "Password required.";
			request.setAttribute("passError", passError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^.{8,12}$");
			Matcher matcher = pattern.matcher(userPassword);
			if (!matcher.find()) {
				passError = "Password must be 8-12 characters.";
			request.setAttribute("passError", passError);
			errorCount++;
		}}

// validate if passwords match
		if ((userPassword2 == null) || userPassword2.equals("")) {
			passReError = "Password required.";
			request.setAttribute("passReError", passReError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile(userPassword);
			Matcher matcher = pattern.matcher(userPassword2);
			if (!matcher.find()) {
				passReError = "Passwords do not match.";
			request.setAttribute("passReError", passReError);
			errorCount++;
		}}

// validate country
		if ((country == null) || country.equals("")) {
			cnError = "Country required.";
			request.setAttribute("cnError", cnError);
			// errorCount++;
		}

// validate province/state
		if ((provOrState == null) || provOrState.equals("")) {
			provError = "Province required.";
			request.setAttribute("provError", provError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^[a-zA-Z]+$");
			Matcher matcher = pattern.matcher(provOrState);
			if (!matcher.find()) {
				provError = "Province must contain only letters.";
			request.setAttribute("provError", provError);
			errorCount++;
		}}

// validate city
		if ((city == null) || city.equals("")) {
			cityError = "City required.";
			request.setAttribute("cityError", cityError);
			// errorCount++;
		} else {
			Pattern pattern = Pattern.compile("^[a-zA-Z]+$");
			Matcher matcher = pattern.matcher(city);
			if (!matcher.find()) {
				cityError = "City must contain only letters.";
				request.setAttribute("cityError", cityError);
				errorCount++;
			}
		}

// validate photo
		System.out.print(photo);
		// System.exit(0);
		if ((photo == null) || photo.equals("")) {
			photoError = "Photo required.";
			request.setAttribute("photoError", photoError);
			// errorCount++;
		}

//check if errors exist, if none, proceed, otherwise display errors
		System.out.println(errorCount);
		System.out.print(fnError);
		System.out.print(lnError);
		System.out.print(unError);
		System.out.print(emError);
		System.out.print(passError);
		System.out.print(passReError);
		System.out.print(cnError);
		System.out.print(provError);
		System.out.print(cityError);
		System.out.print(photoError);

		if (errorCount > 0) {
			request.getRequestDispatcher("SignUp.jsp").forward(request, response);

		
		} else {
			System.out.println("reached end of post");
			try {
				DAO dao = new DAO();
				System.out.println("created dao");
					int numUsersAdded = dao.createUser(firstName, lastName, email, username, 
				userPassword2, city, provOrState, country, gender, photo);
					System.out.println(numUsersAdded);
					ResultSet rs = dao.checkUser(username, userPassword2);
					if (rs.next()) {
						String usernameSession = rs.getString("username");
						request.getSession().setAttribute("usernameSession", usernameSession);
						request.getRequestDispatcher("LoginController").forward(request, response);
					}					
				} catch (SQLException e) {
					e.printStackTrace();
				}

			
			
			
			
		}
	}
}
