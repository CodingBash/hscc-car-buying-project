<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%
	/*
	* Get the username and password entered
	*/
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	// If the user entered a username and password
	if(username != null && password != null){
		
		// Get the user storage
		Map<String, String> userStorage = (Map<String, String>) session.getAttribute("userStorage");
		
		/*
		 * If there is no user storage, create one
		 */
		if(userStorage == null){
			userStorage = new HashMap<String, String>();
			session.setAttribute("userStorage", userStorage);
		}
		
		// If the username is not in the user storage
		if(userStorage.get(username) == null){
			
			// Add in the user to the user storage
			userStorage.put(username, password);
			
			// registration successful, go to login page
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			
			// Error: username is taken. Redirect back to login page
			request.getRequestDispatcher("register.jsp").forward(request, response);		
		}
		
	} else {
		// ERROR: The user did not enter a username or password
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

%>