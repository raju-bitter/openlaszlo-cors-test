<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%><?xml version="1.0" encoding="utf-8" ?><%
   // No caching
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "no-cache" );
   response.setDateHeader( "Expires", 0 );

    Cookie corsCookie = (Cookie) request.getAttribute("corscookie");
    String val = "Cookie not set!";
    if (corsCookie != null) {
        val = corsCookie.getValue();
    }

%><communication>
    <cors>CORS worked!</cors>
    <client-request>
		<cookies><%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i=0; i<cookies.length; i++) {
	%>		<cookie><%= cookies[i].getName() %> = <%= cookies[i].getValue() %></cookie><%
		}
	}	
	%>    </cookies>
    <headers><%
 java.util.Enumeration names = request.getHeaderNames();
 while (names.hasMoreElements()) {
   String name = (String) names.nextElement();
   String value = request.getHeader(name);
   if (! name.equals("Cookie")) {
%><header><%= name %>: <%= value %></header><%
   }
 }
%>    </headers>
	</client-request>
</communication>