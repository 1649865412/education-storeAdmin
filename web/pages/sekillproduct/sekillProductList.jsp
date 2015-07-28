<%@ include file="/common/taglibs.jsp"%>
		<%@ include file="/decorators/include/styles.jspf"%>
		<%@ include file="/decorators/include/javascripts.jspf"%>

		
<app:pageHeading pageHeadingKey="sekillProductList.heading" />

<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="create" inputType="button" onclick="return fnDoAdd(this);" />
	<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
	<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoMultiDelete(this);" />
	<!--<<cartmatic:cartmaticBtn btnType="cancel" inputType="button" onclick="return fnDoUpToParent(this);" />-->
</content>


<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/sekillproduct/sekillProduct.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
				</ul>
				<div class="content" id="listSelectContent">
						<search:searchBox>
					 	<search:input attrNameKey="sekillProduct.sekillProductName" attrPath="s.product.productName" datatype="String" operator="LIKE"/>
					
						<div class="title">秒杀时间筛选</div>
						<div>
							<select name="COL@s.sekillTime@String@EQ" id="awardLevel" style="width:150px" >
					<!--  		<c:forEach items="${awardList}" var="award">
									<option value="${award.level }"  <c:if test="${sc.param['COL@s.awardLevel@Integer@EQ'] == award.level }">selected</c:if>>${award.title }
								</c:forEach>-->	
									<option value="">所有</option>
								<option value="2015-05-08" <c:if test="${param['COL@s.sekillTime@String@EQ'] =='2015-05-08'}">selected="selected" </c:if>>2015年5月8日</option>
								<option value="2015-05-09" <c:if test="${param['COL@s.sekillTime@String@EQ'] == '2015-05-09'}">selected="selected" </c:if>>2015年5月9日</option>
								<option value="2015-05-10" <c:if test="${param['COL@s.sekillTime@String@EQ'] =='2015-05-10'}">selected="selected" </c:if>>2015年5月10日</option>
							</select>
						</div>
					</search:searchBox>
				</div>
			</div>
		</form>
	</div>
</app:ui_leftMenu>
		
		
<form class="mainForm" name="sekillProductListForm" method="post" action="${ctxPath}/sekillproduct/sekillProduct.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	<c:set var="editURLPath" value="/sekillproduct/sekillProduct.html?doAction=edit&from=list" scope="page" />
		<c:set var="checkAll"><input type="checkbox" name="allbox" onclick="checkAll(this.form)" class="checkbox"/></c:set>
		<display:table name="${sekillProductList}" cellspacing="0" cellpadding="0" uid="sekillProductItem"
			class="table-list" export="false" requestURI="">
			<display:column style="width: 3%" title="${checkAll}" media="html">
				<input type="checkbox" name="multiIds" value="${sekillProductItem.sekillProductId}" class="checkbox" title="${sekillProductItem.sekillProductName}"/>
			</display:column>
			
	<!--	<display:column sortable="false" url="${editURLPath}" paramId="sekillProductId" paramProperty="sekillProductId" title="自增长ID"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="sekillProduct.sekillProductName">
				${sekillProductItem.sekillProductId}
			</display:column>
			  -->	
		    <display:column property="productId" title="秒杀产品ID" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="sekillProduct.productId"/>
        		
        	<display:column sortable="false" paramProperty="sekillProductId" title="秒杀产品名字"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" >
				${sekillProductItem.product.productName}
			</display:column>
			
		  <display:column sortable="false" paramProperty="sekillProductId" title="品牌名字"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" >
				${sekillProductItem.product.brand.brandName}
			</display:column>
			
			<display:column  paramProperty="sekillProductId" title="产品sku"  sortable="false"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" >
				${sekillProductItem.product.defaultProductSku.productSkuCode}
			</display:column>

		    <display:column property="sekillTime"  title="秒杀时间" sortable="true" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="sekillProduct.sekillTime"/>
		    <display:column property="createTime"  title="创建时间" sortable="true" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="sekillProduct.createTime"/>
		</display:table>
		<%@include file="/common/pagingOnlyNew.jsp"%>
</form>

<script type="text/javascript">
highlightTableRows("sekillProductItem");
</script>

