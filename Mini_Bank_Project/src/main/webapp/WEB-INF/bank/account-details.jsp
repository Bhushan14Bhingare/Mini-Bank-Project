<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>
        Bhushan Corporate Bank | Account Details
    </title>

    <!-- Google Fonts -->

    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Poppins:wght@300;400;500;600&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            overflow:hidden;
            background:#020617;
            font-family:'Poppins',sans-serif;
            position:relative;
        }

        /* Animated Background */

        body::before{
            content:'';
            position:absolute;
            width:1000px;
            height:1000px;
            background:conic-gradient(
                    #06b6d4,
                    #8b5cf6,
                    #22c55e,
                    #ec4899,
                    #06b6d4
            );
            filter:blur(170px);
            opacity:0.45;
            animation:rotateBg 18s linear infinite;
        }

        @keyframes rotateBg{
            from{
                transform:rotate(0deg);
            }
            to{
                transform:rotate(360deg);
            }
        }

        /* Floating Icons */

        .money{
            position:absolute;
            color:rgba(255,255,255,0.08);
            font-size:40px;
            animation:float 14s linear infinite;
        }

        .money:nth-child(1){
            left:8%;
            animation-duration:10s;
        }

        .money:nth-child(2){
            left:28%;
            animation-duration:13s;
        }

        .money:nth-child(3){
            left:60%;
            animation-duration:11s;
        }

        .money:nth-child(4){
            left:85%;
            animation-duration:15s;
        }

        @keyframes float{
            from{
                transform:translateY(100vh) rotate(0deg);
            }
            to{
                transform:translateY(-120vh) rotate(360deg);
            }
        }

        /* Main Card */

        .details-card{
            width:520px;
            padding:45px;
            border-radius:32px;
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.12);
            backdrop-filter:blur(25px);
            box-shadow:0 12px 45px rgba(0,0,0,0.45);
            position:relative;
            z-index:10;
            overflow:hidden;
            animation:showCard 1s ease;
        }

        @keyframes showCard{
            from{
                opacity:0;
                transform:translateY(60px) scale(0.8);
            }
            to{
                opacity:1;
                transform:translateY(0px) scale(1);
            }
        }

        /* Neon Border */

        .details-card::before{
            content:'';
            position:absolute;
            inset:-3px;
            border-radius:32px;
            background:linear-gradient(
                    45deg,
                    #06b6d4,
                    #8b5cf6,
                    #22c55e,
                    #ec4899
            );
            background-size:400%;
            z-index:-1;
            filter:blur(15px);
            animation:borderGlow 8s linear infinite;
        }

        @keyframes borderGlow{
            0%{
                background-position:0%;
            }
            100%{
                background-position:400%;
            }
        }

        /* Header */

        .top-icon{
            text-align:center;
            margin-bottom:18px;
        }

        .top-icon i{
            font-size:70px;
            color:#67e8f9;
            text-shadow:0 0 25px #67e8f9;
            animation:pulse 2s infinite;
        }

        @keyframes pulse{
            0%{
                transform:scale(1);
            }
            50%{
                transform:scale(1.08);
            }
            100%{
                transform:scale(1);
            }
        }

        h2{
            text-align:center;
            color:white;
            font-size:34px;
            font-family:'Orbitron',sans-serif;
            letter-spacing:2px;
            margin-bottom:10px;
        }

        .subtitle{
            text-align:center;
            color:#cbd5e1;
            margin-bottom:35px;
            font-size:14px;
        }

        /* Details Box */

        .detail-box{
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.1);
            padding:18px 20px;
            border-radius:20px;
            margin-bottom:18px;
            transition:0.4s;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .detail-box:hover{
            transform:translateX(6px);
            background:rgba(255,255,255,0.12);
            box-shadow:0 0 18px rgba(6,182,212,0.3);
        }

        .label{
            color:#94a3b8;
            font-size:15px;
            display:flex;
            align-items:center;
            gap:10px;
        }

        .value{
            color:white;
            font-size:16px;
            font-weight:600;
        }

        .balance{
            color:#4ade80;
            font-size:24px;
            font-weight:700;
            text-shadow:0 0 15px rgba(34,197,94,0.4);
        }

        .active{
            color:#22c55e;
            font-weight:700;
        }

        /* Error */

        .error{
            margin-top:18px;
            text-align:center;
            color:#f87171;
            font-weight:600;
            animation:shake 0.5s;
        }

        @keyframes shake{
            0%{
                transform:translateX(0);
            }
            25%{
                transform:translateX(-5px);
            }
            50%{
                transform:translateX(5px);
            }
            75%{
                transform:translateX(-5px);
            }
            100%{
                transform:translateX(0);
            }
        }

        /* Back Button */

        .back-btn{
            display:block;
            text-align:center;
            margin-top:28px;
            padding:14px;
            border-radius:18px;
            text-decoration:none;
            color:white;
            font-weight:600;
            background:linear-gradient(
                    90deg,
                    #06b6d4,
                    #8b5cf6
            );
            transition:0.4s;
        }

        .back-btn:hover{
            transform:scale(1.03);
            box-shadow:0 0 20px rgba(6,182,212,0.5);
        }

    </style>

