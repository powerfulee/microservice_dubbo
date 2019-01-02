package com.skycentre.provider.util;

import java.net.InetAddress;

import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

public class StringUtil {
	private StringUtil() {
	}

	public static String nullToString(String value) {
		return value == null ? "" : value.trim().toString();
	}

	public static String nullToString2(String value) {
		return value == null ? "" : value.toString();
	}

	public static int nullToInteger(String value) {
		int ret = 0;
		try {
			ret = (value == null) ? null : Integer.parseInt(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static int nullToInteger(String value, int def) {
		int ret = def;
		try {
			ret = (value == null) ? def : Integer.parseInt(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static Long nullToLong(String value) {
		long ret = 0;
		try {
			ret = (value == null) ? null : Long.parseLong(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static Long nullToLong(String value, Long def) {
		long ret = def;
		try {
			ret = (value == null) ? def : Long.parseLong(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static String trim(Object str){
		return "";
	}
	
	public static void main(String[] args) {
		try {
			Client client = null;
			client = TransportClient.builder().build()
					.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("192.168.3.41"), 9300));

			IndicesExistsResponse response = client.admin().indices()  
					.prepareExists("blog_index", "blog_index")  
					.execute().actionGet();  
			
			if (response.isExists()){
				DeleteIndexResponse delete = client.admin().indices()  
						.prepareDelete("blog_index")  
						.execute().actionGet(); 
				if ( delete.isContextEmpty() ){ 
        			System.out.println("deleted!");
        		}
			}else{
				System.out.println("faile");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
