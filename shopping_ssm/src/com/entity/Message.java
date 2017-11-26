package com.entity;

public class Message {
	private String message;
	
	public Message(){}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Message [message=" + message + "]";
	};
	
	public Message(String message){
		this.message=message;
	}
}
