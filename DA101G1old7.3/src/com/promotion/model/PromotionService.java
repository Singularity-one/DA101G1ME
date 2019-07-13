package com.promotion.model;

import java.util.List;


public class PromotionService {
	private PromotionDAO_interface dao;

	public PromotionService() {
		dao = new PromotionDAO();
	}

	public PromotionVO addPromotion(String merchant_no, String product_no, String promotion_name, 
			java.sql.Date promotion_start, java.sql.Date promotion_end, Double promotion_pr, 
			String promotion_ps, String promotion_status, byte[] promotion_img) {

		PromotionVO promotionVO = new PromotionVO();

		promotionVO.setMerchant_no(merchant_no);
		promotionVO.setProduct_no(product_no);
		promotionVO.setPromotion_name(promotion_name);
		promotionVO.setPromotion_start(promotion_start);
		promotionVO.setPromotion_end(promotion_end);
		promotionVO.setPromotion_pr(promotion_pr);
		promotionVO.setPromotion_ps(promotion_ps);
		promotionVO.setPromotion_status(promotion_status);
		promotionVO.setPromotion_img(promotion_img);
		dao.insert(promotionVO);

		return promotionVO;
	}

	public PromotionVO updatePromotion(String promotion_no, String merchant_no, String product_no, String promotion_name, 
			java.sql.Date promotion_start, java.sql.Date promotion_end, Double promotion_pr, 
			String promotion_ps, String promotion_status, byte[] promotion_img) {

		PromotionVO promotionVO = new PromotionVO();

		promotionVO.setPromotion_no(promotion_no);
		promotionVO.setMerchant_no(merchant_no);
		promotionVO.setProduct_no(product_no);
		promotionVO.setPromotion_name(promotion_name);
		promotionVO.setPromotion_start(promotion_start);
		promotionVO.setPromotion_end(promotion_end);
		promotionVO.setPromotion_pr(promotion_pr);
		promotionVO.setPromotion_ps(promotion_ps);
		promotionVO.setPromotion_status(promotion_status);
		promotionVO.setPromotion_img(promotion_img);
		dao.update(promotionVO);

		return promotionVO;
	}

	public void deletePromotion(String promotion_no) {
		dao.delete(promotion_no);
	}

	public PromotionVO getOnePromotion(String promotion_no) {
		return dao.findByPrimaryKey(promotion_no);
	}

	public List<PromotionVO> getAll() {
		return dao.getAll();
	}
	
	public List<PromotionVO> getOneMerchantNo(String merchant_no){
		return dao.findByMerchantNo(merchant_no);
	}
}