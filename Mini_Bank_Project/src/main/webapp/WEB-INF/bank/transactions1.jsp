<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Transactions</title>

    <style>

        body {
            font-family: Arial;
            background: #0f172a;
            color: white;
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255,255,255,0.05);
        }

        th, td {
            border: 1px solid rgba(255,255,255,0.2);
            padding: 10px;
            text-align: center;
        }

        th {
            background: rgba(56,189,248,0.3);
        }

        .error {
            color: red;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px;
            background: #38bdf8;
            color: black;
            text-decoration: none;
        }

    </style>

</head>

<body>

<h2>Transaction History</h2>

<h3>Account No: ${accountNo}</h3>

<c:if test="${not empty errorMessage}">
    <div class="error">${errorMessage}</div>
</c:if>

<c:if test="${not empty transactions}">

    <table>
        <tr>
            <th>ID</th>
            <th>Account No</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

        <c:forEach var="txn" items="${transactions}">
            <tr>
                <td>${txn.txnId}</td>
                <td>${txn.accountNo}</td>
                <td>${txn.txnType}</td>
                <td>${txn.amount}</td>
                <td>${txn.description}</td>
                <td>${txn.txnDate}</td>
            </tr>
        </c:forEach>

    </table>

</c:if>

<a class="btn" href="${pageContext.request.contextPath}/transaction/search">
    Back
</a>

</body>
</html>