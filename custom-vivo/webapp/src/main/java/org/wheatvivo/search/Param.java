package org.wheatvivo.search;

import edu.cornell.mannlib.vitro.webapp.web.templatemodels.BaseTemplateModel;

/**
 * A name-value pair for use in building hidden input fields in forms 
 * in templates, etc.
 */
public class Param extends BaseTemplateModel {
    
    private String name;
    private String value;
    
    public Param(String name, String value) {
        this.name = name;
        this.value = value;
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getValue() {
        return this.value;
    }
    
}