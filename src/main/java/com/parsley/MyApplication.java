package com.parsley;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class MyApplication {
    @Autowired
    private Environment environment;

    public Environment getEnvironment() {
        return environment;
    }

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(MyApplication.class);

        application.run(args);
    }

}
