package com.cartmatic.estore.common.model.sekillproduct.base;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.cartmatic.estore.common.model.catalog.Product;
import com.cartmatic.estore.core.model.BaseObject;

/**
 * SekillProduct Base Java Bean, base class for the model, mapped directly to database table
 * 
 * Avoid changing this file if not necessary, will be overwritten. 
 *
 * TODO: add class/table comments
 */
public class SekillProductTbl extends BaseObject implements Serializable {

    protected Integer sekillProductId;
	//protected Integer productId;
	protected String sekillTime;
	protected String createTime;
	protected  Product product;
	
	
	//0已抢光，1即将开始，2马上开抢
	protected  int status;
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	/**
	 * 	 * @return Integer
	 */
	public Integer getProductId() {
		return this.getProduct()==null?null:this.getProduct().getId();
	}
	
	
	/**
	 * Set the 
	 */	
	public void settProductId(Integer aValue) {
	    if (aValue==null) {
	    	product = null;
	    } else {
	    	product = new Product(aValue);
	    	product.setVersion(new Integer(0));//set a version to cheat hibernate only
	    }
	}
	
	

	/**
	 * Default Empty Constructor for class SekillProduct
	 */
	public SekillProductTbl () {
		super();
	}
	
	/**
	 * Default Key Fields Constructor for class SekillProduct
	 */
	public SekillProductTbl (
		 Integer in_sekillProductId
        ) {
		this.setSekillProductId(in_sekillProductId);
    }

    

	/**
	 * 	 * @return Integer
     * @hibernate.id column="sekillProductId" type="java.lang.Integer" generator-class="native"
	 */
	public Integer getSekillProductId() {
		return this.sekillProductId;
	}
	
	/**
	 * Set the sekillProductId
	 */	
	public void setSekillProductId(Integer aValue) {
		this.sekillProductId = aValue;
	}	

	public String getSekillTime() {
		return sekillTime;
	}

	public void setSekillTime(String sekillTime) {
		this.sekillTime = sekillTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/**
	 * @see java.lang.Object#equals(Object)
	 */
	public boolean equals(Object object) {
		if (!(object instanceof SekillProductTbl)) {
			return false;
		}
		SekillProductTbl rhs = (SekillProductTbl) object;
		return new EqualsBuilder()
				.append(this.sekillProductId, rhs.sekillProductId)
				.append(this.sekillTime, rhs.sekillTime)
				.append(this.createTime, rhs.createTime)
				.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {
		return new HashCodeBuilder(-82280557, -700257973)
				.append(this.sekillProductId) 
				.append(this.sekillTime) 
				.append(this.createTime) 
				.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return new ToStringBuilder(this)
				.append("sekillProductId", this.sekillProductId) 
				.append("sekillTime", this.sekillTime) 
				.append("createTime", this.createTime) 
				.toString();
	}

	/**
	 * Return the name of the first key column
	 */
	public String getFirstKeyColumnName() {
		return "sekillProductId";
	}
	
	/**
	 * Return the Id (pk) of the entity, must be Integer
	 */
	public Integer getId() {
		return sekillProductId;
	}

}