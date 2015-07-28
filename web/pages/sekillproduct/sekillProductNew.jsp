<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/decorators/include/styles.jspf"%>
<%@ include file="/decorators/include/javascripts.jspf"%>

<script type="text/javascript">
highlightTableRows("salesOrderItem");
$j(document).ready(function(){
    	var $tabs = $j("#left_menu_tabs").appTabs();
    	<c:if test="${sc.param['SRH@filter'] == 'default'}">$tabs.appTabs("select", 1);</c:if>
		btnToP();
});
</script>

<app:pageHeading pageHeadingKey="sekillProductList.heading" />

<content tag="buttons">
<cartmatic:cartmaticBtn btnType="create" inputType="button"
	onclick="return fnDoAdd(this);" />
<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
<cartmatic:cartmaticBtn btnType="delete"
	onclick="return fnDoMultiDelete(this);" />
<!--<<cartmatic:cartmaticBtn btnType="cancel" inputType="button" onclick="return fnDoUpToParent(this);" />-->

</content>

<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/sekillproduct/sekillProduct.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
					<li><a href="#orderView"><fmt:message key="salesOrderList.tab.view"/></a></li>
					<li><a href="#glSearchBar"><fmt:message key="yourposition.search"/></a></li>
				</ul>
					<div id="listSelectContent" class="content">
					<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true});" href="javascript:void(false);"><fmt:message key="search.filter.all"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'ask4Cancel'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.ask4Cancel"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'awaitingPicking'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.awaitingPicking"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'picking'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.picking"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'partiallyShipped'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.partiallyShipped"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'finished'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.finished"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'partiallyPaid'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.partiallyPaid"/></a><td></tr>
						<%-- <tr height="30px"><td><a href="${ctxPath}/order/salesOrder.html?search=confirmedByRobot&btnSearch=true"><fmt:message key="salesOrder.view.confirmedByRobot"/></a><td></tr>--%>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'newMessages'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.newMessages"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'hasProblem'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.hasProblem"/></a><td></tr>
						<tr><td><hr/><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:1});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_1"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:2});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_2"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:3});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_3"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:7});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_7"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:9});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_9"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:10});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_10"/></a><td></tr>
					</table>
					<br/><br/><br/><br/>
				</div>
					<div id="orderView" class="content">
					<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
						
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'hasProblem'});" href="javascript:void(false);"><fmt:message key="salesOrder.view.hasProblem"/></a><td></tr>
						<tr><td><hr/><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:1});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_1"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:2});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_2"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:3});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_3"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:7});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_7"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:9});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_9"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:10});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_10"/></a><td></tr>
					</table>
					<br/><br/><br/><br/>
				</div>
				
				<div id="glSearchBar" class="content">
					<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:9});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_9"/></a><td></tr>
						<tr height="30px"><td><a onclick="fnSearchSalesOrder({btnSearch:true,search:'payment',paymentType:10});" href="javascript:void(false);"><fmt:message key="salesOrder.view.paymentType_10"/></a><td></tr>
					</table>
					<br/><br/><br/><br/>
				</div>
				
				
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

<table>
	<tr>
		<td>
			<a
				onclick="$j(this).closest('tr').nextAll().toggle();$j(this).children('img').toggle();"
				href="javascript:void(false)"> <img
					src="${ctxPath}/images/minus.gif" style="display: none" /> <img
					src="${ctxPath}/images/plus.gif" /> &nbsp;&nbsp;下拉测试
				${orderShipment.shipmentNo} </a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			下拉内容测试哈哈
		</td>
	</tr>
</table>


<input id="ClickMe" name="ClickMe" type="button" value="DialogFromTag" />
<app:ui_dialog id="tttt" width="700" height="300" title="测试"
	showDialogBtnId="ClickMe">
	<span>测试弹出窗</span>
	<input id="datePicker" name="datePicker" type="text" />
	<input type="button" onclick="test();" />
</app:ui_dialog>

<div id="productTab2">
	<ul>
		<li>
			<a href="#productInfo">基本信息1</a>
		</li>
		<li>
			<a href="#productSkuInfo">基本信息2</a>
		</li>
		<li class="selected">
			<a href="#featureInfo">基本信息3</a>
		</li>
		<li>
			<a href="#seoInfo">搜索基本信息4</a>
		</li>
	</ul>

	<div id="productInfo" style="display: none">
		a
	</div>
	<div id="productSkuInfo" style="display: none">
		b
	</div>
	<div id="featureInfo" style="display: none">
		c
	</div>
	<div id="seoInfo" style="display: none">
		d
	</div>
</div>
<app:ui_tabs tabsId="productTab2" type="2" selected="0" />


<form class="mainForm" name="sekillProductListForm" method="post"
	action="${ctxPath}/sekillproduct/sekillProduct.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	<c:set var="editURLPath"
		value="/sekillproduct/sekillProduct.html?doAction=edit&from=list"
		scope="page" />
	<c:set var="checkAll">
		<input type="checkbox" name="allbox" onclick="checkAll(this.form)"
			class="checkbox" />
	</c:set>
	<display:table name="${sekillProductList}" cellspacing="0"
		cellpadding="0" uid="sekillProductItem" class="table-list"
		export="false" requestURI="">
		<display:column style="width: 3%" title="${checkAll}" media="html">
			<input type="checkbox" name="multiIds"
				value="${sekillProductItem.sekillProductId}" class="checkbox"
				title="${sekillProductItem.sekillProductName}" />
		</display:column>

		<!--	<display:column sortable="false" url="${editURLPath}" paramId="sekillProductId" paramProperty="sekillProductId" title="自增长ID"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="sekillProduct.sekillProductName">
				${sekillProductItem.sekillProductId}
			</display:column>
			  -->
		<display:column property="productId" title="秒杀产品ID" sortable="false"
			headerClass="data-table-title"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator"
			titleKey="sekillProduct.productId" />

		<display:column sortable="false" paramProperty="sekillProductId"
			title="秒杀产品名字"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator">
				${sekillProductItem.product.productName}
			</display:column>

		<display:column sortable="false" paramProperty="sekillProductId"
			title="品牌名字"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator">
				${sekillProductItem.product.brand.brandName}
			</display:column>

		<display:column paramProperty="sekillProductId" title="产品sku"
			sortable="false"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator">
				${sekillProductItem.product.defaultProductSku.productSkuCode}
			</display:column>

		<display:column property="sekillTime" title="秒杀时间" sortable="true"
			headerClass="data-table-title"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator"
			titleKey="sekillProduct.sekillTime" />
		<display:column property="createTime" title="创建时间" sortable="true"
			headerClass="data-table-title"
			decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator"
			titleKey="sekillProduct.createTime" />
	</display:table>
	<%@include file="/common/pagingOnlyNew.jsp"%>
</form>

<script type="text/javascript">
highlightTableRows("sekillProductItem");
</script>

