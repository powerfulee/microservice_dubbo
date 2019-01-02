package com.skycentre.provider.entity;

import java.io.Serializable;

public class CommResp<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private String status;
    private String message;
    private T result;

    public CommResp() {
    }

    public CommResp(CommCode commCode) {
        this.status = commCode.getStatus();
        this.message = commCode.getMessage();
    }

    public CommResp(CommCode commCode,T result) {
        this.status = commCode.getStatus();
        this.message = commCode.getMessage();
        this.result = result;
    }

    public CommResp(String status, String message, T result) {
        this.status = status;
        this.message = message;
        this.result = result;
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

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

}
