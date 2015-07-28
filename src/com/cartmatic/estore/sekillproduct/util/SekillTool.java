package com.cartmatic.estore.sekillproduct.util;

import com.cartmatic.estore.common.model.sekillproduct.SekillProduct;

public class SekillTool
{
	/**
	 * 功能:处理秒杀批量添加，返回产品ID数组
	 * <p>作者 杨荣忠 2015-5-4 上午11:35:53
	 * @param entity
	 * @return
	 */
   public static String[] splitProductArrya(SekillProduct entity){
	    String arrayId = entity.getArrayproductId();
	    String array[]= arrayId.split(",");
	    return array;
   }
}
