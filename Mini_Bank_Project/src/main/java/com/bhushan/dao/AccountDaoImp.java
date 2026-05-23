package com.bhushan.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bhushan.model.Account;


@Repository
public class AccountDaoImp implements AccountDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    
    @Override
    public Account save(Account account) {

        String insertSql = """
                INSERT INTO ACCOUNTS
                (ACCOUNT_NO, USER_ID, ACCOUNT_HOLDER, ACCOUNT_TYPE,
                 BALANCE, STATUS, CREATED_AT)
                VALUES
                (SEQ_ACCOUNT_NO.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)
                """;

        jdbcTemplate.update(
                insertSql,
                account.getUserId(),
                account.getAccountHolder(),
                account.getAccountType(),
                account.getBalance(),
                account.getStatus()
        );

       
        String selectSql = """
                SELECT ACCOUNT_NO,
                       USER_ID,
                       ACCOUNT_HOLDER,
                       ACCOUNT_TYPE,
                       BALANCE,
                       STATUS,
                       CREATED_AT
                FROM ACCOUNTS
                WHERE USER_ID = ?
                ORDER BY CREATED_AT DESC
                FETCH FIRST 1 ROWS ONLY
                """;

        return jdbcTemplate.queryForObject(
                selectSql,
                new AccountRowMapper(),
                account.getUserId()
        );
    }

    
    @Override
    public Account findByAccountNo(Long accountNo) {

        String sql = """
                SELECT ACCOUNT_NO,
                       USER_ID,
                       ACCOUNT_HOLDER,
                       ACCOUNT_TYPE,
                       BALANCE,
                       STATUS,
                       CREATED_AT
                FROM ACCOUNTS
                WHERE ACCOUNT_NO = ?
                """;

        try {
            return jdbcTemplate.queryForObject(
                    sql,
                    new AccountRowMapper(),
                    accountNo
            );
        } catch (Exception e) {
            return null;
        }
    }

   
    @Override
    public void updateBalance(Long accountNo, Double balance) {

        String sql = """
                UPDATE ACCOUNTS
                SET BALANCE = ?
                WHERE ACCOUNT_NO = ?
                """;

        jdbcTemplate.update(sql, balance, accountNo);
    }

    
    private static class AccountRowMapper implements RowMapper<Account> {

        @Override
        public Account mapRow(ResultSet rs, int rowNum) throws SQLException {

            Account account = new Account();

            account.setAccountNo(rs.getLong("ACCOUNT_NO"));
            account.setUserId(rs.getLong("USER_ID"));
            account.setAccountHolder(rs.getString("ACCOUNT_HOLDER"));
            account.setAccountType(rs.getString("ACCOUNT_TYPE"));
            account.setBalance(rs.getDouble("BALANCE"));
            account.setStatus(rs.getString("STATUS"));
            account.setCreatedAt(rs.getTimestamp("CREATED_AT"));

            return account;
        }
    }
}