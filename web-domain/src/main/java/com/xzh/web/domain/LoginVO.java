package com.xzh.web.domain;


import java.io.Serializable;

public class LoginVO implements Serializable {
    private String username;
    private String password;
    private String isRemember;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIsRemember() {
        return isRemember;
    }

    public void setIsRemember(String isRemember) {
        this.isRemember = isRemember;
    }

    public LoginVO() {
    }

    @Override
    public String toString() {
        return "LoginVO{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", isRemember='" + isRemember + '\'' +
                '}';
    }
}