</head>

<body>

<i class="fa-solid fa-wallet money"></i>
<i class="fa-solid fa-building-columns money"></i>
<i class="fa-solid fa-money-bill-wave money"></i>
<i class="fa-solid fa-indian-rupee-sign money"></i>

<div class="details-card">

    <!-- Icon -->

    <div class="top-icon">

        <i class="fa-solid fa-id-card"></i>

    </div>

    <!-- Heading -->

    <h2>ACCOUNT DETAILS</h2>

    <div class="subtitle">

        Secure Banking Information Overview

    </div>

    <!-- Account Number -->

    <div class="detail-box">

        <div class="label">

            <i class="fa-solid fa-hashtag"></i>

            Account No

        </div>

        <div class="value">

            ${accountDetails.accountNo}

        </div>

    </div>

    <!-- Holder -->

    <div class="detail-box">

        <div class="label">

            <i class="fa-solid fa-user"></i>

            Holder Name

        </div>

        <div class="value">

            ${accountDetails.accountHolder}

        </div>

    </div>

    <!-- Type -->

    <div class="detail-box">

        <div class="label">

            <i class="fa-solid fa-layer-group"></i>

            Account Type

        </div>

        <div class="value">

            ${accountDetails.accountType}

        </div>

    </div>

    <!-- Balance -->

    <div class="detail-box">

        <div class="label">

            <i class="fa-solid fa-wallet"></i>

            Available Balance

        </div>

        <div class="balance">

            ₹ ${accountDetails.balance}

        </div>

    </div>

    <!-- Status -->

    <div class="detail-box">

        <div class="label">

            <i class="fa-solid fa-circle-check"></i>

            Status

        </div>

        <div class="active">

            ${accountDetails.status}

        </div>

    </div>

    <!-- Error -->

    <div class="error">

        ${errorMessage}

    </div>

    <!-- Back -->

    <a href="dashboard"
       class="back-btn">

        <i class="fa-solid fa-arrow-left"></i>

        Back To Dashboard

    </a>

</div>

<!-- JavaScript -->

<script>

    // 3D Card Effect

    const card =
        document.querySelector(".details-card");

    document.addEventListener("mousemove", (e) => {

        let x =
            (window.innerWidth / 2 - e.pageX) / 40;

        let y =
            (window.innerHeight / 2 - e.pageY) / 40;

        card.style.transform =
            `rotateY(${x}deg)
             rotateX(${-y}deg)`;

    });


    // Dynamic Floating Currency

    setInterval(() => {

        const icon =
            document.createElement("i");

        icon.className =
            "fa-solid fa-indian-rupee-sign money";

        icon.style.left =
            Math.random() * 100 + "%";

        icon.style.fontSize =
            (20 + Math.random() * 30) + "px";

        document.body.appendChild(icon);

        setTimeout(() => {

            icon.remove();

        }, 14000);

    }, 2200);

</script>

</body>
</html>