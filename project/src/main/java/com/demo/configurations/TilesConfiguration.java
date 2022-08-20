package com.demo.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfiguration implements WebMvcConfigurer {

	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] { "/WEB-INF/tiles/tiles.xml",
				//tile admin
				"/WEB-INF/tiles/login/tiles_login.xml", "/WEB-INF/tiles/admin/tiles_adminTemplate.xml",
				//tile user
				"/WEB-INF/tiles/user/tiles_userTemplate.xml", "/WEB-INF/tiles/user/tiles_emptyTemplate.xml",

				"/WEB-INF/tiles/tiles_test.xml", });
		configurer.setCheckRefresh(true);
		configurer.setDefinitionsFactoryClass(CustomLocaleDefinitionsFactory.class);
		return configurer;
	}
}
