package com.baar.eksapp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class EksAppApplication {
    private static final Logger log = LoggerFactory.getLogger(EksAppApplication.class);

    @GetMapping("/")
    public String home() {
        log.info("Handling home");
        return "Hello World from AWS Elastic Kubernetes Service!";
    }

    public static void main(String[] args) {
        SpringApplication.run(EksAppApplication.class, args);
    }

}
