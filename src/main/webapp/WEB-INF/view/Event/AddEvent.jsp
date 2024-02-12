<%@ page import="com.example.newcalendar.Model.Event" %>
<%@ page import="com.example.newcalendar.Service.EventSRV" %>
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

    .add-event-btn {
        background-color: #0166ff;
        color: white;
        font-weight: 400;
        transition: all 0.5s;
    }

    .event-form {
        margin-top: 70px;
        margin-bottom: 40px;
    }
    .event-form input {
        height: 50px;
    }
    .event-form label {
        color: #6d6d6d;
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
        .event-form {
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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
            integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="static/css/lib/persian-datepicker.min.css" />
    <title>Document</title>
    <script src="static/js/lib/farvardin.min.js"></script>
</head>
<%
    long idPerson1 = (long) session.getAttribute("idPerson");
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("eventFrm") != null && request.getParameter("srvId").equals("0")){
    String name = request.getParameter("eventTitleForm");
    String startTime = request.getParameter("eventStartTimeForm");
    String endTime = request.getParameter("eventEndTimeForm");
    String startDateTime = request.getParameter("eventDateForm");
    String[] parts = startDateTime.split(" ");
    String startdTime = parts[0];
    String day = parts[1];
    String description = request.getParameter("eventDesForm");
    String fr = request.getParameter("miladiDateInput");
    long idPerson = (long) session.getAttribute("idPerson");
    Event ev = new Event();
    ev.setName(name);
    ev.setStartTime(startTime);
    ev.setEndTime(endTime);
    ev.setStartDateTime(startdTime);
    ev.setDescription(description);
    ev.setStudentId((int) idPerson);
    ev.setDay(day);
    ev.setStartDateTimeFr(fr);
    new EventSRV().insertEvent(ev);
}
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("eventFrm") != null && request.getParameter("srvId").equals("1")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../Lesson/AddLesson.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("eventFrm") != null && request.getParameter("srvId").equals("2")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../MainPage/mainPage.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("eventFrm") != null && request.getParameter("srvId").equals("3")) {
        session.setAttribute("idPerson", idPerson1);
        response.sendRedirect("../ReportPage/RangeReport/rangeReport.jsp");
    }
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("eventFrm") != null && request.getParameter("srvId").equals("6")) {
        response.sendRedirect("../MainPage/SignIn.jsp");
    }


%>
<body>
<header>
    <nav class="navbar navbar-expand-lg header">
        <div class="container p-0">
            <a class="navbar-brand" href="#">
                <img src="../assets/logo.png" class="logo" alt="" />تقویم
                دانشجویی</a
            >
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div
                    class="collapse navbar-collapse tags"
                    id="navbarSupportedContent"
            >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-2 mt-lg-0">
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" aria-current="page" href="javascript:void(0);" onclick="gotoMainPage()"
                        >گزارش رویدادها</a
                        >
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link active" href="#">ثبت رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" href="javascript:void(0);" onclick="gotoReportRangePage()">گزارش بازه زمانی</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link d-block d-lg-none" href="javascript:void(0);" onclick="goToExit()"
                        >پروفایل کاربری</a
                        >
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
            <button class="m-0 add-event-btn slider-btn" id="addEventButton">
                ثبت رویداد
            </button>

            <button
                    type="button"
                    class="m-0 add-course-btn slider-btn"
                    id="addCourseButton"
                    onclick="goToLessonPage(<%=idPerson1%>)"
            >
                ثبت برنامه درسی
            </button>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 p-0 pe-lg-5">
            <div class="event-form">
                <form name="eventFrm" id="eventFrm" method="post" action="AddEvent.jsp">
                    <input type="hidden" name="eventFrm">
                    <input type="hidden" name="srvId" id="srvId">

                    <div class="mb-3">
                        <label for="eventTitleForm" class="form-label"
                        >نام رویداد</label
                        >
                        <input type="text" class="form-control" id="eventTitleForm" name="eventTitleForm" />
                        <label class="error mb-2" id="titleError"></label>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="eventStartTimeForm" class="form-label"
                                >زمان شروع رویداد</label
                                >
                                <input
                                        type="time"
                                        class="form-control"
                                        id="eventStartTimeForm"
                                        name="eventStartTimeForm"
                                />
                                <label class="error mb-2" id="startTimeError"></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="eventEndTimeForm" class="form-label"
                                >زمان پایان رویداد</label
                                >
                                <input
                                        type="time"
                                        class="form-control"
                                        id="eventEndTimeForm"
                                        name="eventEndTimeForm"
                                />
                                <label class="error mb-2" id="endTimeError"></label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="eventDateForm" class="form-label"
                        >تاریخ رویداد</label
                        >
                        <input
                                style="direction: ltr"
                                type="text"
                                class="form-control example1"
                                id="eventDateForm"
                                name="eventDateForm"
                                placeholder="yyyy/mm/dd"
                        />
                        <input type="hidden" id="miladiDateInput" name="miladiDateInput">
                    </div>
                    <label class="error mb-2" id="dateError"></label>
                    <div class="mb-3">
                        <label for="eventDesForm" class="form-label"
                        >توضیحات رویداد</label
                        >
                        <textarea
                                class="form-control"
                                id="eventDesForm"
                                name="eventDesForm"
                                rows="3"
                        ></textarea>
                    </div>
                    <button
                            type="button"
                            class="btn btn-primary w-100 submit-btn"
                            id="submitBtn"
                    >
                        ثبت
                    </button>
                </form>
            </div>
        </div>
        <div class="col-lg-6 p-0 ps-5 d-none d-lg-block">
            <div
                    class="events-container d-flex flex-column align-items-center overflow-y-auto overflow-x-hidden"
                    id="eventContainer"
            >
            </div>
        </div>
    </div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div
            id="eventToast"
            class="toast text-bg-success"
            role="alert"
            aria-live="assertive"
            aria-atomic="true"
    >
        <div class="d-flex">
            <div class="toast-body">رویداد با موفقیت ثبت شد.</div>
            <button
                    type="button"
                    class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast"
                    aria-label="Close"
            ></button>
        </div>
    </div>
