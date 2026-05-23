<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bhushan Corporate Bank | Login</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

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

        /* Animated Gradient */

        body::before{
            content:'';
            position:absolute;
            width:800px;
            height:800px;
            background:conic-gradient(
                    #06b6d4,
                    #8b5cf6,
                    #ec4899,
                    #06b6d4
            );
            animation:spin 12s linear infinite;
            filter:blur(140px);
            opacity:0.7;
        }

        @keyframes spin{
            from{
                transform:rotate(0deg);
            }
            to{
                transform:rotate(360deg);
            }
        }

        /* Floating Shapes */

        .shape{
            position:absolute;
            border-radius:50%;
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(10px);
            animation:float 8s infinite ease-in-out;
        }

        .shape:nth-child(1){
            width:220px;
            height:220px;
            top:5%;
            left:10%;
        }

        .shape:nth-child(2){
            width:180px;
            height:180px;
            bottom:10%;
            right:10%;
            animation-delay:2s;
        }

        .shape:nth-child(3){
            width:100px;
            height:100px;
            bottom:20%;
            left:20%;
            animation-delay:4s;
        }

        @keyframes float{
            0%{
                transform:translateY(0px);
            }
            50%{
                transform:translateY(-30px);
            }
            100%{
                transform:translateY(0px);
            }
        }

        /* Login Card */

        .login-box{
            width:420px;
            padding:45px;
            border-radius:28px;
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.12);
            backdrop-filter:blur(25px);
            box-shadow:0 10px 40px rgba(0,0,0,0.45);
            position:relative;
            z-index:10;
            overflow:hidden;
            animation:showBox 1s ease;
        }

        @keyframes showBox{
            from{
                opacity:0;
                transform:translateY(50px) scale(0.8);
            }
            to{
                opacity:1;
                transform:translateY(0px) scale(1);
            }
        }

        /* Neon Border */

        .login-box::before{
            content:'';
            position:absolute;
            inset:-3px;
            border-radius:28px;
            background:linear-gradient(
                    45deg,
                    #06b6d4,
                    #8b5cf6,
                    #ec4899,
                    #06b6d4
            );
            background-size:400%;
            z-index:-1;
            filter:blur(12px);
            animation:borderGlow 10s linear infinite;
        }

        @keyframes borderGlow{
            0%{
                background-position:0%;
            }
            100%{
                background-position:400%;
            }
        }

        /* Logo */

        .logo{
            text-align:center;
            margin-bottom:15px;
        }

        .logo i{
            font-size:55px;
            color:#38bdf8;
            text-shadow:0 0 20px #38bdf8;
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
            margin-bottom:8px;
            font-size:30px;
            font-family:'Audiowide',sans-serif;
            letter-spacing:2px;
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
            border-radius:16px;
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
            box-shadow:0 0 20px rgba(59,130,246,0.6);
        }

        .input-box i{
            position:absolute;
            left:20px;
            top:17px;
            color:#67e8f9;
            font-size:18px;
        }

        /* Button */

        .btn{
            width:100%;
            padding:16px;
            border:none;
            border-radius:18px;
            background:linear-gradient(
                    90deg,
                    #06b6d4,
                    #8b5cf6,
                    #ec4899
            );
            background-size:300%;
            color:white;
            font-size:16px;
            font-weight:700;
            letter-spacing:1px;
            cursor:pointer;
            transition:0.5s;
            position:relative;
            overflow:hidden;
        }

        .btn:hover{
            background-position:right;
            transform:scale(1.03);
            box-shadow:0 10px 30px rgba(139,92,246,0.5);
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

        /* Error Message */

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

        /* Footer */

        .footer{
            margin-top:30px;
            text-align:center;
            color:#94a3b8;
            font-size:13px;
        }

    </style>
</head>

<body>

<div class="shape"></div>
<div class="shape"></div>
<div class="shape"></div>

<div class="login-box">

    <div class="logo">
        <i class="fa-solid fa-building-columns"></i>
    </div>

    <h2>BHUSHAN BANK</h2>

    <div class="subtitle">
        Secure Corporate Banking Portal
    </div>

    <form action="login" method="post">

        <div class="input-box">

            <i class="fa-solid fa-user"></i>

            <input type="text"
                   name="username"
                   placeholder="Enter Username"
                   required>

        </div>

        <div class="input-box">

            <i class="fa-solid fa-lock"></i>

            <input type="password"
                   name="password"
                   placeholder="Enter Password"
                   required
                   id="password">

        </div>

        <button class="btn">
            <i class="fa-solid fa-right-to-bracket"></i>
            LOGIN
        </button>

    </form>

    <div class="error">
        ${errorMessage}
    </div>

    <div class="footer">
        © 2026 Bhushan Corporate Bank
    </div>

</div>

<!-- JavaScript -->

<script>

    // Button Loading Animation

    const form = document.querySelector("form");

    form.addEventListener("submit", () => {

        const btn = document.querySelector(".btn");

        btn.innerHTML =
            "<i class='fa-solid fa-spinner fa-spin'></i> Authenticating...";

    });


    // Mouse Interactive Card Effect

    const card = document.querySelector(".login-box");

    document.addEventListener("mousemove", (e) => {

        let x =
            (window.innerWidth / 2 - e.pageX) / 35;

        let y =
            (window.innerHeight / 2 - e.pageY) / 35;

        card.style.transform =
            `rotateY(${x}deg) rotateX(${-y}deg)`;

    });


    // Password Glow Effect

    const password =
        document.getElementById("password");

    password.addEventListener("keyup", () => {

        password.style.boxShadow =
            "0 0 20px rgba(236,72,153,0.7)";

        setTimeout(() => {

            password.style.boxShadow = "none";

        }, 300);

    });

</script>

</body>
</html>