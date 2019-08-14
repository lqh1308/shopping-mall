package com.lqh.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentInfo {
    private Integer id;
    /**
     * 支付类型
     */
    private Long typeId;
    /**
     * 订单编号
     */
    private String orderId;
    /**
     * 第三方平台支付id
     */
    private String platformorderId;
    /**
     * 订单名称
     */
    private String orderTitle;
    /**
     * 价格 以分为单位
     */
    private Long price;
    /**
     * 订单描述
     */
    private String orderDescription;
    /**
     * 支付来源
     */
    private String source;
    /**
     * 支付状态 0 待支付、1支付成功 、2支付失败
     */
    private Integer state;
    /**
     * 支付报文
     */
    private String payMessage;
 
    /**
     * 用户userId
     */
    private String userId;
    private Date created;
    private Date updated;

}