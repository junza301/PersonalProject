package com.hs.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hs.app.bean.CMovieDTO;

@Repository
public class CMovieDAO {
	@Autowired
	private JdbcTemplate jdbcTmp;
	
	@Value("select * from cmovie")
	private String selectAllMovie;
	
	@Value("SELECT * FROM cmovie ORDER BY idx asc LIMIT 4")
	private String selectMainMovie;
	
	@Value("SELECT * FROM cmovie where idx between ? and ?")
	private String selectFiveMovie;
	
	@Value("SELECT COUNT(*) FROM cmovie")
	private String countAllMovie;
	
	public List<CMovieDTO> movieGetAll() {
		return jdbcTmp.query(selectAllMovie, new movieMapper());
	}
	
	public List<CMovieDTO> movieGetMain() {
		return jdbcTmp.query(selectMainMovie, new movieMapper());
	}
	
	public List<CMovieDTO> movieGetFive(int nowPage) {
		
		return jdbcTmp.query(selectFiveMovie, new movieMapper(),nowPage*5-4 ,nowPage*5);
	}
	
	public int movieGetCount() {
		return jdbcTmp.queryForObject(countAllMovie, Integer.class);
	}
	
	class movieMapper implements RowMapper<CMovieDTO> {
	
		@Override
		public CMovieDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CMovieDTO dto = new CMovieDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
			dto.setRunning_time(rs.getString("running_time"));
			dto.setRelease_date(rs.getString("release_date"));
			dto.setPlot(rs.getString("plot"));
			dto.setImage(rs.getString("image"));
			
			return dto;
		}
	}
}
