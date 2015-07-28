<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "com.cartmatic.estore.common.model.order.SalesOrder"%>
<%@ page import = "com.hitrust.trustpay.client.b2c.*" %>
<%@ page import = "com.hitrust.trustpay.client.*" %>
<%@ page import = "java.util.ArrayList" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<HTML>
<HEAD><TITLE>农行网上支付平台-商户接口范例-商户订单查询</TITLE></HEAD>
<BODY BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
<CENTER>商户订单查询<br>
<%
//1、取得商户订单查询所需要的信息
SalesOrder order = (SalesOrder)request.getAttribute("salesOrder");
String tOrderNo   = order.getOrderNo();
String tQueryType = "0";
boolean tEnableDetailQuery = false;
if (tQueryType.equals("1"))
    tEnableDetailQuery = true;
    
//2、生成商户订单查询请求对象
QueryOrderRequest tRequest = new QueryOrderRequest();
tRequest.setOrderNo       (tOrderNo          );  //订单号           （必要信息）
tRequest.enableDetailQuery(tEnableDetailQuery);  //是否查询详细信息 （必要信息）

//3、传送商户订单查询请求并取得订单查询结果
TrxResponse tResponse = tRequest.postRequest();

//4、判断商户订单查询结果状态，进行后续操作
if (tResponse.isSuccess()) {
  //5、生成订单对象
  Order tOrder = new Order(new XMLDocument(tResponse.getValue("Order")));
  out.println("OrderNo      = [" + tOrder.getOrderNo     () + "]<br>");
  out.println("OrderAmount  = [" + tOrder.getOrderAmount () + "]<br>");
  out.println("OrderDesc    = [" + tOrder.getOrderDesc   () + "]<br>");
  out.println("OrderDate    = [" + tOrder.getOrderDate   () + "]<br>");
  out.println("OrderTime    = [" + tOrder.getOrderTime   () + "]<br>");
  out.println("OrderURL     = [" + tOrder.getOrderURL    () + "]<br>");
  out.println("PayAmount    = [" + tOrder.getPayAmount   () + "]<br>");
  out.println("RefundAmount = [" + tOrder.getRefundAmount() + "]<br>");
  out.println("OrderStatus  = [" + tOrder.getOrderStatus () + "]<br>");
  
  //6、取得订单明细
  ArrayList tOrderItems = tOrder.getOrderItems();
  for(int i = 0; i < tOrderItems.size(); i++) {
    OrderItem tOrderItem = (OrderItem) tOrderItems.get(i);
    out.println("ProductID   = [" + tOrderItem.getProductID  () + "]<br>");
    out.println("ProductName = [" + tOrderItem.getProductName() + "]<br>");
    out.println("UnitPrice   = [" + tOrderItem.getUnitPrice  () + "]<br>");
    out.println("Qty         = [" + tOrderItem.getQty        () + "]<br>");
  }
}
else {
  //7、商户订单查询失败
  out.println("ReturnCode   = [" + tResponse.getReturnCode  () + "]<br>");
  out.println("ErrorMessage = [" + tResponse.getErrorMessage() + "]<br>");
}
%>
<a href="${ctxPath}/order/window.html?doAction=downloadOrder&paymentMethodId=${paymentMethod.id}">下载交易对账单</a>
<a href="${ctxPath}/order/window.html?doAction=refundOrder&orderNo=${salesOrder.orderNo}&paymentMethodId=${paymentMethod.id}">订单退款</a>
</CENTER>
</BODY></HTML>