<%
	// Admin user is hardcoded to userId 1.
	int currUserId = 0; 
	if(session.getAttribute("userId")==null){
		currUserId = -1;
	} else {
		currUserId = (Integer)session.getAttribute("userId");
	}

	// Check if invalid user
	if(currUserId != 1){
		response.sendRedirect("index.jsp"); // redirect to index.jsp
	}
%>