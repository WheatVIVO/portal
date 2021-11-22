package org.wheatvivo.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.cornell.mannlib.vitro.webapp.controller.VitroRequest;
import edu.cornell.mannlib.vitro.webapp.controller.freemarker.FreemarkerHttpServlet;

/**
    Record cookie consent for the active session.
*/
public class CookieConsentController extends FreemarkerHttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String COOKIE_CONSENT_ATTR = CookieConsentController.class.getName() + ".accept";
    public static final String SERVLET_MAPPING = "/acceptCookies";
    private static final Log log = LogFactory.getLog(CookieConsentController.class);

    /**
     *  Changes session state: POST required.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
       response.setStatus(405);
       response.getWriter().write("<html><head><title>POST required</title>"
               + "</head><body><h1>POST required</h1></body></html>");
    }
    
    /**
      Store cookie consent attribute in active session when parameter 'accept' is true.
     * @throws IOException if unable to redirect response to referring page or home page 
    */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        if( "true".equalsIgnoreCase(request.getParameter("accept")) ) {
            request.getSession().setAttribute(COOKIE_CONSENT_ATTR, true);
        }
        String referrer = null;
        Object o = getPageTemplateValues(new VitroRequest(request)).get("urls");
        if(o instanceof Map) {
            o = ((Map<String, Object>) o).get("referringPage");
            if(o instanceof String) {
                referrer = (String) o;
            }
        }
        if(referrer == null) {
            referrer = request.getRequestURI().substring(
                    0, request.getRequestURI().length() - SERVLET_MAPPING.length());
        }
        response.sendRedirect(referrer);
    }

    public static boolean isCookiesAccepted(HttpServletRequest request) {
        return Boolean.TRUE.equals(request.getSession().getAttribute(COOKIE_CONSENT_ATTR));
    }

}
