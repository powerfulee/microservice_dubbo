package com.skycentre.provider.entity;

import java.io.Serializable;

public class Logs implements Serializable {
    private Integer id;

    private String browser;

    private String ipAddress;

    private String previousPage;

    private String currentPage;

    private Long accessDateTime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser == null ? null : browser.trim();
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress == null ? null : ipAddress.trim();
    }

    public String getPreviousPage() {
        return previousPage;
    }

    public void setPreviousPage(String previousPage) {
        this.previousPage = previousPage == null ? null : previousPage.trim();
    }

    public String getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage == null ? null : currentPage.trim();
    }

    public Long getAccessDateTime() {
        return accessDateTime;
    }

    public void setAccessDateTime(Long accessDateTime) {
        this.accessDateTime = accessDateTime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Logs other = (Logs) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getBrowser() == null ? other.getBrowser() == null : this.getBrowser().equals(other.getBrowser()))
            && (this.getIpAddress() == null ? other.getIpAddress() == null : this.getIpAddress().equals(other.getIpAddress()))
            && (this.getPreviousPage() == null ? other.getPreviousPage() == null : this.getPreviousPage().equals(other.getPreviousPage()))
            && (this.getCurrentPage() == null ? other.getCurrentPage() == null : this.getCurrentPage().equals(other.getCurrentPage()))
            && (this.getAccessDateTime() == null ? other.getAccessDateTime() == null : this.getAccessDateTime().equals(other.getAccessDateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getBrowser() == null) ? 0 : getBrowser().hashCode());
        result = prime * result + ((getIpAddress() == null) ? 0 : getIpAddress().hashCode());
        result = prime * result + ((getPreviousPage() == null) ? 0 : getPreviousPage().hashCode());
        result = prime * result + ((getCurrentPage() == null) ? 0 : getCurrentPage().hashCode());
        result = prime * result + ((getAccessDateTime() == null) ? 0 : getAccessDateTime().hashCode());
        return result;
    }
}