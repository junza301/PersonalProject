package com.hs.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.app.bean.CCinemaDTO;

@Repository
public class CCinemaDAO {
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("select * from ccinema")
	private String selectAllCinema;
	
	@Value("select * from ccinema where branch = ?")
	private String selectOneCinema;

	
	public List<CCinemaDTO> cinemaGetAll() {
		return jdbcTmp.query(selectAllCinema, new CinemaMapper());
	}
	
	public CCinemaDTO cinemaGetIdx(String cinema) {
		CCinemaDTO dto = jdbcTmp.queryForObject(selectOneCinema, new CinemaMapper(), cinema);
		return dto;
	}
	
	class CinemaMapper implements RowMapper<CCinemaDTO> {
		@Override
		public CCinemaDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CCinemaDTO dto = new CCinemaDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setBranch(rs.getString("branch"));
			dto.setSeat(rs.getInt("seat"));
			
			return dto;
		}
	}
}