package com.risata181.sizai.config;

import java.io.IOException;
import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * MyBatis 設定bean
 *
 * @author js-kim
 */
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.risata181.sizai", annotationClass = Mapper.class)
public class MyBatisConfig {

  @Bean
  public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource,
      ApplicationContext applicationContext) throws IOException {

    SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();

    // DataSource regist
    factoryBean.setDataSource(dataSource);
    // setting file
    factoryBean.setConfigLocation(
        applicationContext.getResource("classpath:META-INF/mybatis/configuration.xml"));
    // META-INF/mybatis/mappers XML regist
    factoryBean.setMapperLocations(
        applicationContext.getResources("classpath:META-INF/mybatis/mappers/**/*.xml"));

    return factoryBean;
  }

  /**
   * mybatis {@link org.apache.ibatis.session.SqlSession} regist bean
   *
   */
  @Bean
  public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
    return new SqlSessionTemplate(sqlSessionFactory);
  }

}
