package com.skycentre.cms.util;

import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtil {
	/** 
     * 获取图片宽度 
     * @param file  图片文件 
     * @return 宽度 
     */  
    public static int getImgWidth(File file) {  
        InputStream is = null;  
        BufferedImage src = null;  
        int ret = -1;  
        try {  
            is = new FileInputStream(file);  
            src = javax.imageio.ImageIO.read(is);  
            ret = src.getWidth(null); // 得到源图宽  
            is.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return ret;  
    }  
      
    /** 
     * 获取图片高度 
     * @param sourcePath  图片路径 
     * @return 宽度 
     */  
    public static int getImgWidth(String sourcePath) {  
       File file=new File(sourcePath);  
       return getImgWidth(file);  
    }  
      
    /** 
     * 获取图片高度 
     * @param file  图片文件 
     * @return 高度 
     */  
    public static int getImgHeight(File file) {  
        InputStream is = null;  
        BufferedImage src = null;  
        int ret = -1;  
        try {  
            is = new FileInputStream(file);  
            src = javax.imageio.ImageIO.read(is);  
            ret = src.getHeight(null); // 得到源图高  
            is.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return ret;  
    }  
      
    /** 
     * 获取图片高度 
     * @param sourcePath  图片路径 
     * @return 高度 
     */  
    public static int getImgHeight(String sourcePath) {  
         File file=new File(sourcePath);  
         return getImgHeight(file);  
    }  
  
    /** 
     * 图片裁切 
     * 选择的总区域必须与图片原始大小相同 
     * @param X 选择区域左上角的x坐标 
     * @param Y 选择区域左上角的y坐标 
     * @param width 选择区域的宽度 
     * @param height 选择区域的高度 
     * @param sourcePath 源图片路径 
     * @param descpath 裁切后图片的保存路径 
     */  
    public static void cut(int X, int Y, int width, int height,  
            String sourcePath, String descpath) {  
  
        FileInputStream is = null;  
        ImageInputStream iis = null;  
        try {  
            is = new FileInputStream(sourcePath);  
            String fileSuffix = sourcePath.substring(sourcePath  
                    .lastIndexOf(".") + 1);  
            Iterator<ImageReader> it = ImageIO  
                    .getImageReadersByFormatName(fileSuffix);  
            ImageReader reader = it.next();  
            iis = ImageIO.createImageInputStream(is);  
            reader.setInput(iis, true);  
            ImageReadParam param = reader.getDefaultReadParam();  
            Rectangle rect = new Rectangle(X, Y, width, height);  
            param.setSourceRegion(rect);  
            BufferedImage bi = reader.read(0, param);  
            ImageIO.write(bi, fileSuffix, new File(descpath));  
            System.out.println("图片剪切成功,生成图片路径:"+descpath);  
        } catch (Exception ex) {  
            ex.printStackTrace();  
        } finally {  
            if (is != null) {  
                try {  
                    is.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
                is = null;  
            }  
            if (iis != null) {  
                try {  
                    iis.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
                iis = null;  
            }  
        }  
  
    }  
  
    /** 
     * 图片裁切 
     * 选择的总区域与图片原始大小不同 
     * @param selectWidth 选择区域的宽度 
     * @param selectHeight 选择区域的高度 
     * @param selectX 选择区域左上角的x坐标 
     * @param selectY 选择区域左上角的y坐标 
     * @param areaWidth 选择区域总宽度 
     * @param areaHeight 选择区域总高度 
     * @param sourcePath 源图片路径 
     * @param descpath 裁切后图片的保存路径 
     */  
    public static void cut(int areaWidth, int areaHeight,int selectX, int selectY, int selectWidth, int selectHeight,String sourcePath, String descpath) {  
        int imgWidth=getImgWidth(sourcePath);  
        int imgHeight=getImgHeight(sourcePath);  
        int X=selectX*imgWidth/areaWidth;  
        int Y=selectY*imgHeight/areaHeight;  
        int width=selectWidth*imgWidth/areaWidth;  
        int height=selectHeight*imgHeight/areaHeight;  
        cut(X, Y, width, height, sourcePath, descpath);  
    }  
    
	//图片处理
	public static String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName,
			int outputWidth, int outputHeight, boolean proportion) {
		try {
			//获得源文件
			File file = new File(inputDir + inputFileName);
			if (!file.exists()) {
				return "";
			}
			Image img = ImageIO.read(file);
			//判断图片格式是否正确
			if (img.getWidth(null) == -1) {
				System.out.println(" can't read,retry!" + "<BR>");
				return "no";
			} else {
				int newWidth;
				int newHeight;
				//判断是否是等比缩放
				if (proportion == true) {
					//为等比缩放计算输出的图片宽度及高度
					double rate1 = ((double) img.getWidth(null)) / (double) outputWidth + 0.1;
					double rate2 = ((double) img.getHeight(null)) / (double) outputHeight + 0.1;
					//根据缩放比率大的进行缩放控制
					double rate = rate1 > rate2 ? rate1 : rate2;
					newWidth = (int) (((double) img.getWidth(null)) / rate);
					newHeight = (int) (((double) img.getHeight(null)) / rate);
				} else {
					newWidth = outputWidth; //输出的图片宽度
					newHeight = outputHeight; //输出的图片高度
				}
				BufferedImage tag = new BufferedImage((int) newWidth, (int) newHeight, BufferedImage.TYPE_INT_RGB);

				/*
				 * Image.SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的 优先级比速度高 生成的图片质量比较好 但速度慢
				 */
				tag.getGraphics().drawImage(img.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH), 0, 0, null);
				FileOutputStream out = new FileOutputStream(outputDir + outputFileName);
				// JPEGImageEncoder可适用于其他图片类型的转换
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				encoder.encode(tag);
				out.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return "ok";
	}

	public static void main(String[] arg) throws Exception {
		//compressPic("D:\\data\\blog\\article\\20171124\\", "D:\\data\\blog\\article\\20171124\\", "20171124092945.png","20171124092945_samll.jpg", 658, 658, true);
		
		ImageUtil.cut(0, 0, 658, 658, "D:/data/blog/article/20171124/1511498717128.png", "D:/data/blog/article/20171124/1511498717128_small.png");  
	}
}
