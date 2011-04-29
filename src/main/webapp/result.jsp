<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%><?xml version="1.0" encoding="utf-8" ?><%

    Cookie corsCookie = (Cookie) request.getAttribute("corscookie");
    String val = "Cookie not set!";
    if (corsCookie != null) {
        val = corsCookie.getValue();
    }

%><account>
    <login>CORS worked!</login>
    <cookie><%= val %></cookie>
</account>