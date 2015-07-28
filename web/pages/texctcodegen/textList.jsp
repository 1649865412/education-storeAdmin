<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>

<app:pageHeading pageHeadingKey="textList.heading" />
		<%@ include file="/decorators/include/styles.jspf"%>
		<%@ include file="/decorators/include/javascripts.jspf"%>

<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="create" inputType="button" onclick="return fnDoAdd(this);" />
	<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
	<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoMultiDelete(this);" />
	<cartmatic:cartmaticBtn btnType="cancel" inputType="button" onclick="return fnDoUpToParent(this);" />
</content>


<script type="text/javascript">
	jQuery(document).ready(function($) {
	   alert("hello")
	});

	$j(document).ready(function(){
		alert("hello2")
	});

	
	/**
 * 显示dialog
 * @param {Object} product 所选择的Product对象
 * @param {Object} paraData 选择器_show（参数）所传递的参数
 * @return Array 返回所选产品的json对象
 */
	function fnTestSelectProduct(product,paraData){
		var data="";
		data+="paraData:"+paraData+"\n";
		data+="productId:"+product.productId+"\n";
		data+="productName:"+product.productName+"\n";
		data+="productCode:"+product.productCode+"\n";
		data+="brandId:"+product.brand.brandId+"\n";
		data+="brandName:"+product.brand.brandName+"\n";
		data+="productSkuCode:"+product.defaultProductSku.productSkuCode+"\n";
		data+="productSkuId:"+product.defaultProductSku.productSkuId+"\n";
		data+="price:"+product.defaultProductSku.price+"\n";
		data+="salePrice:"+product.defaultProductSku.salePrice+"\n";
		data+="image:"+product.defaultProductSku.image+"\n";
		productSelector_close();
		alert(data);
	}
	/**
  * 显示dialog
  * @param {Object} product 所选择的Product对象
  * @param {Object} paraData 选择器_show（参数）所传递的参数
  * @return Array 返回一个数组，数组元素为产品的json对象
  */
	function fnTestSelectProductSku(productSku){
		var data="productSkuCode:"+productSku.productSkuCode+"\n";
		data+="productSkuId:"+productSku.productSkuId+"\n";
		data+="price:"+productSku.price+"\n";
		data+="salePrice:"+productSku.salePrice+"\n";
		data+="image:"+productSku.image+"\n";
		data+="productId:"+productSku.product.productId+"\n";
		data+="productName:"+productSku.product.productName+"\n";
		data+="productCode:"+productSku.product.productCode+"\n";
		data+="brandId:"+productSku.product.brand.brandId+"\n";
		data+="brandName:"+productSku.product.brand.brandName+"\n";
		alert(data);
	}
	/**
	显示dialog
	*/
	function fnTestSelectMultiProduct(productList,paraData){
		var data="";
		data+="paraData:"+paraData+"\n\n";
		for(var i=0;i<productList.length;i++){
			var product=productList[i];
			data+="productId:"+product.productId+"\n";
			data+="productName:"+product.productName+"\n";
			data+="productCode:"+product.productCode+"\n";
			data+="brandId:"+product.brand.brandId+"\n";
			data+="brandName:"+product.brand.brandName+"\n";
			data+="productSkuCode:"+product.defaultProductSku.productSkuCode+"\n";
			data+="productSkuId:"+product.defaultProductSku.productSkuId+"\n";
			data+="price:"+product.defaultProductSku.price+"\n";
			data+="salePrice:"+product.defaultProductSku.salePrice+"\n";
			data+="image:"+product.defaultProductSku.image+"\n\n";
		}
		log(data);
	}

	function fnTestSelectMultiProductSku(productSkuList){
		alert("杨荣忠")
		var data="";
		var dataArray=new Array();
		for(var i=0;i<productSkuList.length;i++){
			var productSku=productSkuList[i];
			data+="productSkuCode:"+productSku.productSkuCode+"\n";
			data+="productSkuId:"+productSku.productSkuId+"\n";
			data+="price:"+productSku.price+"\n";
			data+="salePrice:"+productSku.salePrice+"\n";
			data+="image:"+productSku.image+"\n";
			data+="productId:"+productSku.product.productId+"\n";
			data+="productName:"+productSku.product.productName+"\n";
			data+="productCode:"+productSku.product.productCode+"\n";
			data+="brandId:"+productSku.product.brand.brandId+"\n";
			data+="brandName:"+productSku.product.brand.brandName+"\n";
			dataArray[i]=productSku.productSkuId;
		}
		alert(data);
        alert(dataArray.join());
        
		jQuery("#text").html('sku组：'+dataArray.join());
	}
</script>


