<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>

<app:pageHeading entityName="${sekillProduct.sekillProductName}"
	entityHeadingKey="sekillProductDetail.heading" />
	
<content tag="buttons">
<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoSave(this);" />
<%--
	<cartmatic:cartmaticBtn btnType="saveAndNext" onclick="return fnDoSaveAndNext(this);" />
	--%>
<c:if test="${sekillProduct.sekillProductId!=null}">
	<cartmatic:cartmaticBtn btnType="delete"
		onclick="return fnDoDelete(this);" />
</c:if>
<cartmatic:cartmaticBtn btnType="cancel"
	onclick="return fnDoCancelForm(this);" />
</content>
<app:showBindErrors bindPath="sekillProduct.*" />

<form:form method="post" cssClass="mainForm" id="sekillProduct"
	commandName="sekillProduct"
	action="${ctxPath}/sekillproduct/sekillProduct.html"
	onsubmit="return validateSekillProduct(this);">
	<input type="hidden" name="sekillProductId"
		value="${sekillProduct.sekillProductId}" />

	<table class="table-content" cellSpacing="0" cellPadding="0"
		width="100%" border="0">

		<tr>
			<td class="FieldLabel">
				<span> <c:if test="${sekillProduct.sekillProductId==null}">产品选择：</c:if>
					<c:if test="${sekillProduct.sekillProductId!=null}">产品名字：</c:if> </span>
			</td>
			<td>
				<c:if test="${sekillProduct.sekillProductId==null}">
					<input type="button" value="点击添加" id="b5" />
					<product:productSkuSelector id="multiSelect_productSkuSelector"
						showSelectorBtnId="b5" title="产品选择"
						ondblclick="fnTestSelectMultiProductSku" showProductKinds="1,2"
						multiSelect="true"></product:productSkuSelector>
						<span id="arrayproductName"></span>
				</c:if>
				
				<c:if test="${sekillProduct.sekillProductId!=null}">
					<span id="arrayproductName">${sekillProduct.sekillProductName}</span>
				</c:if>
				
				<input type="hidden" id="arrayproductId" name="arrayproductId"
					value="${sekillProduct.product.productId}" />
			</td>
		</tr>
		<tr>
			<td class="FieldLabel">
				<span id="b5">秒杀时间${sekillProduct.sekillTime}：</span>
				<product:productSkuSelector id="multiSelect_productSkuSelector"
					showSelectorBtnId="b5" title="产品选择"
					ondblclick="fnTestSelectMultiProductSku" showProductKinds="1,2"
					multiSelect="true"></product:productSkuSelector>
			</td>
			<td>
				<select name="sekillTime" id="awardLevel" style="width: 150px">
					<option value="2015-05-08"
						<c:if test="${sekillProduct.sekillTime=='2015-05-08'}">selected="selected" </c:if>>
						2015年5月8日
					</option>
					<option value="2015-05-09"
						<c:if test="${sekillProduct.sekillTime == '2015-05-09'}">selected="selected" </c:if>>
						2015年5月9日
					</option>
					<option value="2015-05-10"
						<c:if test="${sekillProduct.sekillTime =='2015-05-10'}">selected="selected" </c:if>>
						2015年5月10日
					</option>
				</select>
			</td>
		</tr>
	</table>
</form:form>


<v:javascript formName="sekillProduct" staticJavascript="false" />
<script type="text/javascript">
	document.forms["sekillProduct"].elements["productId"].focus();
</script>



<script type="text/javascript">
	function senData(arrayproductId, arrayproductName) {
		//alert(arrayproductId);
		//alert(arrayproductName);
		 arrayproductIdvalue=$j("#arrayproductId").val();
		 arrayproductNamevalue=$j("#arrayproductName").html();
		// alert("arrayproductIdvalue:"+arrayproductIdvalue);
		// alert("arrayproductName:"+arrayproductNamevalue);
		 if(arrayproductIdvalue==""){
			 arrayproductIdvalue="";
			// alert("arrayproductIdvalue:"+arrayproductIdvalue);
			 }else{
				 arrayproductIdvalue+=",";
				 }
		 if(arrayproductNamevalue==""){
			 arrayproductNamevalue="";
			// alert("arrayproductNamevalue:"+arrayproductNamevalue);
			 }else{
				 arrayproductNamevalue+=",";
				 }
		$j("#arrayproductId").val(arrayproductIdvalue+arrayproductId);
		$j("#arrayproductName").html(arrayproductNamevalue+arrayproductName);
	}

	function fnTestSelectMultiProductSku(productSkuList) {
		//alert("fnTestSelectMultiProductSku")
		var data = "";
		var arrayproductId = new Array();
		var arrayproductName = new Array();
		for ( var i = 0; i < productSkuList.length; i++) {
			var productSku = productSkuList[i];
			data += "productSkuCode:" + productSku.productSkuCode + "\n";
			data += "productSkuId:" + productSku.productSkuId + "\n";
			data += "price:" + productSku.price + "\n";
			data += "salePrice:" + productSku.salePrice + "\n";
			data += "image:" + productSku.image + "\n";
			data += "productId:" + productSku.product.productId + "\n";
			data += "productName:" + productSku.product.productName + "\n";
			data += "productCode:" + productSku.product.productCode + "\n";
			data += "brandId:" + productSku.product.brand.brandId + "\n";
			data += "brandName:" + productSku.product.brand.brandName + "\n";
			arrayproductId[i] = productSku.product.productId;
			arrayproductName[i] = productSku.product.productName;
		}
	    //alert(arrayproductId.join());
		//alert(arrayproductName.join());
		senData(arrayproductId.join(), arrayproductName.join());
	}
</script>


