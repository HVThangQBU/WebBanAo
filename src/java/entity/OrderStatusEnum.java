/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HOANG_THANG
 */

public enum OrderStatusEnum{
    CHOXACNHAN("1"),
    CHOLAYHANG("2"),
    GIAOHANG("3"),
    DAGIAO("4"),
    DAHUY("5"),
    TRAHANG("6");
    private String value;
    private Map<String, String> orderStatusMap;

  OrderStatusEnum(String value) {
      this.value=value;
    }

    public String getValue() {
      return value;
    }

    public void setValue(String value) {
      this.value = value;
    }

  public void setOrderStatusMap(Map<String, String> orderStatusMap) {
    this.orderStatusMap = orderStatusMap;
  }

  public static Map<String, String> getOrderStatusMap() {
    Map<String, String> orderStatusMap = new HashMap<>();
      orderStatusMap.put(CHOXACNHAN.getValue(), "Chờ xác nhận");
      orderStatusMap.put(CHOLAYHANG.getValue(), "Chờ lấy hàng");
      orderStatusMap.put(GIAOHANG.getValue(), "Đang giao");
      orderStatusMap.put(DAGIAO.getValue(), "Đã giao");
      orderStatusMap.put(DAHUY.getValue(), "Đã hủy");
      orderStatusMap.put(TRAHANG.getValue(), "Trả hàng");
    return orderStatusMap;
  }
  }
