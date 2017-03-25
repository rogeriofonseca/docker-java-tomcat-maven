package br.com.caelum;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class JpaConfigurator {

    @Bean
    public DataSource getDataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass("com.mysql.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://192.168.99.100/projeto_jpa");
        dataSource.setUser("root");
        dataSource.setPassword("root");

        dataSource.setMinPoolSize(2);
        dataSource.setMaxPoolSize(5);
        dataSource.setNumHelperThreads(5);

        return dataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean getEntityManagerFactory(DataSource dataSource) {
        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();

        entityManagerFactory.setPackagesToScan("br.com.caelum");
        entityManagerFactory.setDataSource(dataSource);

        entityManagerFactory
                .setJpaVendorAdapter(new HibernateJpaVendorAdapter());

        Properties props = new Properties();

        props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
        props.setProperty("hibernate.show_sql", "true");
        props.setProperty("hibernate.hbm2ddl.auto", "create-drop");

        entityManagerFactory.setJpaProperties(props);
        return entityManagerFactory;
    }

    @Bean
    public JpaTransactionManager getTransactionManager(EntityManagerFactory emf) {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(emf);

        return transactionManager;
    }

}
