package com.xzh.web.commons.utils;

import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MyRequestHeader implements Serializable {
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
        } else if (ip.length() > 15) {
            String[] ips = ip.split(",");
            for (int index = 0; index < ips.length; index++) {
                String strIp = (String) ips[index];
                if (!("unknown".equalsIgnoreCase(strIp))) {
                    ip = strIp;
                    break;
                }
            }
        }
        return ip;
    }


    public static Boolean validIp(String originalIP,String ip) {
        if (!StringUtils.hasText(originalIP)) {
            return true;
        }
        originalIP = originalIP.trim();
        if (!StringUtils.hasText(ip)) {
            return false;
        }
        ip = ip.trim();

        String ipReg = "^((1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])|\\*)\\."
                + "((1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)|\\*)\\."
                + "((1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)|\\*)\\."
                + "((1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)|\\*)$";
        /**校验ip的格式*/
        Pattern pattern = Pattern.compile(ipReg);
        Matcher ipMatcher = pattern.matcher(ip);
        if (!ipMatcher.matches()) {
            return false;
        }
        /**校验originalIP 的格式*/
        Pattern oriPattern = Pattern.compile(ipReg);
        Matcher oriMatcher = oriPattern.matcher(originalIP);
        if (!oriMatcher.matches()) {
            return false;
        }

        /**originalIP与ip 相同*/
        if (originalIP.equals(ip)) {
            return true;
        }

        /**校验ip是否处在originalIP段内*/

        String[] oriIpArr = originalIP.split("\\.");
        String[] ipArr = ip.split("\\.");
        Boolean hasStar = false;
        String star = "*";
        for (int i = 0; i < oriIpArr.length; i++) {
            String oriIp = oriIpArr[i];
            boolean flag = oriIp.equals(star);
            if (flag) {
                hasStar = flag;
            }
            if (hasStar && !flag) {
                return false;
            }
            if (!ipArr[i].equals(oriIp) && !oriIp.equals(star)) {
                return false;
            }
        }
        return true;
    }

}
