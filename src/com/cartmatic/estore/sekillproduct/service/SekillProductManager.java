package com.cartmatic.estore.sekillproduct.service;

import java.util.List;

import com.cartmatic.estore.common.model.sekillproduct.SekillProduct;
import com.cartmatic.estore.core.service.GenericManager;

/**
 * Manager interface for SekillProduct, responsible for business processing, and communicate between web and persistence layer.
 *
 */
public interface SekillProductManager extends GenericManager<SekillProduct> {
      public void saveSekillProductList(SekillProduct entity);
}
