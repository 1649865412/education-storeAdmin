package com.cartmatic.estore.juankong;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.NameValuePair;

import com.cartmatic.estore.juankong.help.HttpUtils;
import com.cartmatic.estore.juankong.help.RopUtils;

/**
 * 
 * sifangstreet mingdu2013 http://b.quancome.com/loginController.do?login
 * 
 * 
 * APP_key :18_SELF_KCOUPON 秘钥:1fa335415591f33dd1a8ee6d7833dae5
 * 
 * SI_FANG_STREET_KCOUPON 01124f4b4e6f17c5e671bcac49f8248b68ec8170cdb266f7
 * 
 * http://uat.b.quancome.com/platform/api?appKey=SI_FANG_STREET_KCOUPON&method=
 * verification.authByRandCode
 * 
 * 
 * http://203.195.192.178/platform/api?appKey=18_SELF_KCOUPONmethod=verification
 * .authByRandCode&randCode
 * 
 * 签名算法 算法逻辑 券控能力开放平台的签名算法直接参考了 TOP 的签名算法,该签名算法描述如下: 所有请求参数按参数名升序排序;
 * 按请求参数名及参数值相互连接组成一个字符串 :
 * <paramName1><paramValue1><paramName2><paramValue2>...;
 * 将应用密钥分别添加到以上请求参数串的头部和尾部:<secret><请求参数字符 串><secret>; 对该字符串进行 SHA1
 * 运算,得到一个二进制数组; 将该二进制数组转换为十六进制的字符串,该字符串即是这些请求参数对应的签名;
 * 该签名值使用sign系统级参数一起和其它请求参数一起发送给服务开放平台。 假设,user.create 的服务有 3 个业务级参数,分别为
 * userName、age 及 sex。这些业务 级参数和系统级参数的值如下表所示:
 * 
 * 表格1服务参数列表 系统级别参数 参数值 业务级别参数值 参数值 appKey 001 userName Tomsn metohd user.Create
 * age 24 sex 1
 * 
 * 根据 Rop 的签名算法,首先按字母顺序将所有参数名和参数值拼装成一个字符串:
 * age24appKey0001methoduser.createsex1userNametomson
 * 
 * 假设,appKey 为001 的 secret(应用密钥)是“abcdef”,则将“abcdef”分别添加到以上请求参数串的头部和尾部,得到:
 * abcdef age24appKey0001methoduser.createsex1userNametomsonv1.0abcdef
 * 
 * 对以上字符串进行 SHA1 签名运算,将签名值转换为十六进制的编码串,得到:
 * 8625FD7EEAE1E68203B48C64DE495792BF59E833
 * 
 * 最后,客户端即可使用如下的 URL 请求串对 user.create 服务方法发起请求:
 * http://<serverUrl>/<ropServletUri>?appKey=000001&method=user.create&...
 * &sign=8625FD7EEAE1E68203B48C64DE495792BF59E833
 * 
 * 
 * 验证码验证 url http://203.195.192.178/platform/api?
 * method=verification.authByRandCode 需要加密 是 需要SESSION_ID 否 输入 appKey 应用类型
 * String randCode 验证码 String storeId 店铺 Int 输出样例 Msg 返回结果 返回信息接口参考
 * 
 * 
 * appKey 应用类型 String randCode 验证码 String storeId 店铺 Int
 * 
 * a m r s v <code>卷控接口调用测试类</code>
 * <p>
 * <p>
 * Copyright 2015 All right reserved.
 * 
 * @author admin 时间 2015-5-11 上午10:09:40
 * @version 1.0 </br>最后修改人 无
 */
public class UrlText
{
	
	//public static final String KEY = "18_SELF_KCOUPON";
	public static final String KEY = "SI_FANG_STREET_KCOUPON";
	
	//public static final String KEY_SECRET = "1fa335415591f33dd1a8ee6d7833dae5";
	public static final String KEY_SECRET = "01124f4b4e6f17c5e671bcac49f8248b68ec8170cdb266f7";
	
