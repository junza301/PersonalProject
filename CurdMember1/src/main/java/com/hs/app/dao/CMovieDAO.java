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
	
	public List<CMovieDTO> movieGetAll() {
		return jdbcTmp.query(selectAllMovie, new movieMapper());
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
