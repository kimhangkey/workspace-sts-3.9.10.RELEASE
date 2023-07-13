package com.green.polymorphism;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext; // ApplicationContext의 구현클래스
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext; // 설정파일이 xml

public class TVUser {

	public static void main(String[] args) {
		
		//기존 방식
		
//		TV stv = new SamsungTV();
//		stv.powerOn();
//		stv.volumnDown();
//		stv.powerOff();
//		
//		TV ltv = new LgTV();
//		
//		ltv.powerOn();
//		ltv.volumnUp();
//		ltv.powerOff();
		
		
		// 스프링 컨테이너 구성
		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		TV stv = (TV) factory.getBean("samsungTV");
		stv.powerOn();
		
//		ApplicationContext factory2 = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		AbstractApplicationContext factory2 = new ClassPathXmlApplicationContext("applicationContext.xml");
		TV ltv = (TV) factory2.getBean("LgTV");
		
		ltv.powerOn();
		
//		AbstractApplicationContext factory3 =  new FileSystemXmlApplicationContext("C:\\Users\\Administrator\\Documents\\BoardWeb\\applicationContext.xml");
		// 오류 발생?
//		TV stv2 = (TV) factory3.getBean("samsungTV");
//		
//		stv2.powerOn();
	}

}
