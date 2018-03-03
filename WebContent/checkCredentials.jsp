<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%
	/*
	* Get the username and password entered
	*/
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	// Get the user storage
	Map<String, String> userStorage = (Map<String, String>) session.getAttribute("userStorage");
	
	// If the user entered a username and password && the userStorage exists
	if (username != null && password != null && userStorage != null) {

		/*
		 * If username exists and the password is correct
		 */
		if (userStorage.get(username) != null && userStorage.get(username).equals(password)) {
			
			// TODO: NEED TO ADD THE CURRENT USER TO SESSION
				
			
			// Try and get the last page
			String lastPage = (String) session.getAttribute("lastPage");
			
			// If there is a last page
			if (lastPage != null) {
				// Redirect to it
				request.getRequestDispatcher(lastPage + ".jsp").forward(request, response);
			} else {
				// If there is no last page, go to home page by default
				request.getRequestDispatcher("homePage.jsp").forward(request, response);
			}
		} else {
			
			// ERROR: username or passowrd is incorrect, go back to login page
			request.getRequestDispatcher("login.jsp").forward(request, response);	
		}
	} else {
		// ERROR: The user did not enter a username or password
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>