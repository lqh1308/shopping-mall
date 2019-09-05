package com.lqh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;

@EnableEurekaClient
@EnableFeignClients
@EnableDistributedTransaction
@SpringBootApplication
public class OrderServer {
	public static void main(String[] args) {
		SpringApplication.run(OrderServer.class, args);
	}
}
