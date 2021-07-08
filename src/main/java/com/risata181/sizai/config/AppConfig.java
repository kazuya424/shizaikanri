package com.risata181.sizai.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 
 * @author js-kim
 *
 *         scanするパッケージを定義
 */
@Configuration
@ComponentScan(value = AppConstBean.APP_COMPONENT_SCAN_PACKAGE)
public class AppConfig {

}
