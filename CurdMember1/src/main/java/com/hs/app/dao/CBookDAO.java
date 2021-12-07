package com.hs.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.app.bean.CBookDTO;

@Repository
public class CBookDAO {
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("select * from cbook where member = ?")
	private String selectMemberBook;
	
	@Value("insert into cbook values(null, ?, ?, ?, ?, ?, ?)")
	private String insertBook;
	
	public List<CBookDTO> bookMember(int member_idx) {
		return jdbcTmp.query(selectMemberBook, new BookMapper(), member_idx);
	}
	
	public int bookInsert(int member, int cinema, int movie, String date, String time, int people) {
		return jdbcTmp.update(insertBook, member, cinema, movie, date, time, people);
	}
	
	
	class BookMapper implements RowMapper<CBookDTO> {
		@Override
		public CBookDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CBookDTO dto = new CBookDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setMember(rs.getInt("member"));
			dto.setCinema(rs.getInt("cinema"));
			dto.setMovie(rs.getInt("movie"));
			dto.setBdate(rs.getString("bdate"));
			dto.setBtime(rs.getString("btime"));
			dto.setPeople(rs.getInt("people"));
			return dto;
		}
	}
}
