package com.demo.services;

//import java.io.IOException;
//import java.security.Principal;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//import org.springframework.stereotype.Component;
//
//import com.demo.repositories.AccountRepository;
//
//@Component
//public class AuthenticationSuccessHandlerImp implements AuthenticationSuccessHandler {
//
//	@Autowired
//	HttpSession session;
//
//	@Autowired
//	AccountRepository accountRepository;
//
//	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImp.class);
//
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//			Authentication authentication) throws IOException, ServletException {
//		String userName = "";
//		if (authentication.getPrincipal() instanceof Principal) {
//			userName = ((Principal) authentication.getPrincipal()).getName();
//		} else {
//			userName = ((User) authentication.getPrincipal()).getUsername();
//		}
//		logger.info("userName: " + userName);
//		// HttpSession session = request.getSession();
//		session.setAttribute("userId", userName);
//	}
//}