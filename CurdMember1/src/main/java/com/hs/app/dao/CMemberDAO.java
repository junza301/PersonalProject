package com.hs.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.app.bean.CMemberDTO;

@Repository
public class CMemberDAO {
   // @Repository 애노테이션은 해당 클래스를 최상위 컨테이너에 빈 객체로 생성해줌
   
   @Autowired
   private JdbcTemplate jdbcTmp;
   
   private String insertMember = "insert into cmember values (null, ?, ?, ?)";
   
   @Value("delete from cmember where idx=?")
   private String deleteMember;
   
   @Value("select * from cmember where id=? and pw=?")
   private String searchMember;
   
   @Value("select * from cmember where idx=?")
   private String selectOneMember;
   
   @Value("select * from cmember")
   private String selectAllMember;
   
   @Value("select count(idx) from cmember")
   private String countMember;// 딱 결과가 하나만 나온다. 컬럼1개에 값1개
   
   
   public int memberInsert(CMemberDTO dto) {
      // insert, update, delete는 실제 database의 내용이 갱신이 되므로 메서드 이름이 update  이다.
      return jdbcTmp.update(insertMember, dto.getName(), dto.getId(), dto.getPw());
   }
   
   public int memberDelete(int idx) {
      return jdbcTmp.update(deleteMember, idx);
   }
   
   public CMemberDTO memberGetOne(int idx) {
      CMemberDTO dto = jdbcTmp.queryForObject(selectOneMember, new MemberMapper(),idx);
      
      return dto;
   }
   
   public List<CMemberDTO> memberGetAll(){
      return jdbcTmp.query(selectAllMember, new MemberMapper());
   }
   
   public List<CMemberDTO> memberGetAll(int start, int cnt){
      return jdbcTmp.query(selectAllMember, new MemberMapper(),start,cnt);
   }
   
   public int memberGetCount() {
      return jdbcTmp.queryForObject(countMember, Integer.class);// DTO타입으로 가져오는게 아니므로 결과 타입을 써줌!
   }
   
   public List<CMemberDTO> memberSearch(String id, String pw) {
	   return jdbcTmp.query(searchMember, new MemberMapper(), id, pw);
   }
   
   
   // inner class
   class MemberMapper implements RowMapper<CMemberDTO>{

      @Override
      public CMemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
         
         CMemberDTO  dto = new CMemberDTO();// 한줄에 대해서만 설정 하면된다.
         dto.setIdx(rs.getInt("idx"));
         dto.setId(rs.getString("id"));
         dto.setPw(rs.getString("pw"));
         dto.setName(rs.getString("name"));
         
         return dto;
      }
      
   }
}// end of class










