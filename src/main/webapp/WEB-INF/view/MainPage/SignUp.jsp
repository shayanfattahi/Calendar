<%@ page import="com.example.newcalendar.Model.Student" %>
<%@ page import="com.example.newcalendar.Service.StudentSRV" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html dir="rtl" lang="fa-IR">
<style>

    *{
        font-family: Vazirmatn;
    }

    .sign-in-con{
        width: 600px;
    }
    .page-img{
        background: url('../assets/calendar.png') no-repeat;
        background-size:cover;
        background-position: center;
    }
    .welcome-text{
        font-size: 40px;
        font-weight:800 ;
    }
    .addinfo-text{
        margin-top: 20px;
        font-size: 18px;
        color: #818181;
        font-weight: 400;
    }
    .welcome-texts{
        margin-top: 100px;
    }




    .slider-btn{
        padding: 14px 70px;
        border: none;
        border-radius: 10px;
        background-color: transparent;
        color: #818181;
        font-weight: 400;
    }
    .toggle-btn{
        margin-top: 20px;
    }

    .btn-con{
        background-color:#F0F0F2;
        border-radius: 10px;
        padding: 5px;
    }

    .signup-btn{
        background-color: #ffff;
        color: black;
        font-weight: 800;
        transition: all .5s ;
    }



    .form{
        margin-top: 30px;
    }
    .form input{
        border-color: #b8b8b8;
        height: 50px;
    }
    .form label{
        color: #818181;
    }
    .form-text{
        color: #a0a0a0 !important;
    }
    .submit-btn{
        margin-top: 20px;
        height: 55px;
        font-size: 20px !important;
    }
    .input-con:focus-within label {
        color: rgb(46, 46, 46);
    }
    .captcha-container:focus-within label {
        color: rgb(46, 46, 46);
    }

    .error{
        font-size: 14px;
        opacity: 90%;
        margin-bottom: 40px;
        color: red !important;
    }





    #captchaText {
        display: inline;
        font-size: 24px;
        margin-bottom: 20px;
    }

    #inputCaptcha {
        display: inline;
        width: 200px;
        font-size: 16px;
        margin-left: 20px;

    }

    #feedback {
        margin-top: 10px;
        color: red !important;
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
          integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous">
    <title>Document</title>
</head>

<%
    int res = 1;
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("signUpFrm") != null){
    String userName = request.getParameter("InputUsername");
    String passWord = request.getParameter("InputPassword");
    String email = request.getParameter("InputEmail");
    Student student = new Student();
    student.setUserName(userName);
    student.setPassword(passWord);
    student.setEmail(email);
    res = new StudentSRV().insertStudent(student);
}%>
<body>
<!--Login default page-->
<div class="container-fluid m-0 ">
    <div class="row vh-100">
        <div class="col-xl-6 col-12 p-0 m-0 ">
            <div class="d-flex justify-content-center ">
                <div class="sign-in-con">
                    <div class="welcome-texts ">
                        <h1 class="welcome-text">خوش آمدید!</h1>
                        <p class="addinfo-text">لطفا اطلاعات خود را وارد کنید.</p>
                    </div>
                    <div class="toggle-btn d-flex justify-content-center">
                        <div class="btn-con" id="btnContainer">
                            <button class="m-0  signin-btn slider-btn" id="signinButton" onclick="goToSignIn()">ورود</button ></a>
                            <button class="m-0  signup-btn slider-btn"  id="signupButton">ثبت نام</button>
                        </div>
                    </div>
                    <div class="form">
                        <form method="post" name="signUpFrm" id="signUpFrm" action="SignUp.jsp">
                            <input type="hidden" name="signUpFrm">
                            <input type="hidden" name="res" id="res" value="<%=res%>">

                            <div class="input-con">
                                <label for="InputUsername" class="form-label ">نام کاربری خود را وارد کنید</label>
                                <input type="text" class="form-control " novalidate id="InputUsername" name="InputUsername"
                                >
                                <label class="error mb-2" id="nameError"></label>
                            </div>
                            <div class="input-con">
                                <label for="InputEmail" class="form-label ">ایمیل خود را وارد کنید</label>
                                <input type="email" class="form-control " novalidate id="InputEmail" name="InputEmail"
                                       aria-describedby="emailHelp">
                                <label class="error mb-2" id="useError"></label>
                            </div>
                            <div class="input-con">
                                <label for="InputPassword" class="form-label">گذرواژه خود را وارد کنید</label>
                                <input type="password" class="form-control" novalidate id="InputPassword" name="InputPassword"
                                       style="direction: ltr;">
                                <div id="passwordHelpBlock" class="form-text ">
                                    رمز عبور شما باید 8 تا 20 کاراکتر باشد، حروف و اعداد داشته باشد و نباید دارای
                                    فاصله و کاراکترهای خاص باشد.
                                </div>
                                <label class="error mb-2" id="passError"></label>
                            </div>
                            <div class="captcha-container">
                                <label for="inputCaptcha" class="form-label d-block">کپچا را وارد کنید</label>
                                <input type="text" id="inputCaptcha" class="form-control ">
                                <p id="captchaText" class=""></p>
                                <button type="button" class="btn  refresh-btn" onclick="generateCaptcha()"><i
                                        class="fa-solid fa-arrows-rotate"></i></button>
                                <p id="feedback" class="form-text d-block mb-2"></p>

                            </div>
                            <button type="button" class="btn btn-primary w-100 submit-btn" id="submitBtn"
                                    onclick="validateForm()">ورود</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-xl-6 p-0 m-0 page-img d-xl-block d-none">

        </div>
    </div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div
            id="liveToast"
            class="toast text-bg-success"
            role="alert"
            aria-live="assertive"
            aria-atomic="true"
    >

        <div class="d-flex">
            <div class="toast-body">ثبت نام با موفقیت انجام شد.</div>
            <button
                    type="button"
                    class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast"
                    aria-label="Close"
            ></button>
        </div>
    </div>
