package com.risata181.sizai.config;

import com.risata181.sizai.services.LoginService;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author js-kim
 *
 *         すべての通信をつかむフィルター(intercepter)
 */

@Service("SessionFilter")
public class SessionFilter implements Filter {

  @Autowired
  LoginService loginService;

  @Override
  public void destroy() {
    // TODO Auto-generated method stub
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse servletResponse, FilterChain chain)
      throws IOException, ServletException {
    // TODO Auto-generated method stub
    if (!(request instanceof HttpServletRequest)) {
      throw new ServletException("This filter can " + " only process HttpServletRequest requests");
    }
    HttpServletRequest req = (HttpServletRequest) request;
    String url = req.getServletPath();
    HttpSession session = req.getSession(true);
    session.setAttribute("Auth", "NONE");
    if (session.getAttribute("loginId") != null && !session.getAttribute("loginId").equals("")) {
      String auth = loginService.getAuth(session.getAttribute("loginId").toString());
      String seq = loginService.getSeq(session.getAttribute("loginId").toString());
      String name = loginService.getName(session.getAttribute("loginId").toString());
      session.setAttribute("Auth", auth);
      session.setAttribute("Seq", seq);
      session.setAttribute("Name", name);

    }

    HttpServletResponse response = (HttpServletResponse) servletResponse;
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Headers",
        "origin, x-requested-with, content-type, accept");
    response.setHeader("X-Frame-Options", "SAMEORIGIN");

    if (!url.startsWith("/resources") && !url.startsWith("/favicon")) {
      if (session.getAttribute("Auth").toString() == "NONE") {
        if (!url.startsWith("/login")) {
          response.sendRedirect("/login");
        }
      } else if (session.getAttribute("Auth").toString().equals("USER")
          || session.getAttribute("Auth").toString().equals("ADMIN")) {
        if (url.startsWith("/login")) {
          response.sendRedirect("/main");
        } else if (url.contains("user") && url.contains("admin")
            && session.getAttribute("Auth").toString().equals("USER")) {
          response.sendRedirect("/main");
        }
      }
    }

    chain.doFilter(request, response);
    /*
     * for(String name : response.getHeaderNames()){ System.out.println("name : " + name +
     * " value : " + response.getHeader(name)); }
     */
  }

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {

  }

}
