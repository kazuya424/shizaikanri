package com.risata181.sizai.config;

import com.jolbox.bonecp.BoneCPConfig;
import com.jolbox.bonecp.BoneCPDataSource;
import javax.sql.DataSource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Data Access Layer 設定bean
 *
 *
 * @author js-kim
 */
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.risata181.sizai", annotationClass = Mapper.class)
public class DatabaseConfig implements InitializingBean {

  private BoneCPConfig config() {
    BoneCPConfig config = new BoneCPConfig();
    config.setUser("sizai2");
    config.setPassword("sizaiB");
    config.setJdbcUrl("jdbc:mysql://127.0.0.1:3306/sizaiB?useUnicode=true&characterEncoding=utf-8");
    // config.setDriverProperties(properties());
    return config;
  }

  @Bean(destroyMethod = "close")
  public DataSource dataSource() {
    BoneCPDataSource dataSource = new BoneCPDataSource(config());
    dataSource.setDriverClass("com.mysql.jdbc.Driver");
    // dataSource.setJdbcUrl(environment.getRequiredProperty("jdbc.url"));
    // dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
    // dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));

    return dataSource;
  }

  /**
   * regist transaction manager
   *
   * @throws ClassNotFoundException
   */
  @Bean
  public PlatformTransactionManager transactionManager() {
    return new DataSourceTransactionManager(dataSource());
  }

  @Override
  public void afterPropertiesSet() throws Exception {
    // Flyway flyway = new Flyway();
    // flyway.setDataSource(dataSource());
    // flyway.init();
    // flyway.migrate();
  }

}
