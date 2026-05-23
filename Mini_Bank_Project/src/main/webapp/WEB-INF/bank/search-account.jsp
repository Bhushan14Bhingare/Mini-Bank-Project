<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Account</title>

    <style>
        body{
            font-family:Poppins;
            background:#0f172a;
            color:white;
            padding:40px;
        }

        .box{
            max-width:400px;
            margin:auto;
            background:rgba(255,255,255,0.08);
            padding:25px;
            border-radius:15px;
        }

        input{
            width:100%;
            padding:10px;
            margin-top:10px;
            border-radius:8px;
            border:none;
        }

        button{
            width:100%;
            margin-top:15px;
            padding:10px;
            background:#38bdf8;
            border:none;
            color:white;
            border-radius:8px;
            cursor:pointer;
        }

        button:hover{
            background:#0ea5e9;
        }

        h2{
            text-align:center;
        }
    </style>
</head>

<body>

<div class="box">

    <h2>Account Search</h2>

    <form action="${pageContext.request.contextPath}/account/details" method="get">

        <label>Enter Account Number</label>

        <input type="number" name="accountNo" required>

        <button type="submit">View Details</button>

    </form>

</div>

</body>
</html>