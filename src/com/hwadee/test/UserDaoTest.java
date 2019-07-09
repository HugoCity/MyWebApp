package com.hwadee.test;

import org.junit.Assert;
import org.junit.jupiter.api.Test;

import com.hwadee.dao.UserDao;
import com.hwadee.entity.UserEntity;

class UserDaoTest extends UserDao {

	@Test
	void testGetUserBynameandPwd() {
		UserDao udao = new UserDao();
		UserEntity ue = udao.getUserBynameandPwd("root", "123456");
		Assert.assertNotEquals(null, ue);//����
		System.out.println(ue);

	}

}