	//public static final String URL = "http://uat.b.quancome.com/platform/api";
	public static final String URL =  "http://b.quancome.com/platform/api";
	//public static final String METHOD = "method=verification.authByRandCode";
	
	
	// 按字母顺序排好
	public static final NameValuePair[] param =
	{     new NameValuePair("appKey", KEY),
		  new NameValuePair("method", "verification.authByRandCode"),
		  new NameValuePair("randCode", "751469"),
		  new NameValuePair("storeAccount", "sifangstreet:001"),
		  new NameValuePair("v", "2.0")
	};
	
	
	/**
	 * 功能:执行方法
	 * <p>
	 * 作者 杨荣忠 2015-5-11 上午10:06:52
	 * 
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException
	{
		String result = doPost(URL); 
		System.out.println(check(result));
	}
	
	
	
	/**
	 * 功能:卷控验证,post提交
	 * <p>作者 杨荣忠 2015-5-11 下午05:50:52
	 * @param url
	 * @return
	 * @throws IOException 
	 */
	  public static boolean doCheckJuankong(String number) throws IOException
	     {
	    	 Map<String, String> map = new HashMap<String, String>();
	    	 for(int i =0;i<param.length;i++)
	    	 {   
	    		 if(param[i].getName().equals("randCode"))
	    		 {
	    			 map.put(param[i].getName(), number); 
	    		 }
	    		 else{
	    			 map.put(param[i].getName(), param[i].getValue());
	    		 }
	    	 }
	    	//签名的时候，不需要用V版本号
	    	List<String> ignoreParamNames =new ArrayList();
	    	ignoreParamNames.add("v");
	    	
	    	map.put("sign", RopUtils.sign(map,null,KEY_SECRET));
			String temp = HttpUtils.doPost(URL, map, "UTF-8");
			//System.out.println("返回的消息是:" + temp);
	 		return check(temp);
		}
	  
	  
	
	/**
	 * 功能:最终post提交
	 * <p>作者 杨荣忠 2015-5-11 下午05:50:52
	 * @param url
	 * @return
	 * @throws IOException 
	 */
	  public static String doPost(String  url ) throws IOException
	     {
	    	 Map<String, String> map = new HashMap<String, String>();
	    	 for(int i =0;i<param.length;i++)
	    	 {
	    		 map.put(param[i].getName(), param[i].getValue());
	    	 }
	    	 
	    	//签名的时候，不需要用V版本号
	    	List<String> ignoreParamNames =new ArrayList();
	    	ignoreParamNames.add("v");
	    	
	    	map.put("sign", RopUtils.sign(map,null,KEY_SECRET));
			String temp = HttpUtils.doPost(url, map, "UTF-8");
			System.out.println("返回的消息是:" + temp);
	 		return temp;
		}
	
	  
	/**
	 * 功能:获取sign
	 * <p>
	 * 作者 杨荣忠 2015-5-11 下午02:44:33
	 * 
	 * @param urlString
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String getReturnData() throws UnsupportedEncodingException
	{
		StringBuilder stringBuffer = new StringBuilder(KEY_SECRET);
		for (NameValuePair pair : param)
		{
			stringBuffer.append(pair.getName()).append(pair.getValue());
		}
		stringBuffer.append(KEY_SECRET);
		System.out.println("stringBuffer:===============" + stringBuffer.toString());
		System.out.println("makeSHA1:===============" + makeSHA1(stringBuffer.toString()));
		return makeSHA1(stringBuffer.toString());
	}
	
	
	
	/**
	 * 功能:返回的消息是:{"code":0,"event":"0","msg":"success",
	 * "obj":{"customerId":33745,"endTime":1431679059644,
	 * "id":2579,"modelCount":1,"modelId":819,"qrCodeUrl":"20150515/20150515163439Pm5avk1U.jpg",
	 * "randCode":"751469","sourceId":0,"sourceType":2,"startTime":1431678879644}}
	 * <p>作者 杨荣忠 2015-5-18 上午11:36:33
	 * @param result
	 * @return
	 */
	public static boolean check(String result){
		boolean flag=false;
		String yes = "\"code\":0";
		if(result.contains(yes))
		{
			flag=true;
		}
		return flag;
	}
	
	
	/**
	 * 功能: SHA1加密
	 * <p>
	 * 作者 杨荣忠 2015-5-11 下午02:44:49
	 * 
	 * @param source
	 * @return
	 */
	public static String makeSHA1(String source)
	{
		try
		{
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(source.getBytes("UTF-8"), 0, source.length());
			byte[] result = md.digest();
			StringBuilder buffer = new StringBuilder();
			for (byte b : result)
			{
				int i = b & 0xff;
				if (i < 0xf)
				{
					buffer.append(0);
				}
				buffer.append(Integer.toHexString(i));
			}
			return buffer.toString();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return source;
	}
}
