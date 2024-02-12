<%@ page import="com.example.newcalendar.Model.Student" %>
<%@ page import="com.example.newcalendar.Service.StudentSRV" %>
<%@ page import="com.example.newcalendar.Model.Event" %>
<%@ page import="com.example.newcalendar.Service.EventSRV" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html dir="rtl" lang="fa-IR">

<style>


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
        color: #18272F;
        position: relative;
        text-decoration: none;
    }

    .link::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 2px;
        border-radius: 4px;
        background-color: #314F9C;
        bottom: 0;
        left: 0;
        transform-origin: left;
        transform: scaleX(0);
        transition: transform .2s ease-in-out;
    }

    .link:hover::before {
        transform-origin: right;
        transform: scaleX(1);
    }

    /*Header*/


    /*main*/


    /* above texts and select option */
    .welcome-texts {
        margin-top: 60px;
    }

    .welcome-text {
        font-size: 40px;
        font-weight: 900;
    }

    .waving-hand {
        margin-right: 12px;
        width: 50px;
        height: 50px;
    }

    .date {
        margin-top: 5px;
        font-size: 24px;
        color: #818181;
    }

    /* above texts and select option */

    /* events */
    .fa-trash-can {
        color: red;
        font-size: 20px;
    }

    .event-con {
        margin-top: 30px;
    }

    .event {
        font-size: 18px;
        font-weight: 600;
        border-radius: 7px;
        background-color: white;
        padding: 5px;
    }

    .fa-clock {
        vertical-align: middle;
        padding-right: 7px;
    }

    .time-con {
        direction: ltr;
        color: #6D6D6D;
        background-color: #f5f5f5;
        padding: 3px 10px;
        border-radius: 6px;
        font-weight: 500;
    }

    .time {
        padding-top: 3px;
        font-size: 16px;
    }

    .fa-chevron-down {
        color: #6D6D6D;
        background-color: #f5f5f5;
        padding: 9px;
        border-radius: 6px;
    }

    .toggle {
        rotate: 180deg;
    }

    .event-des {
        color: #6D6D6D !important;
        font-weight: 400;
        font-size: 16px;
    }

    /* events */


    @media only screen and (max-width: 800px) {
        .welcome-texts {
            margin-top: 40px;
        }

        .welcome-text {
            font-size: 30px;
        }

        .waving-hand {
            width: 40px;
            height: 40px;
        }

        .date {
            font-size: 18px;
        }


        .fa-trash-can {
            font-size: 18px;
        }

        .event {
            font-size: 16px;
        }

        .time {
            padding-top: 3px;
            font-size: 13px;
        }

        .fa-chevron-down {
            font-size: 15px;
        }

        .event-des {
            font-size: 14px;
        }

    }

    @media only screen and (max-width: 500px) {
        .logo {
            width: 45px;
        }

        .navbar-brand {
            font-size: 15px !important;
        }

        .welcome-texts {
            margin-top: 30px;
        }

        .welcome-text {
            font-size: 25px;
        }

        .waving-hand {
            width: 35px;
            height: 35px;
        }

        .date {
            font-size: 15px;
        }



        .fa-trash-can {
            font-size: 15px;
        }

        .event {
            font-size: 14px;
        }

        .time {
            font-size: 12px;
        }

        .fa-chevron-down {
            font-size: 10px;
        }

        .fa-clock {
            display: none !important;
        }

        .event-des {
            font-size: 12px;
        }

        .nav-item {
            font-size: 15px;
        }
    }
</style>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
            integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./static/css/lib/persian-datepicker.min.css" />
    <title>Document</title>
</head>
<body>

