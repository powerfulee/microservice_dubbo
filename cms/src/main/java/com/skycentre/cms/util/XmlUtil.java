package com.skycentre.cms.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPInputStream;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

/**
 * <p>
 * Title:读取XML文件的实用类
 * </p>
 * @author
 * @version 1.0
 */
public class XmlUtil {
	private XmlUtil() {
    }

    /**
     * 从文件名初始化，如初始化成功返回ROOT，否则返回NULL
     * @param xmlSource
     */
    static public Document parseXml(String xmlSource) throws Exception {
        if (xmlSource == null) {
            return null;
        }
        InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(xmlSource);
        return parseXml(in);
    }

    /**
     * 从文件名初始化，如初始化成功返回ROOT，否则返回NULL
     * @param xmlSource
     */
    static public Document parseXml(byte[] xmlData) throws Exception {
        if (xmlData == null) {
            return null;
        }

        java.io.ByteArrayInputStream in = new ByteArrayInputStream(xmlData);
        return parseXml(in);
    }

    /**
     * 从XML文件输入流初始化，如初始化成功返回true，否则返回false
     */
    static public Document parseXml(File xmlFile) throws Exception {
        if (xmlFile == null || !xmlFile.exists()) {
            return null;
        }
        Document root = null;
        java.io.InputStream in = null;
        try {
            in = new java.io.FileInputStream(xmlFile);
            SAXReader saxReader = new SAXReader();
            saxReader.setValidation(false);

            root = saxReader.read(in);
            return root;
        } catch (Exception e) {
            System.err.println("解析XML输入流出现异常，请检查XML输入流是否正确:" + xmlFile.getName());
            throw e;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 从XML文件输入流初始化，如初始化成功返回true，否则返回false
     */
    static public Document parseXml(InputStream in) throws Exception {
        if (in == null) {
            return null;
        }
        Document root = null;
        try {
            SAXReader saxReader = new SAXReader();
            saxReader.setValidation(false);
            root = saxReader.read(in);
            return root;
        } catch (Exception e) {
            System.err.println("解析XML输入流出现异常，请检查XML输入流是否正确:" + in);
            throw e;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                }
            }
        }
    }
    
