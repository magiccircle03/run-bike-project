package com.weovercome;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {

	@Autowired
	private DataSource datasource;
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Test
	public void contextLoads() {
	}
	
	@Test
	public void connectionTest() throws SQLException{
		System.out.println(datasource);
		Connection conn = datasource.getConnection();
		System.out.println(conn);
		conn.close();
	}

	@Test
	public void testSqlSessionFactory() {
		System.out.println("check SessionFactory : " + sessionFactory);
	}
}
