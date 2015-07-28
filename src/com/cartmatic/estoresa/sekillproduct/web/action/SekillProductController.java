package com.cartmatic.estoresa.sekillproduct.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.sekillproduct.SekillProduct;
import com.cartmatic.estore.common.service.ProductService;
import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.core.model.Message;
import com.cartmatic.estore.core.view.AjaxView;
import com.cartmatic.estore.sekillproduct.service.SekillProductManager;

public class SekillProductController extends GenericController<SekillProduct> {
    private SekillProductManager sekillProductManager = null;

    private ProductService productService=null;
    
    public void setProductService(ProductService productService) {
		this.productService = productService;
	}
    
    public void setSekillProductManager(SekillProductManager inMgr) {
        this.sekillProductManager = inMgr;
      
    }
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(SekillProduct entity) {
		return entity.getSekillProductName();
 	}

	
	/**
	 * 构造批量更新所需的model。
	 * <P>
	 * 本来这方法对大部分情况也是可以自动分析和转换的，但考虑到比较复杂和难以灵活（验证、缺省值、I18N等、Status转换等），暂时要求各模块自己实现。要求数据要先转换为正确的类型。
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected Map<Integer, Map<String, Object>> getMultiSaveModel(HttpServletRequest request) {
		//FIXME
		throw new RuntimeException("Not implemented yet!");
	}


	@Override
	protected void initController() throws Exception {
		mgr = sekillProductManager;
	}

	
/*	public ModelAndView defaultAction(HttpServletRequest request,HttpServletResponse response) {
		SearchCriteria sc = createSearchCriteria(request);
		request.setAttribute("sekillProductList", this.sekillProductManager.getSekillProductAll());
		return getModelAndView(listView, listModelName, sekillProductManager.searchByCriteria(sc));
	}
	*/
	
	
	/**
	 * 功能:异步测试
	 * <p>作者 杨荣忠 2015-5-5 上午10:04:57
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView text2(HttpServletRequest request,HttpServletResponse response) {
		/*	SearchCriteria sc = createSearchCriteria(request);
			request.setAttribute("list",  textManager.getAll());
			return getModelAndView(listView, listModelName, this.textManager.getAll());
			*/
			/**
			 * 保存后返回相应的提示信息，action=1表示保存更新成功，action=2表示保存更新失败； jFiledErrors为错误提示信息;
			 * 提示信息最好以json方式返回
			 */
			AjaxView ajaxView=new AjaxView(response);
			Map<String, Object> data = new HashMap<String, Object>();
			ajaxView.setData(data);
			String msgKey = (isEntityNew(request)) ? "common.added": "common.updated";
			ajaxView.setMsg(getMessage(msgKey, new Object[] {getEntityTypeMessage(), 2}));
			ajaxView.setStatus(new Short("1"));
			return ajaxView;
		}
	
	
	
	
	/**
	 * 功能:方法测试
	 * <p>作者 杨荣忠 2015-5-5 上午09:50:25
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView  text(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  Map<String, Object> context =new HashMap();
		  List list = new ArrayList();
		  list.add(1);
		  list.add(2);
		  list.add(3);
		  System.out.println("text");
		//  ModelAndView  mo =  new ModelAndView("test/ajax5.htm");
		//  ModelAndView  mo =  new ModelAndView("test/categorySelectTest");
		//  ModelAndView  mo =  new ModelAndView("test/downloadImages");
		//  ModelAndView  mo =  new ModelAndView("test/dragAndDrop");
		//  ModelAndView  mo =  new ModelAndView("test/testDialog");
		//  ModelAndView  mo =  new ModelAndView("test/selectTest");
		//  ModelAndView  mo =  new ModelAndView("test/sendMailTest");
		//  ModelAndView  mo =  new ModelAndView("test/setCategoryTemplate");
		//  ModelAndView  mo =  new ModelAndView("test/setCategoryTemplate");
		//  ModelAndView  mo =  new ModelAndView("test/supplierSelectTest");
		//  ModelAndView  mo =  new ModelAndView("test/testDialog");
		//  ModelAndView  mo =  new ModelAndView("test/testHtmlEditor");
		//  ModelAndView  mo =  new ModelAndView("test/supplierSelectTest");
		//  ModelAndView  mo =  new ModelAndView("test/testSwfUpload");
		//  ModelAndView  mo =  new ModelAndView("test/testTabs");
		//  ModelAndView  mo =  new ModelAndView("test/testTree");
		//  ModelAndView  mo =  new ModelAndView("test/testUpload2");
		//  ModelAndView  mo =  new ModelAndView("test/testTabs"); 
	    //  ModelAndView  mo =  new ModelAndView("test/testRegionSelector");
		//  ModelAndView  mo =  new ModelAndView("test/testRegionSelector");
		//  ModelAndView  mo =  new ModelAndView("test/testValidate");
		//  ModelAndView  mo =  new ModelAndView("test/userSelectTest");
		    ModelAndView  mo =  new ModelAndView("sekillproduct/sekillProductNew");
		    mo.addObject("list", list);
		    return mo ;
		}
	/**
	 * 重写保存方法
	 */
	protected void  onSave(HttpServletRequest request, SekillProduct entity, BindException errors) {
		//System.out.println("onSave");
		if(entity.getArrayproductId().trim().equals("")){
			//sekillProductManager.saveSekillProductList(entity);
			saveMessage(Message.info("请选择sku"));
		}
		else if (errors.hasErrors()){
			sekillProductManager.saveSekillProductList(entity);
			saveMessage(Message.info("common.added", new Object[] {getEntityTypeMessage(), getEntityName(entity)}));	
		}
	}
}
