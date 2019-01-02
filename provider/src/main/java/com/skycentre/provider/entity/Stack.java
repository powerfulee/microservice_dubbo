package com.skycentre.provider.entity;

import java.io.Serializable;
import java.util.LinkedList;

@SuppressWarnings("rawtypes")
public class Stack implements Serializable{
	private static final long serialVersionUID = 48L;
	private LinkedList list = new LinkedList();

	@SuppressWarnings("unchecked")  
	public void push(TreeNode v) {
		list.addFirst(v);
	}

	@SuppressWarnings("unchecked")  
	public void push(Object v) {
		list.addFirst(v);
	}

	public TreeNode top() {
		return (TreeNode) list.getFirst();
	}

	public Object topObj() {
		return list.getFirst();
	}

	public TreeNode pop() {
		return (TreeNode) list.removeFirst();
	}

	public Object popObj() {
		return list.removeFirst();
	}

	public String toString() {
		return list.toString();
	}

	public boolean isEmpty() {
		return list.isEmpty();
	}
}
