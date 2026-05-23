<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Bank Dashboard</title>

    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Poppins:wght@300;400;500&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            display: flex;
            min-height: 100vh;
            background: #0f172a;
            color: white;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: rgba(255,255,255,0.06);
            padding: 20px;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo i {
            font-size: 45px;
            color: #38bdf8;
        }

        .logo h2 {
            font-family: 'Orbitron', sans-serif;
            margin-top: 10px;
        }

        .menu a {
            display: block;
            padding: 12px;
            margin: 10px 0;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            transition: 0.3s;
        }

        .menu a:hover {
            background: rgba(56,189,248,0.2);
        }

        /* Main */
        .main {
            flex: 1;
            padding: 30px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: rgba(255,255,255,0.06);
            padding: 20px;
            border-radius: 15px;
            cursor: pointer;
            transition: 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-8px);
            background: rgba(56,189,248,0.15);
        }

        .card i {
            font-size: 30px;
            color: #38bdf8;
            margin-bottom: 10px;
        }

        .card h3 {
            margin: 0;
        }

    </style>

    <script>
        function go(url) {
            window.location.href = url;
        }
    </script>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">

    <div class="logo">
        <i class="fa-solid fa-building-columns"></i>
        <h2>BHUSHAN BANK</h2>
    </div>

    <div class="menu">

        <a href="create"><i class="fa fa-user-plus"></i> Create Account</a>
        <a href="deposit"><i class="fa fa-money-bill"></i> Deposit</a>
        <a href="withdraw"><i class="fa fa-wallet"></i> Withdraw</a>

        <!-- ✅ ADDED -->
        <a href="balance"><i class="fa fa-coins"></i> Balance</a>

        <!-- ✅ ADDED -->
        <a href="transfer"><i class="fa fa-exchange"></i> Transfer</a>

        <!-- Transaction -->
        <a href="${pageContext.request.contextPath}/transaction/search">
            <i class="fa fa-clock"></i> Transaction History
        </a>

        <!-- ✅ NEW: Account Details -->
        <a href="${pageContext.request.contextPath}/account/searchDetails">
            <i class="fa fa-id-card"></i> Account Details
        </a>

    </div>

</div>

<!-- MAIN -->
<div class="main">

    <div class="topbar">
        <h1>Dashboard</h1>
    </div>

    <div class="cards">

        <div class="card" onclick="go('create')">
            <i class="fa fa-user-plus"></i>
            <h3>Create Account</h3>
        </div>

        <div class="card" onclick="go('deposit')">
            <i class="fa fa-money-bill"></i>
            <h3>Deposit</h3>
        </div>

        <div class="card" onclick="go('withdraw')">
            <i class="fa fa-wallet"></i>
            <h3>Withdraw</h3>
        </div>

        <div class="card" onclick="go('balance')">
            <i class="fa fa-coins"></i>
            <h3>Balance</h3>
        </div>

        <div class="card" onclick="go('transfer')">
            <i class="fa fa-exchange"></i>
            <h3>Transfer</h3>
        </div>

        <div class="card" onclick="go('${pageContext.request.contextPath}/account/searchDetails')">
            <i class="fa fa-id-card"></i>
            <h3>Account Details</h3>
        </div>

        <div class="card" onclick="go('${pageContext.request.contextPath}/transaction/search')">
            <i class="fa fa-clock"></i>
            <h3>Transaction History</h3>
        </div>

    </div>

</div>

</body>
</html>