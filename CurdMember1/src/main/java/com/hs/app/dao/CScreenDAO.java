package com.hs.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.app.bean.CScreenDTO;

@Repository
public class CScreenDAO {
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("select * from cscreen")
	private String selectAllScreen;
	
	@Value("select * from cscreen where cinema = ? and movie = ? and stime = ?")
	private String selectOneScreen;
	
	@Value("UPDATE cscreen SET remain_seat = ? WHERE cinema = ? AND movie = ? AND sdate = ? AND stime = ?")
	private String updateScreen;
	
	public List<CScreenDTO> screenGetAll() {
		return jdbcTmp.query(selectAllScreen, new ScreenMapper());
	}
	
	public CScreenDTO screenGetOne(int cinema_idx, int movie_idx, String time) {
		return jdbcTmp.queryForObject(selectOneScreen, new ScreenMapper(), cinema_idx, movie_idx, time);
	}
	
	public int screenUpdate(int seat, int cinema, int movie, String date, String time) {
		return jdbcTmp.update(updateScreen, seat, cinema, movie, date, time);
	}
	
	class ScreenMapper implements RowMapper<CScreenDTO> {
	
		@Override
		public CScreenDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CScreenDTO dto = new CScreenDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setCinema(rs.getInt("cinema"));
			dto.setMovie(rs.getInt("movie"));
			dto.setSdate(rs.getString("sdate"));
			dto.setStime(rs.getString("stime"));
			dto.setRemain_seat(rs.getInt("remain_seat"));
			
			return dto;
		}
	}
}
