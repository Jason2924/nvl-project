package com.demo.paypals;

import javax.servlet.http.*;

public class PayPalConfig {

    private String authToken;
    private String posturl;
    private String business;
    private String returnurl;
    private String cancelurl;
    private String cmd;
    
    public PayPalConfig() {
    	this.authToken = "iKSdRxdnN6uIRCUFqXszBN59VuKc2Tz97mZ4jlKcAgr0KOWGukJiSlr8JwO";
    	this.posturl = "https://www.sandbox.paypal.com/cgi-bin/webscr";
    	this.business = "sb-gvht8658551@business.example.com";
    	this.returnurl = "http://localhost:9596/payment/success";
    }

    public String getAuthToken() {
        return authToken;
    }

    public String getPosturl() {
        return posturl;
    }

    public String getBusiness() {
        return business;
    }

    public String getReturnurl() {
        return returnurl;
    }

    public String getCancelurl() {
        return cancelurl;
    }

    public String getCmd() {
        return cmd;
    }

    public PayPalConfig getConfig(HttpServletRequest request) {
        PayPalConfig pc = new PayPalConfig();
        try {
            pc.authToken = this.authToken;
            pc.posturl = this.posturl;
            pc.business = this.business;
			/* pc.returnurl = this.returnurl + "?paymentId=" + "199"; */
        } catch (Exception ex) {
            pc = null;
        }
        return pc;
    }
}
