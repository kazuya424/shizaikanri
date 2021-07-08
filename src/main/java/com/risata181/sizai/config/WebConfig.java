package com.risata181.sizai.config;

import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.http.MediaType;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;


/**
 * servlet-context.xml
 * 
 * @author js-kim
 *
 */

@Configuration
@EnableWebMvc
@ComponentScan(value = "com.risata181.sizai")
public class WebConfig extends WebMvcConfigurerAdapter {

  @Override
  public void addResourceHandlers(final ResourceHandlerRegistry registry) {
    registry
        // .addResourceHandler(AppConstBean.RESOURCE_HANDLER)
        // .addResourceLocations(AppConstBean.RESOURCE_LOCATIONS);
        .addResourceHandler("/resources/**").addResourceLocations("/resources/");
  }

  @Override
  public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
    configurer.favorPathExtension(true).useJaf(false).ignoreAcceptHeader(true)
        .mediaType("html", MediaType.TEXT_HTML)
        // .mediaType("json", MediaType.APPLICATION_JSON)
        .defaultContentType(MediaType.TEXT_HTML);
  }

  @Override
  public void configurePathMatch(PathMatchConfigurer configurer) {
    configurer.setUseSuffixPatternMatch(false);
  }

  @Bean
  public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {

    List<ViewResolver> resolvers = new ArrayList<ViewResolver>();

    // Excel File Download View Resolver
    // resolvers.add(excelViewResolver());

    // URL Base View Resolver
    UrlBasedViewResolver viewResolver0 = new UrlBasedViewResolver();
    viewResolver0.setViewClass(TilesView.class);
    viewResolver0.setOrder(0);
    resolvers.add(viewResolver0);

    // resolvers.add(jsonViewResolver());

    // Internal Resource View Resolver
    InternalResourceViewResolver viewResolver1 = new InternalResourceViewResolver();
    viewResolver1.setOrder(1);
    viewResolver1.setViewClass(JstlView.class);
    viewResolver1.setPrefix(AppConstBean.VIEW_PREFIX);
    viewResolver1.setSuffix(AppConstBean.VIEW_SUFFIX);
    resolvers.add(viewResolver1);

    /*
     * JsonViewResolver viewResolver2 = new JsonViewResolver(); resolvers.add(viewResolver2);
     */

    ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
    resolver.setViewResolvers(resolvers);
    resolver.setContentNegotiationManager(manager);
    return resolver;
  }

  @Bean
  public TilesConfigurer tilesConfigurer() {
    TilesConfigurer tilesConfigurer = new TilesConfigurer();
    tilesConfigurer.setDefinitions(AppConstBean.TILES_LAYOUT_XML_PATH_PATTERN);
    tilesConfigurer.setCheckRefresh(true);
    return tilesConfigurer;
  }

  /**
   * {@link org.springframework.core.env.Environment}
   */
  @Bean
  public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
    return new PropertySourcesPlaceholderConfigurer();
  }

  @Bean
  public StandardServletMultipartResolver multipartResolver() {
    /*
     * CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
     * multipartResolver.setMaxUploadSize(5 * 1024 * 1024); return multipartResolver;
     */
    return new StandardServletMultipartResolver();
  }
}
