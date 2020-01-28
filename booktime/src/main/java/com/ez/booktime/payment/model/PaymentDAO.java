package com.ez.booktime.payment.model;

import java.util.List;
import java.util.Map;

public interface PaymentDAO {
	 int insertPayment(PaymentVO vo);
	 int insertPaymentDetail(Map<String, Object> map);
	 PaymentVO selectPaymentByPayNo(PaymentVO vo);
	 List<PaymentDetailVO> selectPaymentDetail(String payNo);
}