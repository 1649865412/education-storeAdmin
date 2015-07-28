package com.cartmatic.estore.common.model.sekillproduct;

import com.cartmatic.estore.common.model.sekillproduct.base.SekillProductTbl;

/**
 * Model class for SekillProduct. Add not database mapped fileds in this class.
 */
public class SekillProduct extends SekillProductTbl {
  
	
	public String arrayproductId;
	
	
	
  	/**
	 * Default Empty Constructor for class SekillProduct
	 */
	public SekillProduct () {
		super();
	}
	
	/**
	 * 定义实体的业务名取值； sekillProductName
	 * 必须手工完成这个部分，否则编译不通过。
	 */
	public String getSekillProductName () {
		if (product == null)
	        return "";
	    else
			//返回一个指定有业务意义的属性值;
			//如：product的VO就用product.productName
	        return this.product.getProductName();
	}
	
	/**
	 * Default Key Fields Constructor for class SekillProduct
	 */
	public SekillProduct (
		 Integer in_sekillProductId
		) {
		super (
		  in_sekillProductId
		);
	}

	public String getArrayproductId() {
		return arrayproductId;
	}

	public void setArrayproductId(String arrayproductId) {
		this.arrayproductId = arrayproductId;
	}

}
