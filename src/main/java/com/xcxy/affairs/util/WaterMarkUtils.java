package com.xcxy.affairs.util;

import javax.imageio.ImageIO;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
/*给图片加水印*/
public class WaterMarkUtils {
	public static void main(String[] args) throws IOException {
       
	    }
	public static Image getImage(String content1,String content2,String content3,File file) throws IOException{
		 //创建源文件
        //File file = new File("D:/17031javaee/环境/jdk/jsvs阶段补习/Usermanager/src/main/webapp/static/images/招聘广告.jpg");
        //用ImageIO处理图片文件
        Image img = ImageIO.read(file);
        //获取图片高度和宽度
        int width = img.getWidth(null);
        int height = img.getHeight(null);
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //开始添加水印
        Graphics g = image.createGraphics();
        //确定图片尺寸
        g.drawImage(img,0,0,width,height,null);
        //设置颜色——这里设置为红色
        g.setColor(new Color(255,0,0));
        //字体
        g.setFont(new Font("微软雅黑",Font.PLAIN,20));
        //写进去
        g.drawString(content1,0,height/10);
        g.drawString(content2,0,height/6);
        g.drawString(content3,0,height/4);
        g.dispose();
		return image;
	}
	//发布公告
	public static Image getImage2(String content1,String content2,File file) throws IOException{
		
	   content2="一一一一"+content2+"宣";
		 //创建源文件
       //File file = new File("D:/17031javaee/images/花边.jpg");//用图片高度除以字体高度，可得到该图一行可印20字
       //用ImageIO处理图片文件
	   System.out.println(file);
       Image img = ImageIO.read(file);
       //获取图片高度和宽度
       int width = img.getWidth(null);//宽度
       int height = img.getHeight(null);//高度
       //生成新图片
       BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
       //开始添加水印
       Graphics g = image.createGraphics();
       //确定图片尺寸
       g.drawImage(img,0,0,width,height,null);
       //设置颜色——这里设置为红色
       g.setColor(new Color(255,0,0));
       //字体-20是字体高度和宽度
       //图片高度除以文字高度久能得到可以加入多少行文字
       //同理图片宽度除以文字宽度就能得到每行可以印多少个字符
       g.setFont(new Font("微软雅黑",Font.PLAIN,20));
       //输入字符串长度
       int len=content1.length();
       //得到有多少行文字
       int num=len/20;
       if(len%20>0){
    	   num+=1;
       }
       for(int i=0;i<num;i++){
    	 //把传过来的字符串每20个字符分割
    	   //第一行18字，前面两空格
    	   if(len<=18){
    		   g.drawString(content1.substring(0, len),90,125);
    		   g.drawString(content2,50+(20-content2.length())*20,125+20*(i+1));
    		   break;//只有一行时退出
    	   }
    	   if(i==0){
    		   //这里前面两个空格，所有只截取18个字符
    		   g.drawString(content1.substring(0, 18),90,125);
    		   continue;//跳过本此循环，进入下次循环
    	   }
    	   //最后一行
    	   if(20*(i+1)>len){
    		   //写入
    		   g.drawString(content1.substring(20*(i-1)+18, len),50,125+20*i);
    		   g.drawString(content2,50+(20-content2.length())*20,125+20*(i+1));
    		   break;//跳出循环
    	   }
    	   //三个参数对应的是输入字符串，印入x坐标，y坐标
    	   g.drawString(content1.substring(20*(i-1)+18, 20*i+18),50,125+20*i);
       }
       System.out.println(num);
       g.dispose();
       return image;
	}
	
}