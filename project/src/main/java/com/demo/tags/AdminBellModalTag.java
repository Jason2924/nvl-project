package com.demo.tags;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.entities.Order;
import com.demo.services.OrderService;

public class AdminBellModalTag extends RequestContextAwareTag {

	@Autowired
	private OrderService orderService;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		if (orderService == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = webApplicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		try {
			String viewPath = "../tags/admin_bell_modal/index.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("bellStatuses", orderService.getStatuses());
			request.setAttribute("order", new Order());
			request.getRequestDispatcher(viewPath);
			pageContext.include(viewPath);
		} catch (Exception e) {
			System.err.println("AdminBellTag - doFinally :\n" + e.getMessage());
		}
	}
	
}
