package com.bhushan.dao;

import java.util.List;

import com.bhushan.model.Transaction;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;



@Repository
public class TransactionDaoImpl implements TranscationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    
    @Override
    public void save(Transaction transaction) {

        String sql = """
                INSERT INTO TRANSACTIONS
                (TXN_ID, ACCOUNT_NO, TXN_TYPE, AMOUNT, DESCRIPTION, TXN_DATE)
                VALUES (SEQ_TXN_ID.NEXTVAL, ?, ?, ?, ?, SYSDATE)
                """;

        jdbcTemplate.update(
                sql,
                transaction.getAccountNo(),
                transaction.getTxnType(),
                transaction.getAmount(),
                transaction.getDescription()
        );
    }

    
    @Override
    public List<Transaction> findByAccountNo(Long accountNo) {

        String sql = """
                SELECT TXN_ID,
                       ACCOUNT_NO,
                       TXN_TYPE,
                       AMOUNT,
                       DESCRIPTION,
                       TXN_DATE
                FROM TRANSACTIONS
                WHERE ACCOUNT_NO = ?
                ORDER BY TXN_DATE DESC
                """;

        return jdbcTemplate.query(sql, new TransactionRowMapper(), accountNo);
    }

    
    private static class TransactionRowMapper implements RowMapper<Transaction> {

        @Override
        public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
            Transaction transaction = new Transaction();

            transaction.setTxnId(rs.getLong("TXN_ID"));
            transaction.setAccountNo(rs.getLong("ACCOUNT_NO"));
            transaction.setTxnType(rs.getString("TXN_TYPE"));
            transaction.setAmount(rs.getDouble("AMOUNT"));
            transaction.setDescription(rs.getString("DESCRIPTION"));
            transaction.setTxnDate(rs.getTimestamp("TXN_DATE"));

            return transaction;
        }
    }
}