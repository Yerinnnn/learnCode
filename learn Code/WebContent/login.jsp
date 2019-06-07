<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="google-signin-client_id" content="415926829985-5c8jd42akukepimbebae0tnf09lb9sna.apps.googleusercontent.com">
    <title>learn Code</title>

    <link rel="stylesheet" href="css/login.css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="js/login.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
</head>

<body>
    <div class="login-page">
        <div class="form">
            <div class="login-page-title" id="logo">
                <h1><a href='index2.jsp'>learn Code</a></h1>
            </div>
            <form class="login-form" method="post" action="loginAction.jsp">
                <input type="text" placeholder="username" name="username" maxlength="15"/>
                <input type="password" placeholder="password" name="password" maxlength="15"/>
                <input type="submit" class="button" value="login">
                <!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
                <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
            </form>
        </div>
    </div>
</body>

</html>