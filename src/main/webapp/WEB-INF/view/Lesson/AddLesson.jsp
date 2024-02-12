<%@ page import="com.example.newcalendar.Model.Event" %>
<%@ page import="com.example.newcalendar.Service.EventSRV" %>
<%@ page import="com.example.newcalendar.Model.Lesson" %>
<%@ page import="com.example.newcalendar.Service.LessonSRV" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html dir="rtl" lang="fa-IR">
<style>
    @font-face {
        font-family: Vaziri;
        src: url("../fonts/Vazirmatn[wght].ttf") format("woff");
    }

    * {
        font-family: Vazirmatn;
        box-sizing: border-box;
    }

    body {
        background-color: #f5f5f5 !important;
    }

    /*Header*/

    .header {
        background-color: #97bdfe;
    }

    .logo {
        width: 60px;
    }

    .tags {
        margin-right: 30px;
    }

    .navbar-brand {
        font-weight: 700;
    }

    .fa-arrow-right-from-bracket {
        font-size: 25px;
    }

    .link {
        font-size: 18px;
        color: #18272f;
        position: relative;
        text-decoration: none;
    }

    .link::before {
        content: "";
        position: absolute;
        width: 100%;
        height: 2px;
        border-radius: 4px;
        background-color: #314f9c;
        bottom: 0;
        left: 0;
        transform-origin: left;
        transform: scaleX(0);
        transition: transform 0.2s ease-in-out;
    }

    .link:hover::before {
        transform-origin: right;
        transform: scaleX(1);
    }
    /*Header*/

    .slider-btn {
        padding: 10px 60px;
        border: none;
        border-radius: 10px;
        background-color: transparent;
        color: #818181;
        font-weight: 400;
    }
    .toggle-btn {
        margin-top: 40px;
    }

    .btn-con {
        box-shadow: 0px 0px 10px 0px rgb(216, 216, 216);
        background-color: white;
        border-radius: 14px;
        padding: 5px;
    }

    .add-course-btn {
        background-color: #0166ff;
        color: white;
        font-weight: 400;
        transition: all 0.5s;
    }

    .course-form {
        margin-top: 70px;
        margin-bottom: 40px;
    }

    .course-form label {
        color: #6d6d6d;
    }
    .course-days{
        transition: all 1s;
    }
    #courseEachWeek{
        display: none;
        transition: all 1s;
    }



    .submit-btn {
        margin-top: 20px;
        height: 50px;
        font-size: 20px !important;
    }

    .events-container {
        width: 100%;
        height: 60vh;
        background-color: white;
        margin-top: 70px;
        border-radius: 15px;
        box-shadow: 0px 0px 20px 2px rgb(231, 231, 231);
        padding: 20px 40px;
    }
    .event-show {
        font-weight: 500;
        width: 100%;
        background-color: #f5f5f5;
        padding: 20px;
        margin-top: 20px;
        border-radius: 10px;
        display: flex;
        justify-content: space-between;
    }
    .event-title {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        width: 140px; /* some width */
    }

    .error{
        font-size: 14px;
        opacity: 90%;
        margin-bottom: 40px;
        color: red !important;
    }
    .toast{
        font-size: 16px !important;
        width: 400px !important;
        height: 50px !important;
    }


    @media only screen and (max-width: 575px) {
        .logo {
            width: 45px;
        }
        .navbar-brand {
            font-size: 15px !important;
        }
        .nav-item{
            font-size: 15px;
        }
        .slider-btn{
            padding: 10px 30px;
            font-size: 14px;
        }
        .toggle-btn {
            margin-top: 30px;
        }
        .course-form {
            margin-top: 10px;
            font-size: 15px;
            padding: 20px;
        }
    }
    @media only screen and (max-width: 350px) {
        .slider-btn{
            padding: 10px 20px;
            font-size: 14px;
        }
    }
    @media only screen and (max-width: 1200px) {
        .event-show{
            font-size: 14px;
        }
    }


</style>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
          integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous" />
    <title>Document</title>
