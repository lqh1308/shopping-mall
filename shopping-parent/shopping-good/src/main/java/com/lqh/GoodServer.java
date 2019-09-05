package com.lqh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;

@SpringBootApplication
@EnableEurekaClient
@EnableDistributedTransaction
public class GoodServer {
	
	public static void main(String[] args) {
		SpringApplication.run(GoodServer.class, args);
	}
	
}
