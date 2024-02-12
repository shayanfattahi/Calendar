<%@ page import="java.util.List" %>
<%@ page import="com.example.newcalendar.Model.Event" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.newcalendar.Service.EventSRV" %>
<%@ page import="com.example.newcalendar.Model.Lesson" %>
<%@ page import="com.example.newcalendar.Service.LessonSRV" %>
<%@ page import="com.example.newcalendar.Model.Student" %>
<%@ page import="com.example.newcalendar.Service.StudentSRV" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html dir="rtl" lang="fa-IR">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="RangeReport/static/css/lib/persian-datepicker.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
          integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous"/>
    <title>Document</title>
</head>
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

    /*main*/
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



    .fa-trash-can {
        color: red;
        font-size: 20px;
    }

    /* table */

    .table-header {
        background-color: transparent !important;
        font-weight: 800;
        font-size: 20px;
        border: 2px solid rgb(102, 102, 102) !important;
        border-radius: 10px;
        margin-bottom: 20px;
    }

    .title-name {
        text-align: center;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        width: 110px;
    }

    .table-d {
        font-weight: 500;
        font-size: 16px;
        border-radius: 10px;
        border: none;
        box-shadow: 0px 0px 7px 0px rgb(209, 209, 209) !important;
        transition: all 0.1s;
        margin-top: 10px;
        padding: 10px;
    }

    .table-d:hover {
        scale: 105%;
        box-shadow: 0px 0px 10px 5px rgb(209, 209, 209) !important;
    }


    .table-time {
        white-space: nowrap;
        font-weight: 500;
        border-radius: 6px;
        background-color: #ececec;
        color: #6d6d6d;
        padding: 2px 20px;
    }

    @media only screen and (max-width: 990px) {
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

        .title-name {
            text-align: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            width: 150px;
        }

        .table-header {
            font-size: 16px;
        }

        .table-d {
            font-weight: 600;
            font-size: 14px;
            transition: none;
        }

        .table-d:hover {
            scale: 100%;
            box-shadow: none;
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

        .title-name {
            text-align: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            width: 110px;
        }

        .table-time {
            font-size: 12px;
        }
    }
</style>
<body>
<%
    Long idPerson = (Long) session.getAttribute("idPerson");
    Student student = new Student();
    student = new StudentSRV().readById(Math.toIntExact(idPerson));
    List<Event> events = new ArrayList<>();
    events = new EventSRV().readEventWeekly(Math.toIntExact(idPerson));
    List<List<Lesson>> lss = new ArrayList<>();
    lss = new LessonSRV().readLesson(Math.toIntExact(idPerson));

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("1")) {
        session.setAttribute("idPerson", idPerson);
        response.sendRedirect("../Event/AddEvent.jsp");
    }
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("2")) {
        session.setAttribute("idPerson", idPerson);
        response.sendRedirect("../ReportPage/RangeReport/rangeReport.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("3")) {
        session.setAttribute("idPerson", idPerson);
        response.sendRedirect("../MainPage/mainPage.jsp");
    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("4")) {
        new LessonSRV().delete(Long.parseLong(request.getParameter("deId")));
        response.sendRedirect("../ReportPage/reportWeekly.jsp");

    }

    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("5")) {
        new EventSRV().delete(Long.parseLong(request.getParameter("deId")));
        response.sendRedirect("../ReportPage/reportWeekly.jsp");

    }
    if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("weeklyFrm") != null && request.getParameter("srvId").equals("6")) {
        response.sendRedirect("../MainPage/SignIn.jsp");
    }