</head>
<%
    long idPerson1 = (long) session.getAttribute("idPerson");
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("lessonFrm") != null && request.getParameter("srvId").equals("0")) {
        String name = request.getParameter("courseTitleForm");
        String quarter = request.getParameter("inlineRadioOptions");
        String endTime = request.getParameter("courseEndTimeForm");
        String startTime = request.getParameter("courseStartTimeForm");
        String saturday = request.getParameter("saturday");
        String sunday = request.getParameter("sunday");
        String monday = request.getParameter("monday");
        String tuesday = request.getParameter("tuesday");
        String wednesday = request.getParameter("wednesday");
        String thursday = request.getParameter("thursday");
        String zojfard = request.getParameter("zojFard");
        long idPerson = (long) session.getAttribute("idPerson");
        Lesson ls = new Lesson();
        ls.setName(name);
        ls.setQuarter(Integer.parseInt(quarter));
        ls.setStartDateTime(startTime);
        ls.setEndDateTime(endTime);
        if (saturday != null) {
            ls.setSaturday(Integer.parseInt(saturday));
        }
        if (sunday != null) {
            ls.setSunday(Integer.parseInt(sunday));
        }
        if (monday != null) {
            ls.setMonday(Integer.parseInt(monday));
        }
        if (tuesday != null) {
            ls.setTuesday(Integer.parseInt(tuesday));
        }
        if (wednesday != null) {
            ls.setWednesday(Integer.parseInt(wednesday));
        }
        if (thursday != null) {
            ls.setThursday(Integer.parseInt(thursday));
        }
        ls.setStudentId((int) idPerson);
        ls.setZojFard(Integer.parseInt(zojfard));
        new LessonSRV().insertLesson(ls);
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("lessonFrm") != null && request.getParameter("srvId").equals("1")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../Event/AddEvent.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("lessonFrm") != null && request.getParameter("srvId").equals("2")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../MainPage/mainPage.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("lessonFrm") != null && request.getParameter("srvId").equals("3")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../ReportPage/RangeReport/rangeReport.jsp");
    }
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("lessonFrm") != null && request.getParameter("srvId").equals("6")) {
        response.sendRedirect("../MainPage/SignIn.jsp");
    }

%>

<body>
<header>
    <nav class="navbar navbar-expand-lg header">
        <div class="container p-0">
            <a class="navbar-brand" href="#">
                <img src="../assets/logo.png" class="logo" alt="" />تقویم
                دانشجویی</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse tags" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-2 mt-lg-0">
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" aria-current="page" href="javascript:void(0);" onclick="gotoMainPage()">گزارش رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link active" href="#">ثبت رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" href="javascript:void(0);" onclick="gotoReportRangePage()">گزارش بازه زمانی</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link d-block d-lg-none" href="javascript:void(0);" onclick="goToExit()">پروفایل کاربری</a>
                    </li>
                </ul>
                <a class="profile text-black" href="javascript:void(0);" onclick="goToExit()">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                </a>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="toggle-btn d-flex justify-content-center">
        <div class="btn-con" id="btnContainer">
                <button class="m-0 add-event-btn slider-btn" id="addEventButton" onclick="goToEventPage(<%=idPerson1%>)">
                    ثبت رویداد
                </button>
            <button class="m-0 add-course-btn slider-btn" id="addCourseButton">
                ثبت برنامه درسی
            </button>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 p-0 pe-lg-5">
            <div class="course-form">
                <form name="lessonFrm" id="lessonFrm" method="post" action="AddLesson.jsp">
                    <input type="hidden" name="lessonFrm">
                    <input type="hidden" name="srvId" id="srvId">
                    <div class="mb-3">
                        <label class="d-inline me-2">نیم سال تحصیلی:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                   value="1">
                            <label class="form-check-label" for="inlineRadio1">اول</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                   value="2">
                            <label class="form-check-label" for="inlineRadio2">دوم</label>
                        </div>
                        <label class="error mb-2 d-block" id="semesterError"></label>
                    </div>
                    <div class="mb-3">
                        <label for="courseTitleForm" class="form-label">نام درس</label>
                        <input type="text" class="form-control" id="courseTitleForm" name="courseTitleForm" />
                        <label class="error mb-2" id="titleError"></label>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="courseStartTimeForm" class="form-label">زمان شروع کلاس</label>
                                <input type="time" class="form-control" id="courseStartTimeForm" name="courseStartTimeForm" />
                                <label class="error mb-2" id="startTimeError"></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="courseEndTimeForm" class="form-label">زمان پایان کلاس</label>
                                <input type="time" class="form-control" id="courseEndTimeForm" name="courseEndTimeForm" />
                                <label class="error mb-2" id="endTimeError"></label>
                            </div>
                        </div>
                    </div>
                    <select class="form-select mb-4" aria-label="select" id="zojFard" name="zojFard">
                        <option selected value="1">همه هفته ها</option>
                        <option value="2">هفته های فرد</option>
                        <option value="3">هفته های زوج</option>
                    </select>
                    <div class="course-days" id="courseAllWeek">
                        <label class="d-block mb-2">چه روزهایی در هفته این درس را دارید؟</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="saturday" name="saturday" value="1">
                            <label class="form-check-label" for="saturday">شنبه</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="sunday" name="sunday" value="1">
                            <label class="form-check-label" for="sunday">یکشنبه</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="monday" name="monday" value="1">
                            <label class="form-check-label" for="monday">دوشنبه</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="tuesday" name="tuesday" value="1">
                            <label class="form-check-label" for="tuesday">سه‌شنبه</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="wednesday" name="wednesday" value="1">
                            <label class="form-check-label" for="wednesday">چهار‌شنبه</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="thursday" name="thursday" value="1">
                            <label class="form-check-label" for="thursday">پنج‌شنبه</label>
                        </div>
                        <label class="error mb-2 d-block" id="weekDayError"></label>
                    </div>


                    <button type="button" class="btn btn-primary w-100 submit-btn" id="submitBtn">
                        ثبت
                    </button>
                </form>
            </div>
        </div>
        <div class="col-lg-6 p-0 ps-5 d-none d-lg-block">
            <div class="events-container d-flex flex-column align-items-center overflow-y-auto overflow-x-hidden"
                 id="eventContainer"></div>
        </div>
    </div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast text-bg-success" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">درس با موفقیت ثبت شد.</div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>

