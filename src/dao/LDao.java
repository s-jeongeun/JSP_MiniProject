package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.LDto;
import mybatis.config.DBService;

public class LDao {
	private SqlSessionFactory factory = null;
	
	private LDao() {
		factory = DBService.getFactory();
	}
	private static LDao dao = new LDao();
	public static LDao getInstance() {
		return dao;
	}
	
	public List<LDto> getAllList(String u_id){
		SqlSession sqlSession = factory.openSession();
		List<LDto> list = sqlSession.selectList("select_all", u_id);
		sqlSession.close();
		return list;
	}
	
	public LDto getInfo(int idx) {
		SqlSession sqlSession = factory.openSession();
		LDto ldto = sqlSession.selectOne("select_one", idx);
		sqlSession.close();
		return ldto;
	}
	
	public int getInsert(LDto ldto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert_list", ldto);
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
}
