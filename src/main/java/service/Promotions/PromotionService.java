package service.Promotions;

import models.Promotions.Promotion;

import java.util.List;

public interface PromotionService {

    void addPromotion(Promotion promotion);

    List<Promotion> getAllPromotions();

    Promotion getPromotionById(int promotionId);

    void updatePromotion(Promotion promotion);

    void deletePromotion(int promotionId);
}