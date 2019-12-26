package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.roadruwa.dao.BoardDao;
import com.roadruwa.dao.UserDao;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"/roadruwa/spring/context-common.xml",
		"/roadruwa/spring/context-datasource.xml",
		"/roadruwa/spring/context-sqlMap.xml" })
public class TestDao {

	@Autowired
	private ApplicationContext applicationContext;

	@Resource(name = "dataSource")
	private BasicDataSource dataSource;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	long time_st = 0L;

	@Before // 각 테스트마다 인스턴스가 매번 다시 생성되어 독립적인 테스트 가능
	public void setup() {
		java.util.Date stdt = new Date();
		time_st = stdt.getTime();
	}

	@After // 후처리 작업
	public void tearDown() {
		java.util.Date endt = new Date();
		long time_en = endt.getTime();
		System.out.println("tearDown => Time : " + (time_en - time_st));
	}
	
	@Test
	public void unitTest() {
		System.out.println("Run Test~~!!");
	}

	@Test
	public void testDataSource() throws SQLException {
		BasicDataSource dataSource = (BasicDataSource)applicationContext.getBean("dataSource");		
		Connection conn = dataSource.getConnection();
		String sql = "select now()";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			System.out.println("Now : " + rs.getString(1));
		}

		rs.close();
		stmt.close();
		conn.close();
	}
	
	@Test
	public void searchUserDao() {		
		UserVo userVo = userDao.getUserVoItem("dyshim123");		
		System.out.println("userVo : " + userVo);		
	}
	
	@Test
	public void searchBoardDao() {		
		//lotation, day, cost, trans, tema, search
		List<BoardVo> boardList = boardDao.getBoardList("서울", 2, 0, "자동차", "액티비티", "궁");
		
		for(BoardVo boad: boardList ) {
			System.out.println("boad :: " + boad);
		}
	}
	
	@Test
	public void updateUser() {
		UserVo vo = new UserVo();
		
		vo.setuId("cyshim");
		vo.setAuthstatus(3);
		
		userDao.updateUserVo(vo);
	}
}
