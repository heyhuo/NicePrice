package com.hbj.niceprice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan("com.hbj.niceprice.mapper")
@SpringBootApplication
public class NicepriceApplication {

    public static void main(String[] args) {
        SpringApplication.run(NicepriceApplication.class, args);
    }

}
