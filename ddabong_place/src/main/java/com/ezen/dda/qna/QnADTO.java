package com.ezen.dda.qna;

public class QnADTO {
	int question_num; // 문의글 번호
	String userType, questionType, title, writer, id, content, question_date;
	int pw, groups, step, indent; // 비밀번호 4자리, 답글용 필드 3개
	
	public String getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}
	public String getUserType() {
		return userType;
	}
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public int getGroups() {
		return groups;
	}
	public void setGroups(int groups) {
		this.groups = groups;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public QnADTO() {
		super();
	}
	public QnADTO(String userType, String questionType, String title, String writer, String id, String content,
			int pw) {
		super();
		this.userType = userType;
		this.questionType = questionType;
		this.title = title;
		this.writer = writer;
		this.id = id;
		this.content = content;
		this.pw = pw;
	}
	
}
