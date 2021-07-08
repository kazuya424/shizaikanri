package com.risata181.sizai.config.listener;

import com.risata181.sizai.config.AppConstBean;
import java.util.Date;
import javax.servlet.http.HttpSessionEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.session.HttpSessionEventPublisher;

/**
 * @brief セッションリスナークラス。
 * @class SessionListener
 * @author jeongsub.kim
 *
 */

public class SessionListener extends HttpSessionEventPublisher {

  /** ロガー */
  private static final Logger logger = LoggerFactory.getLogger(SessionListener.class);


  /**
   * @brief セッション生成。
   * @param se セッションイベント
   */
  @Override
  public void sessionCreated(HttpSessionEvent se) {
    se.getSession().setMaxInactiveInterval(AppConstBean.APP_SESSION_TIMEOUT);
    logger.debug("Session ID : ".concat(se.getSession().getId()).concat(" created at ")
        .concat(new Date().toString()));
  }

  /**
   * @brief セッション破棄。
   * @param se セッションイベント
   */
  @Override
  public void sessionDestroyed(HttpSessionEvent se) {
    logger.debug("Session ID : ".concat(se.getSession().getId()).concat(" destroyed at ")
        .concat(new Date().toString()));
  }

}
