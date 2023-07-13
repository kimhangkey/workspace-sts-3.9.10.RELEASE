package com.green.polymorphism;

public class SamsungTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("삼성 TV 전원 켜다.");
		
	}

	@Override
	public void powerOff() {
		System.out.println("삼성 TV 전원 끄다.");
	}

	@Override
	public void volumnUp() {
		System.out.println("삼성 TV 볼륨 업");
	}

	@Override
	public void volumnDown() {
		System.out.println("삼성 TV 볼륨 다운");
	}
	
}
