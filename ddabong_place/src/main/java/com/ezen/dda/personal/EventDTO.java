package com.ezen.dda.personal;

public class EventDTO {
	String nickname, content;

	public EventDTO() {
	}

	public EventDTO(String nickname, String content) {
		super();
		this.nickname = nickname;
		this.content = content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