<script src="https://kit.fontawesome.com/bd1f2aaf1e.js" crossorigin="anonymous"></script>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
<script>







    document.addEventListener('DOMContentLoaded', function () {
        // Add an event listener to the submit button
        document.getElementById('submitBtn').addEventListener('click', function () {
            // Call the validateForm function when the button is clicked
            validateForm();
        });
    });

    function validateForm() {
        // Get form input values
        var courseTitle = document.getElementById('courseTitleForm').value;
        var courseStartTime = document.getElementById('courseStartTimeForm').value;
        var courseEndTime = document.getElementById('courseEndTimeForm').value;
        var checkboxes = document.querySelectorAll('.course-days input[type="checkbox"]');
        var radioButtons = document.querySelectorAll('input[name="inlineRadioOptions"]');
        // Reset previous error messages
        resetErrors();
        let isValid = true;
        // Validate each field
        if (courseTitle.trim() === '') {
            displayError('titleError', 'نام درس را وارد کنید.');
            isValid = false
        }

        if (courseStartTime.trim() === '') {
            displayError('startTimeError', 'زمان شروع درس را وارد کنید.');
            isValid = false
        }

        if (courseEndTime.trim() === '') {
            displayError('endTimeError', 'زمان پایان درس را وارد کنید.');
            isValid = false
        }

        else if (courseStartTime >= courseEndTime) {
            displayError('startTimeError', 'زمان شروع نمیتواند جلو تر از زمان پایان باشد.');
            isValid = false
        }
        var isAnyCheckboxChecked = Array.from(checkboxes).some((checkbox) => checkbox.checked);

        if (!isAnyCheckboxChecked) {
            displayError('weekDayError', 'حداقل یک روز از هفته را انتخاب کنید.');
            isValid = false;
        }
        var isAnyRadioButtonSelected = Array.from(radioButtons).some((radioButton) => radioButton.checked);

        if (!isAnyRadioButtonSelected) {
            displayError('semesterError', 'نیم سال تحصیلی را انتخاب کنید.');
            isValid = false;
        }

        if (isValid) {
            const courseT = document.createElement("div");
            courseT.innerHTML = courseTitle
            courseT.classList.add('course-title')


            const courseTime = document.createElement("div");
            const courseStime = document.createElement("div");
            const courseEtime = document.createElement("div");
            courseStime.innerHTML = courseStartTime
            courseEtime.innerHTML = courseEndTime
            courseTime.classList.add("d-flex")

            courseTime.appendChild(courseEtime)
            courseTime.append('-')
            courseTime.appendChild(courseStime)



            const course = document.createElement("div");
            course.classList.add('course-show')
            course.appendChild(courseT)
            course.appendChild(courseTime)
            eventContainer.appendChild(course)

            const toastLive = document.getElementById('liveToast')
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLive)
            toastBootstrap.show()
            document.getElementById("srvId").value = "0"
            document.getElementById("lessonFrm").submit()

        }

        return isValid;
        // Example: document.getElementById('yourFormId').submit();
    }

    function displayError(elementId, message) {
        // Display error message for the specified element
        document.getElementById(elementId).innerText = message;
    }

    function resetErrors() {
        // Reset all error messages
        document.getElementById('titleError').innerText = '';
        document.getElementById('startTimeError').innerText = '';
        document.getElementById('endTimeError').innerText = '';
        document.getElementById('weekDayError').innerText = '';
        document.getElementById('semesterError').innerText = '';
        // Add more error resets as needed
    }
</script>

<script>
    function goToEventPage() {
        document.getElementById("srvId").value = "1";
        document.getElementById("lessonFrm").submit();
    }

    function gotoMainPage(){
        document.getElementById("srvId").value = "2";
        document.getElementById("lessonFrm").submit();
    }

    function gotoReportRangePage(){
        document.getElementById("srvId").value = "3";
        document.getElementById("lessonFrm").submit();
    }
    function goToExit(){
        document.getElementById("srvId").value = "6";
        document.getElementById("lessonFrm").submit();
    }
</script>