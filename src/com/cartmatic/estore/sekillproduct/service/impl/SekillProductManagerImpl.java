package com.cartmatic.estore.sekillproduct.service.impl;

import com.cartmatic.estore.catalog.dao.ProductDao;
import com.cartmatic.estore.common.model.sekillproduct.SekillProduct;
import com.cartmatic.estore.core.service.impl.GenericManagerImpl;
import com.cartmatic.estore.sekillproduct.dao.SekillProductDao;
import com.cartmatic.estore.sekillproduct.service.SekillProductManager;
import com.cartmatic.estore.sekillproduct.util.CalenderTime;
import com.cartmatic.estore.sekillproduct.util.SekillTool;


/**
 * Manager implementation for SekillProduct, responsible for business processing, and communicate between web and persistence layer.
 */
public class SekillProductManagerImpl extends GenericManagerImpl<SekillProduct> implements SekillProductManager {

	private SekillProductDao sekillProductDao = null;
	
	private ProductDao productDao   =null;
	

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	/**
	 * @param sekillProductDao
	 *            the sekillProductDao to set
	 */
	public void setSekillProductDao(SekillProductDao sekillProductDao) {
		this.sekillProductDao = sekillProductDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#init()
	 */
	@Override
	protected void initManager() {
		dao = sekillProductDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onDelete()
	 */
	@Override
	protected void onDelete(SekillProduct entity) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onSave()
	 */
	@Override
	protected void onSave(SekillProduct entity) {

	}

	@Override
	public void saveSekillProductList(SekillProduct entity) {
		
		 String[]array = SekillTool.splitProductArrya(entity);
		 String killTime = entity.getSekillTime();
		 if(array.length!=0)
		 {
			 for(int i=0;i<array.length;i++)
			 {
				 SekillProduct sekillProduct =new SekillProduct();
				/* try
				 { */  
					 int id= Integer.parseInt(array[i]);
					 sekillProduct.settProductId(id);
					 sekillProduct.setProduct(productDao.getById(id));
				// }
		/*	catch (Exception e)
			{
				e.printStackTrace();
				sekillProduct.settProductId(1);
			}*/
				 sekillProduct.setCreateTime(CalenderTime.getToday("yyyy-MM-dd"));
				 sekillProduct.setSekillTime(killTime);
				 sekillProductDao.save(sekillProduct);
				 }
		 }
		
	}

}
