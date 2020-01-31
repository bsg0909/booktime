package com.ez.booktime.payment.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.booktime.favorite.model.FavoriteDAO;
import com.ez.booktime.mileage.model.MileageService;
import com.ez.booktime.mileage.model.MileageVO;
import com.ez.booktime.user.model.UserService;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymentDAO paymentDao;

	@Autowired
	private MileageService mileageService;
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private FavoriteDAO favoriteDao;
	
	@Override
	@Transactional
	public int insertPayment(PaymentVO vo) {
		int cnt = 0;
		
		try {
			cnt = paymentDao.insertPayment(vo);	//주문테이블
			
			if(cnt>0) {
				MileageVO mVo = new MileageVO();
				mVo.setPayNo(vo.getPayNo());
				mVo.setUsePoint(vo.getUsePoint());	//사용 포인트
				mVo.setUserid(vo.getUserid());
				
				if(vo.getNonMember().equals("0")) {
					cnt = mileageService.insertMileage(mVo);	//마일리지 테이블(히스토리)
				}
				if(cnt>0) {
					if(vo.getNonMember().equals("0")) {
						cnt = UserService.updateMileage(mVo);	//유저 마일리지
					}
					
					if(cnt>0) {
						List<PaymentDetailVO> list = vo.getDetails();
						
						int count = 0;
						for(PaymentDetailVO dVo : list) {
							Map<String, Object> map = new HashMap<String, Object>();
							
							map.put("payNo", vo.getPayNo());
							map.put("isbn", dVo.getIsbn());
							map.put("bookName", dVo.getBookName());
							map.put("price", dVo.getPrice());
							map.put("qty", dVo.getQty());
							
							cnt = paymentDao.insertPaymentDetail(map);	//주문 상세정보 테이블
							if(cnt>0) {
								map.put("userid", vo.getUserid());
								cnt = favoriteDao.paymentOkDeleteCart(map);	//구입한 책은 장바구니에서 삭제
								if(cnt>0) count++;
							}
						}
						if(count==list.size()) cnt=1;
						
					}
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		
		return cnt;
	}

	@Override
	public PaymentVO selectPayment(PaymentVO vo) {
		PaymentVO pVo = paymentDao.selectPaymentByPayNo(vo);
		
		if(pVo!=null) {
			List<PaymentDetailVO> list
				= paymentDao.selectPaymentDetail(vo.getPayNo());
			
			pVo.setDetails(list);
		}
		return pVo;
	}

	@Override
	public List<PaymentVO> selectPaymentList(PaymentDateVO vo) {
		List<PaymentVO> list = paymentDao.selectPaymentList(vo);
		
		List<PaymentVO> compList = new ArrayList<PaymentVO>();
		if(list!=null && !list.isEmpty()) {
			for(PaymentVO pVo : list) {
				pVo.setDetails(paymentDao.selectPaymentDetail(pVo.getPayNo()));
				
				compList.add(pVo);
			}
		}
		
		return compList;
	}

	@Override
	public int totalPaymentList(PaymentDateVO vo) {
		return paymentDao.totalPaymentList(vo);
	}
	
}
