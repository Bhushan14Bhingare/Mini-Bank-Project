<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bhushan Corporate Bank | Create Account</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Montserrat',sans-serif;
        }

        body{
            height:100vh;
            overflow:hidden;
            background:#050816;
            display:flex;
            justify-content:center;
            align-items:center;
            position:relative;
        }

        /* Animated Background */

        body::before{
            content:'';
            position:absolute;
            width:700px;
            height:700px;
            background:radial-gradient(circle,#7c3aed,#06b6d4,#050816);
            filter:blur(120px);
            animation:rotateBg 12s linear infinite;
        }

        @keyframes rotateBg{
            from{
                transform:rotate(0deg);
            }
            to{
                transform:rotate(360deg);
            }
        }

        /* Floating particles */

        .particles span{
            position:absolute;
            width:8px;
            height:8px;
            background:white;
            border-radius:50%;
            animation:move 10s linear infinite;
            opacity:0.7;
        }

        .particles span:nth-child(1){
            left:10%;
            animation-duration:8s;
            top:100%;
        }

        .particles span:nth-child(2){
            left:30%;
            animation-duration:12s;
            top:100%;
        }

        .particles span:nth-child(3){
            left:50%;
            animation-duration:7s;
            top:100%;
        }

        .particles span:nth-child(4){
            left:70%;
            animation-duration:15s;
            top:100%;
        }

        .particles span:nth-child(5){
            left:90%;
            animation-duration:10s;
            top:100%;
        }

        @keyframes move{
            from{
                transform:translateY(0px);
                opacity:0;
            }
            to{
                transform:translateY(-1200px);
                opacity:1;
            }
        }

        /* Main Card */

        .card{
            width:450px;
            padding:40px;
            border-radius:30px;
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.15);
            backdrop-filter:blur(20px);
            box-shadow:0 10px 40px rgba(0,0,0,0.4);
            position:relative;
            z-index:10;
            overflow:hidden;
            animation:showCard 1s ease;
        }

        @keyframes showCard{
            from{
                opacity:0;
                transform:scale(0.8);
            }
            to{
                opacity:1;
                transform:scale(1);
            }
        }

        /* Neon border */

        .card::before{
            content:'';
            position:absolute;
            inset:-3px;
            background:linear-gradient(
                    45deg,
                    #06b6d4,
                    #8b5cf6,
                    #ec4899,
                    #06b6d4
            );
            background-size:400%;
            border-radius:30px;
            z-index:-1;
            filter:blur(12px);
            animation:borderRun 8s linear infinite;
        }

        @keyframes borderRun{
            0%{
                background-position:0%;
            }
            100%{
                background-position:400%;
            }
        }

        h1{
            color:white;
            text-align:center;
            margin-bottom:10px;
            font-size:34px;
            font-weight:700;
            letter-spacing:2px;
        }

        .subtitle{
            text-align:center;
            color:#cbd5e1;
            margin-bottom:30px;
            font-size:14px;
        }

        .input-box{
            position:relative;
            margin-bottom:22px;
        }

        .input-box input,
        .input-box select{
            width:100%;
            padding:16px 18px 16px 55px;
            border:none;
            outline:none;
            border-radius:15px;
            background:rgba(255,255,255,0.12);
            color:white;
            font-size:15px;
            transition:0.4s;
        }

        .input-box input:focus,
        .input-box select:focus{
            background:rgba(255,255,255,0.18);
            transform:translateY(-3px);
            box-shadow:0 0 20px rgba(59,130,246,0.5);
        }

        .input-box input::placeholder{
            color:#d1d5db;
        }

        .input-box i{
            position:absolute;
            left:20px;
            top:17px;
            color:#67e8f9;
            font-size:18px;
        }

        select option{
            color:black;
        }

        /* Button */

        .btn{
            width:100%;
            padding:15px;
            border:none;
            border-radius:16px;
            font-size:16px;
            font-weight:700;
            letter-spacing:1px;
            cursor:pointer;
            color:white;
            background:linear-gradient(90deg,#06b6d4,#8b5cf6,#ec4899);
            background-size:300%;
            transition:0.5s;
            position:relative;
            overflow:hidden;
        }

        .btn:hover{
            background-position:right;
            transform:scale(1.03);
            box-shadow:0 8px 30px rgba(139,92,246,0.5);
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
            text-align:center;
            color:#4ade80;
            margin-top:18px;
            font-weight:600;
        }

        .error{
            text-align:center;
            color:#f87171;
            margin-top:18px;
            font-weight:600;
        }

        .footer-link{
            text-align:center;
            margin-top:25px;
        }

        .footer-link a{
            color:#93c5fd;
            text-decoration:none;
            font-weight:600;
            transition:0.3s;
        }

        .footer-link a:hover{
            color:white;
            letter-spacing:1px;
        }

        /* Top glow */

        .top-glow{
            position:absolute;
            top:-120px;
            left:50%;
            transform:translateX(-50%);
            width:300px;
            height:300px;
            background:#8b5cf6;
            border-radius:50%;
            filter:blur(120px);
            opacity:0.4;
            z-index:-1;
        }

    </style>
</head>

<body>

<div class="particles">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>

<div class="card">

    <div class="top-glow"></div>

    <h1>BHUSHAN BANK</h1>

    <div class="subtitle">
        Secure Digital Banking Experience
    </div>

    <form action="create" method="post">

        <div class="input-box">
            <i class="fa-solid fa-id-card"></i>

            <input type="number"
                   name="userId"
                   placeholder="Enter User ID"
                   required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-user"></i>

            <input type="text"
                   name="accountHolder"
                   placeholder="Account Holder Name"
                   required>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-building-columns"></i>

            <select name="accountType">

                <option value="SAVINGS">
                    Savings Account
                </option>

                <option value="CURRENT">
                    Current Account
                </option>

            </select>
        </div>

        <div class="input-box">
            <i class="fa-solid fa-indian-rupee-sign"></i>

            <input type="number"
                   step="0.01"
                   name="balance"
                   placeholder="Opening Balance"
                   value="0">
        </div>

        <button class="btn">
            <i class="fa-solid fa-wallet"></i>
            CREATE ACCOUNT
        </button>

    </form>

    <div class="success">
        ${successMessage}
    </div>

    <div class="error">
        ${errorMessage}
    </div>

    <div class="footer-link">
        <a href="dashboard">
            <i class="fa-solid fa-arrow-left"></i>
            Back To Dashboard
        </a>
    </div>

</div>

<!-- JavaScript -->

<script>

    // Typing glow effect

    const inputs = document.querySelectorAll("input");

    inputs.forEach(input => {

        input.addEventListener("keyup", () => {

            input.style.boxShadow =
                "0 0 25px rgba(99,102,241,0.8)";

            setTimeout(() => {

                input.style.boxShadow = "none";

            }, 400);

        });

    });


    // Button loading animation

    const form = document.querySelector("form");

    form.addEventListener("submit", () => {

        const btn = document.querySelector(".btn");

        btn.innerHTML =
            "<i class='fa-solid fa-spinner fa-spin'></i> Creating...";

    });


    // Mouse move 3D card effect

    const card = document.querySelector(".card");

    document.addEventListener("mousemove", (e) => {

        let x = (window.innerWidth / 2 - e.pageX) / 30;
        let y = (window.innerHeight / 2 - e.pageY) / 30;

        card.style.transform =
            `rotateY(${x}deg) rotateX(${-y}deg)`;

    });

</script>

</body>
</html>