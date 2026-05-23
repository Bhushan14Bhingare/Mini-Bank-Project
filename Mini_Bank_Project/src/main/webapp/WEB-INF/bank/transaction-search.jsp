<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Transaction Search</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Poppins:wght@300;400;500&display=swap"
          rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #0f172a;
            color: white;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* CARD */
        .container {
            width: 420px;
            padding: 30px;
            background: rgba(255,255,255,0.06);
            border-radius: 20px;
            border: 1px solid rgba(255,255,255,0.1);
            backdrop-filter: blur(20px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .title {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            font-size: 22px;
            margin-bottom: 20px;
            color: #38bdf8;
        }

        .icon {
            text-align: center;
            font-size: 50px;
            color: #38bdf8;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #cbd5e1;
        }

        input {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            outline: none;
            margin-bottom: 20px;
            font-size: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #38bdf8, #8b5cf6);
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            transform: scale(1.05);
        }

        .back {
            margin-top: 15px;
            text-align: center;
        }

        .back a {
            color: #38bdf8;
            text-decoration: none;
            font-size: 14px;
        }

        .back a:hover {
            text-decoration: underline;
        }

        /* helper text */
        .hint {
            font-size: 12px;
            color: #94a3b8;
            margin-top: -15px;
            margin-bottom: 15px;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="icon">
        <i class="fa-solid fa-magnifying-glass"></i>
    </div>

    <div class="title">Transaction History Search</div>

    <form action="${pageContext.request.contextPath}/transaction/history" method="get">

        <label>Account Number</label>

        <input type="number"
               name="accountNo"
               placeholder="Enter Account Number"
               required />

        <div class="hint">
            Enter valid account number to view transaction history
        </div>

        <button type="submit">
            <i class="fa-solid fa-search"></i> Search Transactions
        </button>

    </form>

    <div class="back">
        <a href="${pageContext.request.contextPath}/dashboard">
            ← Back to Dashboard
        </a>
    </div>

</div>

</body>

</html>