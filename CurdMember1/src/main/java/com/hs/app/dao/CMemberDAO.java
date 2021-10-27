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
   // @Repository �ֳ����̼��� �ش� Ŭ������ �ֻ��� �����̳ʿ� �� ��ü�� ��������
   
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
   private String countMember;// �� ����� �ϳ��� ���´�. �÷�1���� ��1��
   
   
   public int memberInsert(CMemberDTO dto) {
      // insert, update, delete�� ���� database�� ������ ������ �ǹǷ� �޼��� �̸��� update  �̴�.
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
      return jdbcTmp.queryForObject(countMember, Integer.class);// DTOŸ������ �������°� �ƴϹǷ� ��� Ÿ���� ����!
   }
   
   public List<CMemberDTO> memberSearch(String id, String pw) {
	   return jdbcTmp.query(searchMember, new MemberMapper(), id, pw);
   }
   
   
   // inner class
   class MemberMapper implements RowMapper<CMemberDTO>{

      @Override
      public CMemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
         
         CMemberDTO  dto = new CMemberDTO();// ���ٿ� ���ؼ��� ���� �ϸ�ȴ�.
         dto.setIdx(rs.getInt("idx"));
         dto.setId(rs.getString("id"));
         dto.setPw(rs.getString("pw"));
         dto.setName(rs.getString("name"));
         
         return dto;
      }
      
   }
}// end of class










