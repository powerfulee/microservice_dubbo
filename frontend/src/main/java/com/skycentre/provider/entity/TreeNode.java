package com.skycentre.provider.entity;

import java.io.Serializable;

public class TreeNode implements Serializable{
	private static final long serialVersionUID = 48L;
	private String id;
	private String parent;
	private String text;
	private int print;
	private String right;
	
	public TreeNode(String id, String text, String parent, String right) {
		this.id = id;
		this.text = text;
		this.parent = parent;
		this.print = 0;
		this.right = right;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public int getPrint() {
		return print;
	}

	public void setPrint(int print) {
		this.print = print;
	}

	public String getRight() {
		return right;
	}

	public void setRight(String right) {
		this.right = right;
	}
	
}
