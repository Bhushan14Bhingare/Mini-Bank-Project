package com.bhushan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bhushan.model.User;


@Repository
public class UserDaoImp implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    
    @Override
    public User findByUsername(String username) {

        String sql = """
                SELECT USER_ID,
                       USERNAME,
                       PASSWORD,
                       ROLE
                FROM USERS
                WHERE USERNAME = ?
                """;

        try {
            return jdbcTemplate.queryForObject(
                    sql,
                    new UserRowMapper(),
                    username
            );
        } catch (Exception e) {
            return null;
        }
    }

   
    @Override
    public void save(User user) {

        String sql = """
                INSERT INTO USERS
                (USER_ID, USERNAME, PASSWORD, ROLE)
                VALUES
                (SEQ_USER_ID.NEXTVAL, ?, ?, ?)
                """;

        jdbcTemplate.update(
                sql,
                user.getUsername(),
                user.getPassword(),
                user.getRole()
        );
    }

    
    private static class UserRowMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {

            User user = new User();

            user.setUserId(rs.getLong("USER_ID"));
            user.setUsername(rs.getString("USERNAME"));
            user.setPassword(rs.getString("PASSWORD"));
            user.setRole(rs.getString("ROLE"));

            return user;
        }
    }
}