<form name="mainPageFrm" id="mainPageFrm" action="mainPage.jsp" method="post">
    <input type="hidden" name="srvId" id="srvId">
    <input type="hidden" name="deId" id="deId">
    <input type="hidden" name="mainPageFrm">
    <%
        Long idPerson = (Long) session.getAttribute("idPerson");
        Student student = new Student();
        student = new StudentSRV().readById(Math.toIntExact(idPerson));
        List<Event> events = new ArrayList<>();
        events = new EventSRV().readEventByIdAndDay(Math.toIntExact(idPerson));
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("mainPageFrm") != null && request.getParameter("srvId").equals("1")) {
            session.setAttribute("idPerson", idPerson);
            response.sendRedirect("../Event/AddEvent.jsp");
        }

        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("mainPageFrm") != null && request.getParameter("srvId").equals("2")) {
            new EventSRV().delete(Long.parseLong(request.getParameter("deId")));
            response.sendRedirect("../MainPage/mainPage.jsp");

        }

        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("mainPageFrm") != null && request.getParameter("srvId").equals("4")) {
            session.setAttribute("idPerson", idPerson);
            response.sendRedirect("../ReportPage/RangeReport/rangeReport.jsp");
        }

        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("mainPageFrm") != null && request.getParameter("srvId").equals("5")) {
            session.setAttribute("idPerson", idPerson);
            response.sendRedirect("../ReportPage/reportWeekly.jsp");
        }
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("mainPageFrm") != null && request.getParameter("srvId").equals("6")) {
            response.sendRedirect("../MainPage/SignIn.jsp");
        }
    %>
    <header>
        <nav class="navbar navbar-expand-lg header">
            <div class="container p-0">
                <a class="navbar-brand" href="#">
                    <img src="../assets/logo.png" class="logo" alt=""/>تقویم
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
                            <a class="nav-link active" aria-current="page" href="#"
                            >گزارش رویدادها</a
                            >
                        </li>
                        <li class="nav-item ms-lg-2 link">
                            <a class="nav-link" href="javascript:void(0);" onclick="submitForm(<%=student.getId()%>)">ثبت
                                رویدادها</a>

                        </li>
                        <li class="nav-item ms-lg-2 link">
                            <a class="nav-link" href="javascript:void(0);" onclick="goToReportRangePage(<%=student.getId()%>)">گزارش بازه زمانی</a>
                        </li>
                        <li class="nav-item ms-lg-2 link">
                            <a class="nav-link d-block d-lg-none" onclick="goToExit()"
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
        <div class="Main-text">
            <div class="welcome-texts d-flex">
                <h1 class="welcome-text">سلام <%=student.getUserName()%> عزیز!</h1>
                <img
                        class="waving-hand"
                        src="../assets/waving-hand_1f44b.png"
                        alt="waving hand"
                />
            </div>
            <div class="top-con d-flex justify-content-between">
                <div class="date">
                    <p id="todayDate"></p>
                </div>
                <div class="select-view">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            نمایش
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item active" href="#">روزانه</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);" onclick="goToWeekly(<%=student.getId()%>)">هفتگی</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="event-con">
                <%for (int i = 0; i <= events.size() - 1; i++) {%>
                <div class="event mb-2"<%=i%>>
                    <div class="title-clock-con d-flex justify-content-between">
                        <div class="event-header d-flex align-items-center">
                            <button class="btn m-0 d-flex" onclick="deleteEvent(<%=events.get(i).getId()%>)">
                                <i class="fa-regular fa-trash-can"></i>
                            </button>
                            <p class="title m-0"><%=events.get(i).getName()%></p>
                        </div>
                        <div class="event-header d-flex align-items-center">
                            <div class="time-con d-flex align-items-center">
                                <div>
                                    <i class="fa-regular fa-clock m-0"></i>
                                </div>
                                <p class="time m-0"><%=events.get(i).getStartTime()%> _ <%=
                                    events.get(i).getEndTime()%></p>
                            </div>
                            <button
                                    class="btn m-0 d-flex"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseExample<%=events.get(i).getId()%>"
                                    onclick="rotateBtn()"
                            >
                                <i class="fa-solid fa-chevron-down" id="downBtn"></i>
                            </button>
                        </div>
                    </div>
                    <div class="collapse" id="collapseExample<%=events.get(i).getId()%>">
                        <div class="event-des card card-body">
                            <%=events.get(i).getDescription()%>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>

</form>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div
            id="liveToast"
            class="toast text-bg-success"
            role="alert"
            aria-live="assertive"
            aria-atomic="true"
    >

        <div class="d-flex">
            <div class="toast-body">ورود با موفقیت انجام شد.</div>
            <button
                    type="button"
                    class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast"
                    aria-label="Close"
            ></button>
        </div>
    </div>
</div>
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
<script src="./static/js/lib/jquery-3.2.1.min.js"></script>
<script src="./static/js/lib/persian-date.min.js"></script>
<script src="./static/js/lib/persian-datepicker.min.js"></script>
<script src="./static/js/app.js"></script>
</body>
</html>

<script>
    const downBtn = document.getElementById('downBtn')

    function rotateBtn() {
        downBtn.classList.toggle("toggle");
    }
    const now = new persianDate().format("dddd D MMMM YYYY")
    console.log(now)
    let todayDate = document.getElementById("todayDate")
    todayDate.innerHTML ="امروز، " + now
</script>

<script>
    function submitForm() {
        document.getElementById("srvId").value = "1";
        document.getElementById("mainPageFrm").submit();
    }

    function deleteEvent(id) {
        document.getElementById("srvId").value = "2";
        document.getElementById("deId").value = id;
        document.getElementById("mainPageFrm").submit();
    }

    function goToReportWeekly(){
        document.getElementById("srvId").value = "3";
        document.getElementById("mainPageFrm").submit();
    }

    function goToReportRangePage(){
        document.getElementById("srvId").value = "4";
        document.getElementById("mainPageFrm").submit();
    }

    function goToWeekly(){
        document.getElementById("srvId").value = "5";
        document.getElementById("mainPageFrm").submit();
    }
    function goToExit(){
        document.getElementById("srvId").value = "6";
        document.getElementById("mainPageFrm").submit();
    }

    const showToastFlag = localStorage.getItem('showToast');
    if (showToastFlag === 'true') {
        const toastLive = document.getElementById('liveToast');
        const toastBootstrap = new bootstrap.Toast(toastLive);
        toastBootstrap.show();

        // Remove the flag after showing the toast
        localStorage.removeItem('showToast');
    }
    localStorage.setItem('showToast', 'true');


</script>

<script>
    (function() {

        const idleDurationSecs = 60;    // X number of seconds
        const redirectUrl = '../MainPage/SignIn.jsp';  // Redirect idle users to this URL
        let idleTimeout; // variable to hold the timeout, do not modify

        const resetIdleTimeout = function() {

            // Clears the existing timeout
            if(idleTimeout) clearTimeout(idleTimeout);

            // Set a new idle timeout to load the redirectUrl after idleDurationSecs
            idleTimeout = setTimeout(() => location.href = redirectUrl, idleDurationSecs * 1000);
        };

        // Init on page load
        resetIdleTimeout();

        // Reset the idle timeout on any of the events listed below
        ['click', 'touchstart', 'mousemove'].forEach(evt =>
            document.addEventListener(evt, resetIdleTimeout, false)
        );

    })();
</script>