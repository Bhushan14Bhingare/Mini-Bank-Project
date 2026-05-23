<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bhushan Corporate Bank | Withdraw Money</title>

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
            height:100vh;
            overflow:hidden;
            display:flex;
            justify-content:center;
            align-items:center;
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
                    #ef4444,
                    #f97316,
                    #8b5cf6,
                    #ef4444
            );
            filter:blur(180px);
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

        /* Floating Currency */

        .money{
            position:absolute;
            color:rgba(255,255,255,0.08);
            font-size:40px;
            animation:float 14s linear infinite;
        }

        .money:nth-child(1){
            left:8%;
            animation-duration:12s;
        }

        .money:nth-child(2){
            left:28%;
            animation-duration:9s;
        }

        .money:nth-child(3){
            left:55%;
            animation-duration:15s;
        }

        .money:nth-child(4){
            left:82%;
            animation-duration:11s;
        }

        @keyframes float{
            from{
                transform:translateY(100vh) rotate(0deg);
            }
            to{
                transform:translateY(-120vh) rotate(360deg);
            }
        }

        /* Withdraw Card */

        .withdraw-box{
            width:480px;
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

        .withdraw-box::before{
            content:'';
            position:absolute;
            inset:-3px;
            border-radius:32px;
            background:linear-gradient(
                    45deg,
                    #ef4444,
                    #f97316,
                    #8b5cf6
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
            margin-bottom:15px;
        }

        .top-icon i{
            font-size:65px;
            color:#f87171;
            text-shadow:0 0 25px #f87171;
            animation:pulse 2s infinite;
        }

        @keyframes pulse{
            0%{
                transform:scale(1);
            }
            50%{
                transform:scale(1.1);
            }
            100%{
                transform:scale(1);
            }
        }

        h2{
            text-align:center;
            color:white;
            font-family:'Orbitron',sans-serif;
            font-size:32px;
            letter-spacing:2px;
            margin-bottom:8px;
        }

        .subtitle{
            text-align:center;
            color:#cbd5e1;
            margin-bottom:35px;
            font-size:14px;
        }

        /* Inputs */

        .input-box{
            position:relative;
            margin-bottom:24px;
        }

        .input-box input{
            width:100%;
            padding:16px 18px 16px 55px;
            border:none;
            outline:none;
            border-radius:18px;
            background:rgba(255,255,255,0.12);
            color:white;
            font-size:15px;
            transition:0.4s;
        }

        .input-box input::placeholder{
            color:#d1d5db;
        }

        .input-box input:focus{
            transform:translateY(-3px);
            background:rgba(255,255,255,0.18);
            box-shadow:0 0 20px rgba(239,68,68,0.6);
        }

        .input-box i{
            position:absolute;
            left:20px;
            top:17px;
            color:#fca5a5;
            font-size:18px;
        }

        /* Withdraw Button */

        .btn{
            width:100%;
            padding:16px;
            border:none;
            border-radius:18px;
            background:linear-gradient(
                    90deg,
                    #ef4444,
                    #f97316,
                    #8b5cf6
            );
            background-size:300%;
            color:white;
            font-size:16px;
            font-weight:700;
            letter-spacing:1px;
            cursor:pointer;
            transition:0.5s;
            overflow:hidden;
            position:relative;
        }

        .btn:hover{
            background-position:right;
            transform:scale(1.03);
            box-shadow:0 10px 30px rgba(239,68,68,0.5);
        }

        .btn::after{
            content:'';
            position:absolute;
            width:40px;
            height:200%;
            background:rgba(255,255,255,0.3);
            top:-50%;
            left:-100px;
            transform:rotate(25deg);
            transition:0.7s;
        }

        .btn:hover::after{
            left:120%;
        }

        /* Messages */

        .success{
            margin-top:20px;
            text-align:center;
            color:#4ade80;
            font-weight:600;
            animation:fadeIn 1s;
        }

        .error{
            margin-top:20px;
            text-align:center;
            color:#f87171;
            font-weight:600;
            animation:shake 0.5s;
        }

        @keyframes fadeIn{
            from{
                opacity:0;
            }
            to{
                opacity:1;
            }
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

        /* Back */

        .back{
            display:block;
            text-align:center;
            margin-top:28px;
            color:#c4b5fd;
            text-decoration:none;
            font-weight:600;
            transition:0.3s;
        }

        .back:hover{
            color:white;
            letter-spacing:1px;
        }

    </style>
</head>

<body>

<i class="fa-solid fa-money-bill-wave money"></i>
<i class="fa-solid fa-wallet money"></i>
<i class="fa-solid fa-indian-rupee-sign money"></i>
<i class="fa-solid fa-building-columns money"></i>

<div class="withdraw-box">

    <div class="top-icon">
        <i class="fa-solid fa-money-bill-wave"></i>
    </div>

    <h2>WITHDRAW MONEY</h2>

    <div class="subtitle">
        Secure & Instant Cash Withdrawal
    </div>

    <form action="withdraw" method="post">

        <div class="input-box">

            <i class="fa-solid fa-building-columns"></i>

            <input type="number"
                   name="accountNo"
                   placeholder="Enter Account Number"
                   required>

        </div>

        <div class="input-box">

            <i class="fa-solid fa-indian-rupee-sign"></i>

            <input type="number"
                   step="0.01"
                   name="amount"
                   placeholder="Enter Withdrawal Amount"
                   required>

        </div>

        <button class="btn">

            <i class="fa-solid fa-money-check-dollar"></i>

            WITHDRAW NOW

        </button>

    </form>

    <div class="success">
        ${successMessage}
    </div>

    <div class="error">
        ${errorMessage}
    </div>

    <a href="dashboard" class="back">

        <i class="fa-solid fa-arrow-left"></i>

        Back To Dashboard

    </a>

</div>

<!-- JavaScript -->

<script>

    // Loading Animation

    const form =
        document.querySelector("form");

    form.addEventListener("submit", () => {

        const btn =
            document.querySelector(".btn");

        btn.innerHTML =
            "<i class='fa-solid fa-spinner fa-spin'></i> Processing Withdrawal...";

    });


    // 3D Mouse Effect

    const card =
        document.querySelector(".withdraw-box");

    document.addEventListener("mousemove", (e) => {

        let x =
            (window.innerWidth / 2 - e.pageX) / 40;

        let y =
            (window.innerHeight / 2 - e.pageY) / 40;

        card.style.transform =
            `rotateY(${x}deg)
             rotateX(${-y}deg)`;

    });


    // Input Glow Animation

    const inputs =
        document.querySelectorAll("input");

    inputs.forEach(input => {

        input.addEventListener("keyup", () => {

            input.style.boxShadow =
                "0 0 20px rgba(239,68,68,0.7)";

            setTimeout(() => {

                input.style.boxShadow = "none";

            }, 300);

        });

    });


    // Dynamic Floating Currency Symbols

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

    }, 2000);

</script>

</body>
</html>