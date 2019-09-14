package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class QueAnsModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "QueId")
	private long queId;
	private String question;
	private String answer;
	
	public QueAnsModel() {
		super();
	}

	public QueAnsModel(String question, String answer) {
		super();
		this.question = question;
		this.answer = answer;
	}

	public long getQueId() {
		return queId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