<script type="text/javascript">
	function fnSelectCategoryHandler(category){
		alert("hello");
		alert("hello"+category.name)
		alert("hello"+category.id)
		$j("#linkedCategoryName").val(category.name);
		$j("#linkedCategoryId").val(category.id);
	}
</script>
<product:categorySelector id="CategorySelector" ondblclick="fnSelectCategoryHandler" virtual="0" canSelectRoot="false"></product:categorySelector>

<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/texctcodegen/text.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
				</ul>
				<div class="content" id="listSelectContent">
					<search:searchBox>
						<search:filter />
						<search:input attrPath="s.name" attrNameKey="text.name" datatype="String"
							operator="LIKE" classes="form-inputbox" />
						<search:orderby showOrderDirection="true">
							<option value="textId">
								<fmt:message key="search.order.by.default" />
							</option>
						</search:orderby>
					</search:searchBox>
				</div>
			</div>
		</form>
	</div>
</app:ui_leftMenu>

	<input type="image" src="${ctxPath}/images/select.gif" onclick="try{CategorySelector_show();}catch(e){alert(e.message);}return false;" title="" />
<span id="text">哈哈</span>
<a href="javascript:productSelector_show('3');"> 
            <img src="${ctxPath}/images/select.gif" title="text"  align="absmiddle" />
        </a>
        ----------------
        <cartmatic:iconBtn icon="plus" textKey="common.link.add" onclick="dlgProductSkuEditor_show(3);" />
        
        	<input id="b2" type="button" class="admin-btn" value="选择产品1" onclick="productSelector_show('kkk_DIV')"/>
	<product:productSelector id="productSelector" ondblclick="fnTestSelectProduct" autoClose="false"></product:productSelector>
	
	
	<input id="b3" type="button" class="admin-btn"  value="选择SKU"/>
	<product:productSkuSelector id="productSkuSelector" showSelectorBtnId="b3" title="哈哈" ondblclick="fnTestSelectProductSku" showProductKinds="1,2"></product:productSkuSelector>
	
	<%--多选--%>
	<input id="b4" type="button" class="admin-btn" value="选择产品(多选)" onclick="multiSelect_productSelector_show('kkk_DIV')" />
	<product:productSelector id="multiSelect_productSelector" ondblclick="fnTestSelectMultiProduct" autoClose="true" multiSelect="true"></product:productSelector>
	
	
	<input id="b5" type="button" class="admin-btn"  value="选择SKU(多选)"/>
	<product:productSkuSelector id="multiSelect_productSkuSelector" showSelectorBtnId="b5" title="哈哈" ondblclick="fnTestSelectMultiProductSku" showProductKinds="1,2" multiSelect="true"></product:productSkuSelector>
	
	
	<input id="b2" type="button" class="admin-btn" value="选择产品(指定Catalog)" onclick="productSelector_catalog_show('kkk_DIV')"/>
	<product:productSelector id="productSelector_catalog" ondblclick="fnTestSelectProduct" catalogId="4" autoClose="false"></product:productSelector>
	
	<input id="b6" type="button" class="admin-btn" value="选择产品(实体Catalog下产品)" onclick="productSelector_catalog2_show('kkk_DIV')"/>
	<product:productSelector id="productSelector_catalog2" ondblclick="fnTestSelectProduct" virtual="2" autoClose="false"></product:productSelector>
	
<form class="mainForm" name="textListForm" method="post" action="${ctxPath}/texctcodegen/text.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	
	    <c:set var="editURLPath" value="/texctcodegen/text.html?doAction=edit&from=list" scope="page" />
	
		<c:set var="checkAll"><input type="checkbox" name="allbox" onclick="checkAll(this.form)" class="checkbox"/></c:set>
		
		<display:table name="${textList}" cellspacing="0" cellpadding="0" uid="textItem"
			class="table-list" export="false" requestURI="">
			<display:column style="width: 3%" title="${checkAll}" media="html" >
				<input type="checkbox" name="multiIds" value="${textItem.textId}" class="checkbox" title="${textItem.textName}"/>
			</display:column>
			<display:column sortable="true" title="ID"  url="${editURLPath}" paramId="textId" paramProperty="textId"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="text.textId">
				${textItem.textId}
			</display:column>
		    <display:column title="名字2" sortable="false" 
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator"  >${textItem.textId}
        	</display:column>
		    <display:column property="name" title="名字" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="text.name" />
		    <display:column property="text" title="值" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="text.text"/>
		</display:table>
		
		
		<%@include file="/common/pagingOnlyNew.jsp"%>
</form>

<%@ include file="/decorators/include/uiResource.jspf"%>

<script type="text/javascript">
highlightTableRows("textItem");
</script>

