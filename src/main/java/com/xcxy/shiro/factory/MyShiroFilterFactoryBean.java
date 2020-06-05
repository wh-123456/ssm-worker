package com.xcxy.shiro.factory;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.config.IniFilterChainResolverFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.xcxy.user.dao.MenuMapper;

import com.xcxy.user.entity.Menu;
import com.xcxy.user.entity.Role;  

public class MyShiroFilterFactoryBean extends ShiroFilterFactoryBean{

		@Autowired
		private MenuMapper mm;
		//{0}为占位符  ROLE_STRING是用于字符串拼接
		private static final String ROLE_STRING = "roles[{0}]";
		//默认权限
		public static  String filterChainDefinitions="";
		
		/*重写设置过滤规则*/
	    @Override
	    public void setFilterChainDefinitions(String definitions) {
	    	System.out.println("$$$$$$$$$$$$$$");
	    	//每次都付给filterChainDefinitions
	    	filterChainDefinitions = definitions;
	        Ini ini = new Ini();
	        ini.load(definitions);
	        //did they explicitly state a 'urls' section?  Not necessary, but just in case:
	        Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
	        if (CollectionUtils.isEmpty(section)) {
	            //no urls section.  Since this _is_ a urls chain definition property, just assume the
	            //default section contains only the definitions:
	            section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
	        }
	        Map<String,String[]> permsMap = new HashMap<String, String[]>();
	        /*查询菜单表*/
	        List<Menu> menus=mm.findMenuAll();
	        for (Menu menu : menus) {
	        	/*获取每个权限对应的所有角色*/
				List<Role> rs=menu.getRoles();
				String[] roleNames=new String[rs.size()];
				/*获取角色名集合*/
				for(int i=0;i<rs.size();i++){
					roleNames[i]=rs.get(i).getrName();			
				}
				/*键值对存储，相当于此url哪些角色可以进入*/
				permsMap.put(menu.getmUrl(), roleNames);
			}
	        //遍历拿出map中存放的URL和角色名
	        for (String url : permsMap.keySet()) {
				 System.out.println("路径："+url);
				 //通过路径取得对应的角色
				 String[] roles = permsMap.get(url);//map中，根据key的内容获取其value
				 StringBuilder sb = new StringBuilder();
				 for (String role : roles) {
					 sb.append(role).append(",");
				}
				 //截取最后一个,如(admin,test,)
				 String str = sb.substring(0,sb.length()-1);
				 System.out.println("str:"+str+"%%%%%%%%%%%");
				 System.out.println(permsMap+"************");
				 //把对应的路径以及权限放到section中， MessageFormat.format(ROLE_STRING, str) 替换占位符{0}  
				 System.out.println("MessageFormat.format(ROLE_STRING, str):"+MessageFormat.format(ROLE_STRING, str));
				 section.put(url, MessageFormat.format(ROLE_STRING, str));
			}
	        /*代表所有的页面都需要权限才能访问*/
	        section.put("/**", "authc");
	        setFilterChainDefinitionMap(section);
	    }
	    
	
}
