package com.green.sample;

import org.springframework.stereotype.Component;

import lombok.Setter;

// 레스토랑은 Chef 타입의 객체를 필요로 함.

@Component // bean 객체 생성
public class Restaurant {
	
	@Setter // 컴파일시 자동으로 setChef()를 생성
	private Chef chef;
	
	
}
