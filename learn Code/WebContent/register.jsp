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
    <!-- <script src="js/login.js"></script> -->
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
</head>

<body>
    <div class="login-page">
        <div class="form">
            <div class="login-page-title">
                <h1><a href='index.jsp'>logo</a></h1>
            </div>
            <form class="register-form" method="post" action="registerAction.jsp">
                <input type="text" placeholder="name" name="username" maxlength="15" />
                <input type="password" placeholder="password" name="password" maxlength="15" />
                <input class="email_address" type="email" name="email" placeholder="email address" />
                <input type="submit" class="button" value="create">
                <p class="message">Already registered? <a href="login.jsp">Sign In</a></p>
            </form>
        </div>
    </div>
</body>

</html>