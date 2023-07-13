package com.green.sample;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;

@Component // bean 객체 생성
@Data // @getter, @setter, @toString() 대체(pom.xml에서 dependency를 통해 lombok 라이브러리 추가)
// lombok의 @Data 어노테이션만 추가해도 getter,setter,toString을 만들 필요가 없다.
public class Chef {
	private String menu;
	
	
}