%>
<header>
    <nav class="navbar navbar-expand-lg header">
        <div class="container p-0">
            <a class="navbar-brand" href="#">
                <img src="../assets/logo.png" class="logo" alt=""/>تقویم
                دانشجویی</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse tags" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-2 mt-lg-0">
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link active" aria-current="page" href="javascript:void(0);" onclick="goToMain(<%=student.getId()%>)">گزارش رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" href="javascript:void(0);" onclick="submitForm(<%=student.getId()%>)">ثبت رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" href="javascript:void(0);" onclick="goToReportRangePage(<%=student.getId()%>)">گزارش بازه زمانی</a>
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
<form name="weeklyFrm" id="weeklyFrm" action="reportWeekly.jsp" method="post">
    <input type="hidden" name="srvId" id="srvId">
    <input type="hidden" name="weeklyFrm">
    <input type="hidden" name="deId" id="deId">


    <div class="container">
    <div class="Main-text mb-3">
        <div class="welcome-texts d-flex">
            <h1 class="welcome-text">سلام <%=student.getUserName()%> عزیز!</h1>
            <img class="waving-hand" src="../assets/waving-hand_1f44b.png" alt="waving hand">
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
                        <li><a class="dropdown-item " href="javascript:void(0);" onclick="goToMain(<%=student.getId()%>)">روزانه</a></li>
                        <li><a class="dropdown-item active" href="#">هفتگی</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 flex-lg-nowrap overflow-x-auto overflow-y-hidden">
        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">شنبه</div>
            <%for (int i = 0; i <= lss.get(0).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(0).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(0).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(0).get(i).getStartDateTime()%>
                        -<%=lss.get(0).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("شنبه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">یکشنبه</div>
            <%for (int i = 0; i <= lss.get(1).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(1).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(1).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(1).get(i).getStartDateTime()%>
                        -<%=lss.get(1).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("یکشنبه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">دوشنبه</div>
            <%for (int i = 0; i <= lss.get(2).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(2).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(2).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(2).get(i).getStartDateTime()%>
                        -<%=lss.get(2).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("دوشنبه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">سه‌شنبه</div>
            <%for (int i = 0; i <= lss.get(3).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(3).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(3).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(3).get(i).getStartDateTime()%>
                        -<%=lss.get(3).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("سه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">چهارشنبه</div>
            <%for (int i = 0; i <= lss.get(4).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(4).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(4).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(4).get(i).getStartDateTime()%>
                        -<%=lss.get(4).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("چهار")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex">
                    <i class="fa-regular fa-trash-can" onclick="deleteEvent(<%=events.get(j).getId()%>)"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">پنج‌شنبه</div>
            <%for (int i = 0; i <= lss.get(5).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(5).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(5).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(5).get(i).getStartDateTime()%>
                        -<%=lss.get(5).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("پنج\u200Cشنبه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>

        <div class="col-12 col-lg">
            <div class="table-header d-flex justify-content-center p-2">جمعه</div>
            <%for (int i = 0; i <= lss.get(6).size() - 1; i++) {%>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteLesson(<%=lss.get(6).get(i).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=lss.get(6).get(i).getName()%></span>
                    <div class="table-time mt-lg-3"><%=lss.get(6).get(i).getStartDateTime()%>
                        -<%=lss.get(6).get(i).getEndDateTime()%>
                    </div>
                </div>
            </div>
            <%
                }
                for (int j = 0; j <= events.size() - 1; j++) {
                    if (events.get(j).getDay().equals("جمعه")) {
            %>
            <div class="table-d">
                <button class="btn p-0 m-0 d-flex" onclick="deleteEvent(<%=events.get(j).getId()%>)">
                    <i class="fa-regular fa-trash-can"></i>
                </button>
                <div class="d-flex flex-row  flex-lg-column justify-content-between align-items-center">
                    <span class="title-name"><%=events.get(j).getName()%></span>
                    <div class="table-time mt-lg-3"><%=events.get(j).getStartTime()%>-<%=events.get(j).getEndTime()%>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
</form>
<script src="https://kit.fontawesome.com/bd1f2aaf1e.js" crossorigin="anonymous"></script>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="RangeReport/static/js/lib/jquery-3.2.1.min.js"></script>
<script src="RangeReport/static/js/lib/persian-date.min.js"></script>
<script src="RangeReport/static/js/lib/persian-datepicker.min.js"></script>
<script src="RangeReport/static/js/app.js"></script>
</body>

</html>

<script>

    function submitForm() {
        document.getElementById("srvId").value = "1";
        document.getElementById("weeklyFrm").submit();
    }

    function goToReportRangePage(){
        document.getElementById("srvId").value = "2";
        document.getElementById("weeklyFrm").submit();
    }

    function goToMain(){
        document.getElementById("srvId").value = "3";
        document.getElementById("weeklyFrm").submit();
    }

    function deleteLesson(id) {
        document.getElementById("srvId").value = "4";
        document.getElementById("deId").value = id;
        document.getElementById("weeklyFrm").submit();
    }

    function deleteEvent(id) {
        document.getElementById("srvId").value = "5";
        document.getElementById("deId").value = id;
        document.getElementById("weeklyFrm").submit();
    }

    function goToExit(){
        document.getElementById("srvId").value = "6";
        document.getElementById("weeklyFrm").submit();
    }

    const downBtn = document.getElementById('downBtn')

    function rotateBtn() {
        downBtn.classList.toggle("toggle");
    }
    const now = new persianDate().format("dddd D MMMM YYYY")
    console.log(now)
    let todayDate = document.getElementById("todayDate")
    todayDate.innerHTML ="امروز، " + now
</script>