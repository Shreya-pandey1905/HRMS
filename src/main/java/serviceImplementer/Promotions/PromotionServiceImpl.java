package serviceImplementer.Promotions;


import dao.Promotions.PromotionDao;
import models.Promotions.Promotion;
import service.Promotions.PromotionService;

import java.util.List;

public class PromotionServiceImpl implements PromotionService {

    private final PromotionDao promotionDao;

    public PromotionServiceImpl() {
        this.promotionDao = new PromotionDao();
    }


    @Override
    public void addPromotion(Promotion promotion) {

        promotionDao.addPromotion(promotion);
    }


    @Override
    public List<Promotion> getAllPromotions() {

        return promotionDao.getAllPromotions();
    }

    @Override
    public Promotion getPromotionById(int promotionId) {
        return promotionDao.getPromotionById(promotionId);
    }

    @Override
    public void updatePromotion(Promotion promotion) {
        promotionDao.updatePromotion(promotion);
    }

    @Override
    public void deletePromotion(int promotionId) {
        promotionDao.deletePromotion(promotionId);
    }
}