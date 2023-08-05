<%
session.removeAttribute("userType");
session.removeAttribute("userId");
session.invalidate();
response.sendRedirect("index.jsp");
%>