    static public Document parseXml(GZIPInputStream in) throws Exception {
        if (in == null) {
            return null;
        }
        Document root = null;
        try {
            SAXReader saxReader = new SAXReader();
            saxReader.setValidation(false);
            root = saxReader.read(in);
            return root;
        } catch (Exception e) {
            System.err.println("解析XML输入流出现异常，请检查XML输入流是否正确:" + in);
            throw e;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 检查某路径的节点配置是否存在
     * @param xql
     * @return
     */
    static public boolean isNodeExists(Node startNode, String xql) {
        if (startNode == null || xql == null) {
            return false;
        }

        Node node = startNode.selectSingleNode(xql);
        return (node != null);
    }

    /**
     * 根据相对节点，获取配置项值。
     * @param startNode 相对节点
     * @param xql 相对startNode表示的配置项路径
     */
    static public String getString(Node startNode, String xql) {
        if (startNode == null || xql == null) {
            return null;
        }

        Node node = startNode.selectSingleNode(xql);
        if (node != null) {
            return node.getText();
        } else {
            return null;
        }
    }

    /**
     * 获取配置项
     * @param xql
     * @return
     */
    static public String getString(Node startNode, String xql, String def) {
        if (startNode == null || xql == null) {
            return def;
        }

        Node node = startNode.selectSingleNode(xql);
        if (node != null) {
            return node.getText();
        } else {
            return def;
        }
    }

    /**
     * 获取int类型的配置项，如该项不存在或不能转为int，则返回默认值。
     *
     * @param xql
     *            XPATH表示的配置项路径
     * @param def
     *            默认值
     * @return
     */
    static public int getInt(Node startNode, String xql, int def) {
        String nValue = getString(startNode, xql);
        try {
            return Integer.parseInt(nValue);
        } catch (Exception e) {
            return def;
        }
    }

    /**
     * 获取float类型的配置项，如该项不存在或不能转为float，则返回默认值。
     *
     * @param xql
     *            XPATH表示的配置项路径
     * @param def
     *            默认值
     * @return
     */
    static public float getFloat(Node startNode, String xql, float def) {
        String nValue = getString(startNode, xql);
        try {
            return Float.parseFloat(nValue);
        } catch (Exception e) {
            return def;
        }
    }

    /**
     * 获取long类型的配置项，如该项不存在或不能转为long，则返回默认值。
     *
     * @param xql XPATH表示的配置项路径
     * @param def 默认值
     * @return
     */
    static public long getLong(Node startNode, String xql, long def) {
        String nValue = getString(startNode, xql);
        try {
            return Long.parseLong(nValue);
        } catch (Exception e) {
            return def;
        }
    }

    /**
     * 设置节点的值
     * @param startNode 相对节点
     * @param xql 相对startNode表示的配置项路径
     */
    static public boolean setNodeValue(Node startNode, String xql, String nodeValue) {
        if (startNode == null || xql == null) {
            return false;
        }

        Node node = startNode.selectSingleNode(xql);
        if (node != null) {
            node.setText(nodeValue);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 设置节点的值
     * @param startNode 相对节点
     * @param xql 相对startNode表示的配置项路径
     */
    static public boolean setNodePropertyValue(Node startNode, String xql, String propertyName, String nodeValue) {
        if (startNode == null || xql == null) {
            return false;
        }

        Element node = (Element) startNode.selectSingleNode(xql);
        if (node != null) {
            node.attribute(propertyName).setText(nodeValue);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 转换为字符串
     * @param doc Document
     * @return String
     */
    public static String tranToString(Document doc) {
        org.dom4j.io.XMLWriter writer = null;
        ByteArrayOutputStream byteStream = null;
        try {
            byteStream = new ByteArrayOutputStream();
            writer = new org.dom4j.io.XMLWriter(byteStream, new org.dom4j.io.OutputFormat("", false, "GBK"));
            writer.write(doc);
            return byteStream.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (byteStream != null) {
                try {
                    byteStream.close();
                } catch (IOException ex) {
                }
            }
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException ex) {
                }
            }
        }
        return null;
    }

    /**
     * 输出节点的内容并关闭输出流
     * @param root Node
     * @param out OutputStream
     * @param indent boolean 是否要输出空格
     * @param newLine boolean 是否要换行
     */
    static public void printAndClose(Node root, OutputStream out, boolean indent, boolean newLine) {
        org.dom4j.io.XMLWriter writer = null;
        try {
            org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
            format.setEncoding("GBK");
            format.setIndent(indent);
            format.setNewlines(newLine);
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 输出节点的内容并关闭输出流
     * @param root Node
     * @param out OutputStream
     */
    static public void printAndClose(Node root, OutputStream out) {
        org.dom4j.io.XMLWriter writer = null;
        try {
            org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
            format.setEncoding("GBK");
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 输出节点的内容
     * @param root Node
     * @param out OutputStream
     */
    static public void print(Node root, OutputStream out) {
        org.dom4j.io.XMLWriter writer = null;
        org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
        format.setEncoding("GBK");
        format.setTrimText(true);
        format.setIndent(false);
        try {
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.flush();
            } catch (Exception e) {
            }
        }
    }

    /**
     * 输出节点的内容
     * @param root Node
     * @param out OutputStream
     */
    static public void print(Node root, OutputStream out, String charSet) {
        org.dom4j.io.XMLWriter writer = null;
        org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
        format.setEncoding(charSet);
        format.setTrimText(true);
        format.setIndent(false);
        try {
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.flush();
            } catch (Exception e) {
            }
        }
    }

    /**
     * 输出节点的内容并关闭输出流
     * @param root Node
     * @param out OutputStream
     */
    static public void printAndClose(Node root, OutputStream out, String charSet) {
        org.dom4j.io.XMLWriter writer = null;
        try {
            org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
            format.setEncoding(charSet);
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null)
                try {
                    out.close();
                } catch (Exception e) {}
        }
    }


    /**
     * 输出节点的内容到文件
     * @param root Node
     * @param out OutputStream
     */
    static public void printToFile(Node root, String saveTo , String charSet) {
        org.dom4j.io.XMLWriter writer = null;
        java.io.PrintWriter out = null ;
        try {
            File toFile = new File(saveTo) ;
            toFile.getParentFile().mkdirs();
            out = new java.io.PrintWriter(new java.io.OutputStreamWriter(new java.io.FileOutputStream(toFile), charSet)) ;
            org.dom4j.io.OutputFormat format = new org.dom4j.io.OutputFormat();
            format.setEncoding(charSet);
            writer = new org.dom4j.io.XMLWriter(out, format);
            writer.write(root);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null)
                try {
                    out.close();
                } catch (Exception e) {
                	e.printStackTrace();
                }
        }
    }

    static public void main(String[] args) {
        try {
            Document root = XmlUtil.parseXml("com/temobi/job/xml/output.xml");
            XmlUtil.setNodeValue(root, "/my:Contents/my:Content/my:Name", "测试值") ;
            XmlUtil.print(root, System.out ,"UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
