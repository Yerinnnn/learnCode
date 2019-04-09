<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>learn Code</title>

    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
</head>

<body>
    <div class="login-page">
        <div class="form">
            <div class="login-page-title">
                <h1><a href='index.jsp'>logo</a></h1>
            </div>
            <form class="login-form" method="post" action="loginAction.jsp">
                <input type="text" placeholder="username" maxlength="15"/>
                <input type="password" placeholder="password" maxlength="15"/>
                <input type="submit" class="button" value="login">
                <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
            </form>
        </div>
    </div>
</body>

</html>