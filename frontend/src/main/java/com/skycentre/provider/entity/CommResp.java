package com.skycentre.provider.entity;

import java.io.Serializable;

public class CommResp<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private String status;
    private String message;
    private T data;

    public CommResp() {
    }

    public CommResp(CommCode commCode) {
        this.status = commCode.getStatus();
        this.message = commCode.getMessage();
    }

    public CommResp(CommCode commCode,T data) {
        this.status = commCode.getStatus();
        this.message = commCode.getMessage();
        this.data = data;
    }

    public CommResp(String status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    /*@Override
    public String toString() {
        return new Gson().toJson(this);
    }*/
}
