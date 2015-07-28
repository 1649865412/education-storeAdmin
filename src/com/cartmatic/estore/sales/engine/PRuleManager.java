
package com.cartmatic.estore.sales.engine;

import java.util.Collection;
import java.util.List;
import java.util.Vector;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;

import com.cartmatic.estore.common.model.sales.Coupon;
import com.cartmatic.estore.common.model.sales.PromoRule;
import com.cartmatic.estore.common.service.OrderService;
import com.cartmatic.estore.common.service.ProductService;
import com.cartmatic.estore.sales.dao.PromoRuleDao;
import com.cartmatic.estore.sales.service.CouponManager;
import com.cartmatic.estore.sales.service.PromoRuleManager;
import com.cartmatic.estore.sales.util.PromoDependServicesUtil;
import com.cartmatic.estore.webapp.util.RequestContext;
/**
 * 这是管理更新系统中的促销规则的类,方便ruleEngine获取规则数据，不需要每次都从数据库中读取，若在页面更新规则也必须通知该类。
 * @author CartMatic
 *
 */
public class PRuleManager 
{
	private static final Log logger	= LogFactory.getLog(PRuleManager.class);
	//这两个Vector保存了ruleEngine需要的所有促销规则。
	private static Vector<PRule>	cartPromotionRules		= new Vector<PRule>(); //这个是下面两个vetor的总和
	private static Vector<PRule>	catalogPromotionRules	= new Vector<PRule>();
	private static Vector<PRule>	shoppingcartPromotionRules	= new Vector<PRule>();

	private PromoRuleManager			promoRuleManager;
	private CouponManager				couponManager;
	
	
	
	//temp
	private List<PromoRule> cartPromotionRuleList;
	

	public List<PromoRule> getCartPromotionRuleList() {
		return cartPromotionRuleList;
	}

	public void setCartPromotionRuleList(List<PromoRule> cartPromotionRuleList) {
		this.cartPromotionRuleList = cartPromotionRuleList;
	}

	public void init() {
		refresh();
	}

	
	public void refresh() {
		logger.info("~~~~~refresh the promoRules in system~~~~~~");
		clear();
		
		

		List<PromoRule> rules = promoRuleManager.getAllCatalogPromotionRulesInProcess();
		for (PromoRule rule : rules) {
			PRule prule = new PRule(rule);
			catalogPromotionRules.add(prule);
			cartPromotionRules.add(prule);
		}
		rules = promoRuleManager.getAllCartPromotionRulesInProcess();
		for (PromoRule rule : rules) {
			PRule prule = new PRule(rule);
			shoppingcartPromotionRules.add(prule);
			cartPromotionRules.add(prule);
		}
		
		
		

		logger.debug("there are " + catalogPromotionRules.size()
				+ " rules about catalogPromo");
		logger.debug("there are " + cartPromotionRules.size()
				+ " rules about cartPromo");
	}

	public void addCartPromotionRule(PRule _prule) {
		synchronized (cartPromotionRules) {
			cartPromotionRules.add(_prule);
		}
	}

	public void addAllCartPromotionRules(Collection<PRule> _prules) {
		synchronized (cartPromotionRules) {
			cartPromotionRules.addAll(_prules);
		}
	}

	public void removeCartPromotionRule(PRule _prule) {
		synchronized (cartPromotionRules) {
			cartPromotionRules.remove(_prule);
		}
	}

	public void removeAllCartPromotionRules(Collection<PRule> _prules) {
		synchronized (cartPromotionRules) {
			cartPromotionRules.removeAll(_prules);
		}
	}

	public void clearCartPromotionRules() {
		synchronized (cartPromotionRules) {
			cartPromotionRules.clear();
		}
	}

	public static Vector<PRule> getCartPromotionRules() {
		Vector<PRule> rules = new Vector<PRule>();
		for (PRule rule : cartPromotionRules)
		{
			if (RequestContext.getCurrentStoreCode().equals(rule.getStoreCode()))
				rules.add(rule);
		}
		return rules;
	}

	public void setCartPromotionRules(Vector<PRule> _prules) {
		synchronized (cartPromotionRules) {
			cartPromotionRules = _prules;
		}
	}

	public void addCatalogPromotionRule(PRule _prule) {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules.add(_prule);
		}
	}

	public void addAllCatalogPromotionRules(Collection<PRule> _prules) {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules.addAll(_prules);
		}
	}

	public void removeCatalogPromotionRules(PRule _prule) {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules.remove(_prule);
		}
	}

	public void removeAllCatalogPromotionRules(Collection<PRule> _prules) {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules.removeAll(_prules);
		}
	}

	public void clearCatalogPromotionRules() {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules.clear();
		}
	}

	public static Vector<PRule> getCatalogPromotionRules() {
		Vector<PRule> rules = new Vector<PRule>();
		for (PRule rule : catalogPromotionRules)
		{
			if (RequestContext.getCurrentStoreCode().equals(rule.getStoreCode()))
				rules.add(rule);
		}
		return rules;
	}

	public void setCatalogPromotionRules(Vector<PRule> _prules) {
		synchronized (catalogPromotionRules) {
			catalogPromotionRules = _prules;
		}
	}
	
	public Vector<PRule> getCouponPromotionRules(Coupon _coupon) {
		Vector<PRule> prules = new Vector<PRule>();
		prules.add(new PRule(promoRuleManager.getCouponPromotionRule(couponManager
				.getCouponByNo(_coupon.getCouponNo()))));
		logger.debug("there are " + prules.size() + " rules about couponPromo");
		return prules;
	}
	
/////
	public void addShoppingcartPromotionRule(PRule _prule) {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules.add(_prule);
		}
	}

	public void addAllShoppingcartPromotionRules(Collection<PRule> _prules) {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules.addAll(_prules);
		}
	}

	public void removeShoppingcartPromotionRules(PRule _prule) {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules.remove(_prule);
		}
	}

	public void removeAllShoppingcartPromotionRules(Collection<PRule> _prules) {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules.removeAll(_prules);
		}
	}

	public void clearShoppingcartPromotionRules() {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules.clear();
		}
	}

	public static Vector<PRule> getShoppingcartPromotionRules() {
		Vector<PRule> rules = new Vector<PRule>();
		for (PRule rule : shoppingcartPromotionRules)
		{
			if (RequestContext.getCurrentStoreCode().equals(rule.getStoreCode()))
				rules.add(rule);
		}
		return rules;		
	}

	public void setShoppingcartPromotionRules(Vector<PRule> _prules) {
		synchronized (shoppingcartPromotionRules) {
			shoppingcartPromotionRules = _prules;
		}
	}
	
	

	public void clear() {
		clearCartPromotionRules();
		clearCatalogPromotionRules();
		clearShoppingcartPromotionRules();
	}

	

	public void setPromoRuleManager(PromoRuleManager avalue) {
		this.promoRuleManager = avalue;
	}

	public void setCouponManager(CouponManager avalue) {
		this.couponManager = avalue;
	}

	public void setProductService(ProductService _productService) {
		PromoDependServicesUtil.setProductService(_productService);
	}

	public void setOrderService(OrderService _orderService) {
		PromoDependServicesUtil.setOrderService(_orderService);
	}

	//@Override
	//public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	//	doRefresh();
	//}

}
