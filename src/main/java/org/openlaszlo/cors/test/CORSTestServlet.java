package org.openlaszlo.cors.test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Servlet implementation class CORSTestServlet
 */
public class CORSTestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Cookie sessionCookie = null;

    final private String cookieName = "corscookie";

    /** Logger */
    private static Log logger  = LogFactory.getLog(CORSTestServlet.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CORSTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.checkCookie(request, response);
        this.forwardRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        this.checkCookie(request, response);
        this.forwardRequest(request, response);
    }

    private void forwardRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nextJSP = "/result.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
    }

    private void checkCookie(HttpServletRequest request, HttpServletResponse response) {
        this.sessionCookie = this.getCookie(request);
        if (this.sessionCookie == null) {
            logger.debug("CORS not send by client, trying to set cookie now.");
            this.setCookie(response);
        } else {
            logger.debug("CORS cookie is already set.");
        }
    }

    private Cookie getCookie(HttpServletRequest request) {
        Cookie cookies[] = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(this.cookieName)) {
                    request.setAttribute("corscookie", cookies[i]);
                    return cookies[i];
                }
            }
        }
        return null;
    }

    private void setCookie(HttpServletResponse response) {
        Cookie cookie = new Cookie(this.cookieName, "CORS cookie is set at " + SimpleDateFormat.getInstance().format(new Date()));
        cookie.setMaxAge(365 * 24 * 60 * 60);
        logger.debug(this.cookieName + " cookie not set, setting to " + cookie.getValue());
        response.addCookie(cookie);
    }

}
