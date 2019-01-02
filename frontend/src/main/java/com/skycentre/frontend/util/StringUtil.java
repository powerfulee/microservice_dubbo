package com.skycentre.frontend.util;

import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.parser.Parser;

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

	/**
	 * 截取指定长度的html字符串,标签闭合,采用Jsoup解析
	 * 
	 * @param str
	 *            待处理的html字符串
	 * @param num
	 *            需要截取的长度
	 * @param isImgEnable
	 *            是否剔除图片,因为一般摘要不显示图,如果不需要就用false,摘要需要图就用true
	 * @return 处理过的字符串
	 */
	public static String cutPrettyHtmlString(String str, int num, boolean isImgEnable) {

		String returnStr = "";
		int remainNum = num;

		Document doc = Jsoup.parse(str, "", Parser.xmlParser());

		List<Node> nodes = doc.childNodes();

		Node node = null;
		String tempStr = null;
		List<Node> tempNodes;
		Element tempNode = null;
		String tempStartTagString;
		String tempEndTagString;
		String tempTagString;
		String tempTagChildString;
		String tempCutStr;
		for (Iterator<Node> iterator = nodes.iterator(); iterator.hasNext();) {
			node = iterator.next();

			// 如果是文本节点,则直接拼接文本字符串
			if (node instanceof TextNode) {
				// node存在肯定不会为null
				tempStr = node.toString().trim();
				if (tempStr.length() < remainNum) {
					// 如果当前文本小于需要截取的长度,则全部拼接
					returnStr += tempStr;
				} else {
					// 如果大于或等于截取的长度,则只截取remainNum的长度
					returnStr += tempStr.substring(0, remainNum);
				}
				// 更新剩余截取任务量
				remainNum -= tempStr.length();
			} else {
				tempNodes = node.childNodes();
				if (tempNodes == null || tempNodes.size() == 0) {
					// 说明是直接闭合的元素节点,如<br/>、<img>等等,应该不占字符长度原样拼接
					if (!isImgEnable && node.nodeName().equalsIgnoreCase("img")) {
						// 如图摘要不含图片,应把图片剔除
						continue;
					}
					returnStr += node.toString();
				} else {
					// 如果是style标签,应该原样输出
					if (node.nodeName().equalsIgnoreCase("style")) {
						returnStr += node.toString();
						continue;
					}
					// 如果是一般含子元素的元素节点,把自身元素标签部分拼接,对子元素则递归拼接
					// 深拷贝,为的是排除子节点,获取自身文本
					// <p align='center'><strong>tttttttt</strong></p>---><p
					// align='center'>递归(<strong>tttttttt</strong>)</p>
					tempNode = (Element) node.clone();
					tempTagChildString = tempNode.html();
					tempNode.empty();
					tempEndTagString = "</" + tempNode.tagName() + ">";
					tempTagString = tempNode.toString();
					tempStartTagString = tempTagString.substring(0, tempTagString.indexOf(tempEndTagString));
					returnStr += tempStartTagString;
					tempCutStr = cutPrettyHtmlString(tempTagChildString, remainNum, isImgEnable);
					returnStr += tempCutStr;
					remainNum -= tempCutStr.length();
					returnStr += tempEndTagString;
				}

			}

			if (remainNum <= 0) {
				// 跳出递归条件,即剩余任务为0
				break;
			}

		}
		return returnStr;
	}

	//删除html标签
	public static String htmlRemoveTag(String inputString) {
		if (inputString == null)
			return null;
		String htmlStr = inputString; // 含html标签的字符串
		String textStr = "";
		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;
		try {
			// 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
			// 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签
			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签
			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签
			textStr = htmlStr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return textStr;// 返回文本字符串
	}
	
	public static String getImgTag(String html) {
		String reg = "(?i)[\\s\\S]*(\\<img\\s*alt\\s*\\=.*?src\\s*\\=.*?\\/?\\>)[\\s\\S]*";
		Pattern pattern = Pattern.compile (reg);
		Matcher matcher = pattern.matcher (html);
		
		String imgTag = "";
		while (matcher.find ())
		{
		    imgTag = matcher.group ().replaceAll (reg, "$1");
		}
		
		return imgTag;
	}
	
	public static void main(String[] args) {
		/*String img = "sdf<img src=\"ss\"  width=\"232\" alt=\"df\" />sdf" +
		         "<img alt=\"helloworld\" border=\"1\" height=\"100\" src=\"abadd爱的发撒的发到付fac.jsdfasdfpg\" />sdfsd" +
		         "<img src=*  width=* alt=*>";*/
		/*String img = "<p><img alt=\"\" src=\"http://192.168.2.29:8080/pic/article/20171124/1511504649728_small.jpg\" style=\"height:461px; width:616px\" /><br />\r\n" + 
				"最近很少写博客，一是我忙、二是我懒。特别是我注册了腾讯的微博之后就更有理由";*/
		String img = "最近很少写博客，一是我忙、二是我懒。特别是我注册了腾讯的微博之后就更有理由";
		String reg = "(?i)[\\s\\S]*(\\<img\\s*alt\\s*\\=.*?src\\s*\\=.*?\\/?\\>)[\\s\\S]*";
		// System.out.print (img.replaceAll (reg, "$1"));
		Pattern pattern = Pattern.compile (reg);
		Matcher matcher = pattern.matcher (img);
		while (matcher.find ())
		{
		    //System.out.println (matcher.group ().replaceAll (reg, "$1"));
		}
		
		System.out.println(getImgTag(img));
	}
}
