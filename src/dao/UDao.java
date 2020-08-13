package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.UDto;
import mybatis.config.DBService;

public class UDao {
private SqlSessionFactory factory = null;
	
	private UDao() {
		factory = DBService.getFactory();
	}
	private static UDao dao = new UDao();
	public static UDao getInstance() {
		return dao;
	}
	
	public int getInsert(UDto udto) {
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("insert_user", udto);
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public UDto getLogin(UDto udto) {
		SqlSession sqlSession = factory.openSession();
		UDto dto = sqlSession.selectOne("login", udto);
		sqlSession.close();
		return dto;
	}

}
