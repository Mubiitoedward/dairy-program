
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <link rel="stylesheet" href="assets/css/login.css">
    <title>Admin Login</title>
</head>

<body>
    
    <div class="container">
        <div class="signin-sign-up">
            <form action="/DiaryProducts/Admin_login" method ="post" class="sign-in-form">
                <h2 class="title">Login</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="Username" name="username">
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" name="pass">
                </div>
                <%--<a href="#" class="forgot-password">Forgot password</a>--%>
                <input type="submit" value="Login" class="btn">
                <p>Don't have an account? <a href="/DiaryProducts/Registration" class="account-text" id="sign-up-link">Sign up</a></p>
            </form>
            
        </div>
    </div>
    <script src="assets/css/login.js"></script>
</body>

</html>
