package com.demo.entities;

public class Status {
	private int id;
	private String name;
	private boolean status;

	public Status(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Status(String name, boolean status) {
		super();
		this.name = name;
		this.status = status;
	}

	public Status() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