</div>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div
            id="liveToastFalse"
            class="toast text-bg-danger"
            role="alert"
            aria-live="assertive"
            aria-atomic="true"
    >

        <div class="d-flex">
            <div class="toast-body">ثبت نام با موفقیت انجام نشد<br>ایمیل تکراری است.</div>
            <button
                    type="button"
                    class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast"
                    aria-label="Close"
            ></button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bd1f2aaf1e.js" crossorigin="anonymous"></script>
</body>

</html>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        generateCaptcha();
    });


    function generateCaptcha() {
        var captchaText = generateRandomString(6);
        document.getElementById("captchaText").textContent = captchaText;
    }

    function generateRandomString(length) {
        var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var result = "";
        for (var i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }

    function validateCaptcha() {
        let valid = false
        var enteredText = document.getElementById("inputCaptcha");
        var captchaText = document.getElementById("captchaText").textContent;
        var feedback = document.getElementById("feedback")
        if (enteredText.value !== captchaText) {
            feedback.textContent = "کپچا نادرست است.";
            enteredText.style.borderBottom = "2px solid red";
            generateCaptcha();
        }
        else{
            enteredText.style.borderBottom = '1px solid #c7c7c7';
            feedback.textContent = "";
            valid = true
            return valid
        }
    }


    function validateForm() {
        let count = 0;
        const email = document.getElementById("InputEmail");
        const password = document.getElementById("InputPassword");
        const emailError = document.getElementById('useError');
        const passError = document.getElementById('passError');
        const nameError = document.getElementById("nameError")
        const emailPattern = /^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const passMess = document.getElementById('passwordHelpBlock');
        const InputUsername = document.getElementById('InputUsername')
        function setError(element, message) {
            element.style.borderBottom = "2px solid red";
            if (element === email) {
                emailError.innerHTML = message;
            }
            if (element === password) {
                passError.innerHTML = message;
                passMess.style.display="none";
            }
            if (element === InputUsername) {
                nameError.innerHTML = message;
            }
        }

        let isValid = true;

        // Check email
        if (email.value.trim() === "") {
            setError(email, 'ایمیل نمیتواند خالی باشد.');
            isValid = false;
        } else if (!emailPattern.test(email.value)) {
            setError(email, 'ایمیل نامعتبر است.');
            isValid = false;
        } else {
            email.style.borderBottom = '1px solid #c7c7c7';
            emailError.innerHTML = '';
            count++;
        }

        // Check password
        if (password.value.trim() === "") {
            setError(password, 'رمز عبور نمیتواند خالی باشد.');
            isValid = false;
        } else if (password.value.trim().length < 8) {
            setError(password, 'رمز عبور باید حداقل 8 کاراکتر داشته باشد.');
            isValid = false;
        } else if (!/[0-9]/.test(password.value) || !/[A-Z]/.test(password.value) || !/[a-z]/.test(password.value)) {
            setError(password, 'رمز عبور باید شامل حداقل یک عدد، یک حرف بزرگ و یک حرف کوچک باشد.');
            isValid = false;
        } else{
            password.style.borderBottom = '1px solid #c7c7c7';
            passError.innerHTML = '';
            count++;
        }
        if (InputUsername.value.trim() === "") {
            setError(InputUsername, 'نام کاربری نمیتواند خالی باشد.');
            isValid = false;
        } else if (!/^[a-zA-Z0-9_-]{3,20}$/.test(InputUsername.value)) {
            setError(InputUsername, 'نام کاربری باید حداقل 3 و حداکثر 20 کاراکتر داشته باشد و تنها شامل حروف انگلیسی (a-z, A-Z) و اعداد (0-9) و _ و - باشد.');
            isValid = false;
        } else {
            InputUsername.style.borderBottom = '1px solid #c7c7c7';
            nameError.innerHTML = '';
            count++;
        }

        if (isValid && validateCaptcha()){
            // document.getElementById("signUpFrm").action = '/MainPage/SignUpActionInsert'
            document.getElementById("signUpFrm").submit()

        }
        return isValid;

    }

    console.log(document.getElementById("res").value)
    if (document.getElementById("res").value == '2'){
        localStorage.setItem('showToast', 'true');
    }
    if(document.getElementById("res").value == '0'){
        localStorage.setItem('showToastFalse', 'true');
    }
    const showToastFlag = localStorage.getItem('showToast');
    if (showToastFlag === 'true') {
        const toastLive = document.getElementById('liveToast');
        const toastBootstrap = new bootstrap.Toast(toastLive);
        toastBootstrap.show();

        // Remove the flag after showing the toast
        localStorage.removeItem('showToast');
    }

    const showToastFlag2 = localStorage.getItem('showToastFalse');
    if (showToastFlag2 === 'true') {
        const toastLive = document.getElementById('liveToastFalse');
        const toastBootstrap = new bootstrap.Toast(toastLive);
        toastBootstrap.show();

        // Remove the flag after showing the toast
        localStorage.removeItem('showToastFalse');
    }
</script>
<script>
    function goToSignIn(){
        window.location.href = '../MainPage/SignIn.jsp'
    }
</script>