</div>

<script src="static/js/lib/jquery-3.2.1.min.js"></script>
<script src="static/js/lib/persian-date.min.js"></script>
<script src="static/js/lib/persian-datepicker.min.js"></script>
<script src="static/js/app.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".example1").pDatepicker({
            format: "L dddd",
            autoClose: true,
            timePicker: {
                enabled: false,
            },
            responsive: true,
        });
    });
</script>
<script
        src="https://kit.fontawesome.com/bd1f2aaf1e.js"
        crossorigin="anonymous"
></script>
<script src="script.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {


        // Add an event listener to the submit button
        document.getElementById('submitBtn').addEventListener('click', function () {
            // Call the validateForm function when the button is clicked
            validateForm();
        });
        const storedEvents = JSON.parse(localStorage.getItem('events')) || [];

        // Display stored events in the left box
        const eventContainer = document.getElementById("eventContainer");

        storedEvents.forEach((storedEvent) => {
            const event = document.createElement("div");
            event.classList.add('event-show');

            // Display stored event details here using storedEvent properties
            const eventTitle = document.createElement("div");
            eventTitle.classList.add('event-title');
            eventTitle.innerText = storedEvent.title;

            const eventTime = document.createElement("div");
            eventTime.innerText = storedEvent.startTime + "-" + storedEvent.endTime;

            const eventDate = document.createElement("div");
            eventDate.innerText = storedEvent.date;

            // Append event details to the event container
            event.appendChild(eventTitle);
            event.appendChild(eventTime);
            event.appendChild(eventDate);

            eventContainer.appendChild(event);
        });
        localStorage.removeItem('events');
    });

    function validateForm() {
        // Get form input values
        var eventTitle = document.getElementById('eventTitleForm').value;
        var eventStartTime = document.getElementById('eventStartTimeForm').value;
        var eventEndTime = document.getElementById('eventEndTimeForm').value;
        var eventDate = document.getElementById('eventDateForm').value;
        var eventDescription = document.getElementById('eventDesForm').value;
        var eventContainer = document.getElementById("eventContainer")

        // Reset previous error messages
        resetErrors();
        let isValid = true;
        // Validate each field
        if (eventTitle.trim() === '') {
            displayError('titleError', 'نام رویداد را وارد کنید.');
            isValid = false
        }

        if (eventStartTime.trim() === '') {
            displayError('startTimeError', 'زمان شروع رویداد را وارد کنید.');
            isValid = false
        }

        if (eventEndTime.trim() === '') {
            displayError('endTimeError', 'زمان پایان رویداد را وارد کنید.');
            isValid = false
        }

        if (eventDate.trim() === '') {
            displayError('dateError', 'تاریخ رویداد را وارد کنید.');
            isValid = false
        }
        if (eventStartTime >= eventEndTime) {
            displayError('startTimeError', 'زمان شروع نمیتواند جلو تر از زمان پایان باشد.');
            isValid = false
        }


        if (isValid){
            String.prototype.toEnglishDigit = function () {
                var find = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
                var replace = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
                var replaceString = this;
                var regex;
                for (var i = 0; i < find.length; i++) {
                    regex = new RegExp(find[i], "g");
                    replaceString = replaceString.replace(regex, replace[i]);
                }
                return replaceString;
            };


            var shamsiDateStr = document.getElementById('eventDateForm').value
            var jadid = shamsiDateStr.slice(0,10)
            var fa_number = jadid;
            jadid = fa_number.toEnglishDigit();
            var substrings = jadid.split("/");
            const storedEvents = JSON.parse(localStorage.getItem('events')) || [];
            storedEvents.push({
                title: eventTitle,
                startTime: eventStartTime,
                endTime: eventEndTime,
                date: eventDate,
                description: eventDescription
            });
            localStorage.setItem('events', JSON.stringify(storedEvents));

            document.getElementById('miladiDateInput').value = farvardin.solarToGregorian(Number(substrings[0]) , Number(substrings[1]) , Number(substrings[2]) , "string")
            document.getElementById("srvId").value = "0";
            document.getElementById("eventFrm").submit()
            localStorage.setItem('showEventToast', 'true');
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
        document.getElementById('dateError').innerText = '';
        // Add more error resets as needed
    }
    const showToastFlag = localStorage.getItem('showEventToast');
    if (showToastFlag === 'true') {
        const toastLive = document.getElementById('eventToast');
        const toastBootstrap = new bootstrap.Toast(toastLive);
        toastBootstrap.show();

        // Remove the flag after showing the toast
        localStorage.removeItem('showEventToast');
    }
</script>

<script>
    function goToLessonPage() {
        document.getElementById("srvId").value = "1";
        document.getElementById("eventFrm").submit();
    }

    function gotoMainPage(){
        document.getElementById("srvId").value = "2";
        document.getElementById("eventFrm").submit();
    }

    function gotoReportRangePage(){
        document.getElementById("srvId").value = "3";
        document.getElementById("eventFrm").submit();
    }

    function goToExit(){
        document.getElementById("srvId").value = "6";
        document.getElementById("eventFrm").submit();
    }
</script>