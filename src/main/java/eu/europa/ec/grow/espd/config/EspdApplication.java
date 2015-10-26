package eu.europa.ec.grow.espd.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.WebApplicationInitializer;

/**
 * Created by vigi on 10/20/15:5:17 PM.
 */
@SpringBootApplication
@ComponentScan("eu.europa.ec.grow.espd")
public class EspdApplication extends SpringBootServletInitializer implements WebApplicationInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(EspdApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(EspdApplication.class, args);
    }

    @Bean
    ObjectMapper objectMapper() {
        return new ObjectMapper();
    }
}