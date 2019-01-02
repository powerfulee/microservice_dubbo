package com.skycentre.provider.entity;

public enum CommCode {
	SUCCESS("C10000", "请求成功"),

    FAIL("C10001", "请求失败"),;
    private String status, message;

    CommCode(String status, String message) {
        this.status = status;
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }
}
