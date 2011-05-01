<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OpenLaszlo cross-origin resource sharing (CORS) Test Webapp</title>
    </head>
    <body>
        <h2>OpenLaszlo Datasets and cross-origin resource sharing (CORS)</h2>
        <p>Test application for OpenLaszlo datasets in SOLO deployed applications 
           and the DHTML runtime.</p>
        <p>The servlets/URLs listed here need to accessed from out of an OpenLaszlo 
           application running in DHTML/HTML5 runtime on a different port on the
           same machine.</p>
        <p>To run this application 
        <ul>
            
            <li>CORS test servlet &quot;withCredentials: false&quot;<br />
                <a href="<%=request.getContextPath()%>/corstest/noCredentials"><%=request.getContextPath()%>/corstest/noCredentials</a>
            <li>
            <li>CORS test servlet &quot;withCredentials: true&quot;<br />
                <a href="<%=request.getContextPath()%>/corstest/withCredentials"><%=request.getContextPath()%>/corstest/withCredentials</a>
            <li>
        </ul>
        <p>Corresponding OpenLaszlo JIRA entries</p>
        <ol>
            <li><a href="http://jira.openlaszlo.org/jira/browse/LPP-9897">LPP-9897: Remove support for proxied mode and proxied datasets</li>
            <li><a href="http://jira.openlaszlo.org/jira/browse/LPP-9917">LPP-9917: Show warning for failed data request using cross-origin resource sharing in DHTML runtime</li>
            <li><a href="http://jira.openlaszlo.org/jira/browse/LPP-9922">LPP-9922: Add cross-origin resource sharing (CORS) support for LzHTTPLoader.js (DHTML)</li>
        </ol>
            
    </body>
</html>
