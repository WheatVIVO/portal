/* $This file is distributed under the terms of the license in LICENSE$ */
package edu.cornell.mannlib.vitro.webapp.utils.dataGetter;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.jena.rdf.model.Model;

import edu.cornell.mannlib.vitro.webapp.controller.VitroRequest;

/**
 * Data getter that makes the session length in seconds available to the
 * Freemarker template in a 'sessionLength' variable.
 */
public class SessionLengthDataGetter extends DataGetterBase implements DataGetter{
    private final static Log log = LogFactory.getLog(SparqlQueryDataGetter.class);

    VitroRequest vreq;
    
    /**
     * Constructor with display model and data getter URI that will be called by reflection.
     */
    public SessionLengthDataGetter(VitroRequest vreq, Model displayModel, String dataGetterURI){
        this.vreq = vreq;
    }
   
    @Override
    public Map<String, Object> getData(Map<String, Object> pageData) { 
        Map<String, Object> data = new HashMap<String, Object>();
        long sessionLength = (System.currentTimeMillis() - vreq.getSession().getCreationTime()) / 1000;
        data.put("sessionLength", sessionLength);
        log.debug("Session length is " + sessionLength);
        return data;  
    }
    
}
