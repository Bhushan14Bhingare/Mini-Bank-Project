<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bhushan Corporate Bank | Deposit</title>

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
            font-family:'Poppins',sans-serif;
            background:#020617;
            position:relative;
        }

        /* Animated Background */

        body::before{
            content:'';
            position:absolute;
            width:900px;
            height:900px;
            background:conic-gradient(
                    #22c55e,
                    #06b6d4,
                    #8b5cf6,
                    #22c55e
            );
            filter:blur(150px);
            opacity:0.5;
            animation:rotate 15s linear infinite;
        }

        @keyframes rotate{
            from{
                transform:rotate(0deg);
            }
            to{
                transform:rotate(360deg);
            }
        }

        /* Floating Coins */

        .coin{
            position:absolute;
            color:rgba(255,255,255,0.08);
            font-size:40px;
            animation:float 10s linear infinite;
        }

        .coin:nth-child(1){
            left:10%;
            animation-duration:12s;
        }

        .coin:nth-child(2){
            left:35%;
            animation-duration:8s;
        }

        .coin:nth-child(3){
            left:70%;
            animation-duration:15s;
        }

        .coin:nth-child(4){
            left:90%;
            animation-duration:10s;
        }

        @keyframes float{
            from{
                transform:translateY(100vh) rotate(0deg);
            }
            to{
                transform:translateY(-120vh) rotate(360deg);
            }
        }

        /* Glass Card */

        .deposit-box{
            width:450px;
            padding:45px;
            border-radius:30px;
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.12);
            backdrop-filter:blur(22px);
            box-shadow:0 10px 40px rgba(0,0,0,0.45);
            position:relative;
            z-index:10;
            overflow:hidden;
            animation:showBox 1s ease;
        }

        @keyframes showBox{
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

        .deposit-box::before{
            content:'';
            position:absolute;
            inset:-3px;
            border-radius:30px;
            background:linear-gradient(
                    45deg,
                    #22c55e,
                    #06b6d4,
                    #8b5cf6,
                    #22c55e
            );
            background-size:400%;
            z-index:-1;
            filter:blur(14px);
            animation:borderMove 8s linear infinite;
        }

        @keyframes borderMove{
            0%{
                background-position:0%;
            }
            100%{
                background-position:400%;
            }
        }

        /* Icon */

        .top-icon{
            text-align:center;
            margin-bottom:18px;
        }

        .top-icon i{
            font-size:60px;
            color:#4ade80;
            text-shadow:0 0 25px #4ade80;
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
            margin-bottom:25px;
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
            box-shadow:0 0 20px rgba(34,197,94,0.6);
        }

        .input-box i{
            position:absolute;
            left:20px;
            top:17px;
            color:#67e8f9;
            font-size:18px;
        }

        /* Deposit Button */

        .btn{
            width:100%;
            padding:16px;
            border:none;
            border-radius:18px;
            background:linear-gradient(
                    90deg,
                    #22c55e,
                    #06b6d4,
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
            box-shadow:0 10px 30px rgba(34,197,94,0.5);
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

        /* Back Link */

        .back{
            display:block;
            text-align:center;
            margin-top:28px;
            color:#93c5fd;
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

<i class="fa-solid fa-coins coin"></i>
<i class="fa-solid fa-coins coin"></i>
<i class="fa-solid fa-coins coin"></i>
<i class="fa-solid fa-coins coin"></i>

<div class="deposit-box">

    <div class="top-icon">
        <i class="fa-solid fa-money-bill-trend-up"></i>
    </div>

    <h2>DEPOSIT MONEY</h2>

    <div class="subtitle">
        Secure Instant Banking Deposit
    </div>

    <form action="deposit" method="post">

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
                   placeholder="Enter Deposit Amount"
                   required>

        </div>

        <button class="btn">

            <i class="fa-solid fa-circle-dollar-to-slot"></i>

            DEPOSIT NOW

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

    const form = document.querySelector("form");

    form.addEventListener("submit", () => {

        const btn = document.querySelector(".btn");

        btn.innerHTML =
            "<i class='fa-solid fa-spinner fa-spin'></i> Processing Deposit...";

    });


    // 3D Mouse Movement

    const card =
        document.querySelector(".deposit-box");

    document.addEventListener("mousemove", (e) => {

        let x =
            (window.innerWidth / 2 - e.pageX) / 40;

        let y =
            (window.innerHeight / 2 - e.pageY) / 40;

        card.style.transform =
            `rotateY(${x}deg) rotateX(${-y}deg)`;

    });


    // Input Glow Animation

    const inputs =
        document.querySelectorAll("input");

    inputs.forEach(input => {

        input.addEventListener("keyup", () => {

            input.style.boxShadow =
                "0 0 20px rgba(34,197,94,0.7)";

            setTimeout(() => {

                input.style.boxShadow = "none";

            }, 300);

        });

    });

</script>

</body>
</html>