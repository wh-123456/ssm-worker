package com.xcxy.user.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.user.dao.MenuMapper;
import com.xcxy.user.entity.Menu;
import com.xcxy.user.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper mm;
	@Override
	public List<Menu> findMenuAll() {
		List<Menu> menus=mm.findMenuAll();
		return menus;
	}

}
