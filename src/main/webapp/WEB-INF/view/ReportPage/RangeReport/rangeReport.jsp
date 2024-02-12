<%@ page import="com.example.newcalendar.Service.LessonSRV" %>
<%@ page import="com.example.newcalendar.Model.Event" %>
<%@ page import="com.example.newcalendar.Service.EventSRV" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.newcalendar.Model.Student" %>
<%@ page import="com.example.newcalendar.Service.StudentSRV" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html dir="rtl" lang="fa-IR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
          integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous" />
    <link rel="stylesheet" href="static/css/lib/persian-datepicker.min.css" />
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
    .range-texts{
        margin-top: 60px;
    }
    .range-text{
        font-size: 40px;
        font-weight: 900;
    }
    .date{
        margin-top: 5px;
        font-size: 24px;
        color: #818181;
    }
    label{
        font-weight: 700;
        font-size: 20px;
    }
    .fa-magnifying-glass{
        font-size: 17px;
    }



    .title{
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        width: 250px;
    }

    .fa-trash-can{
        color: red;
        font-size: 20px;
    }

    .event-con{
        margin-top: 30px;
    }

    .event{
        font-size: 18px;
        font-weight: 600;
        border-radius: 7px;
        background-color: white;
        padding: 5px;
    }

    .fa-clock{
        vertical-align: middle;
        padding-right: 7px;
    }

    .time-con,.date-con{
        margin: 0px 5px;
        direction: ltr;
        color: #6D6D6D;
        background-color: #f5f5f5;
        padding: 3px 10px;
        border-radius:6px;
        font-weight: 500;
    }
    .time,.date-event{
        padding-top: 3px;
        font-size: 16px;
    }
    .fa-chevron-down{
        color:#6D6D6D ;
        background-color: #f5f5f5;
        padding: 9px;
        border-radius: 6px;
    }
    .toggle{
        rotate: 180deg;
    }

    .event-des{
        color: #6D6D6D !important;
        font-weight: 400;
        font-size: 16px;
    }

    /* events */



    @media only screen and (max-width: 770px) {
        .logo {
            width: 45px;
        }
        .navbar-brand {
            font-size: 15px !important;
        }
        .nav-item{
            font-size: 15px;
        }
        .range-texts{
            margin-top: 40px;
        }
        .range-text{
            font-size: 30px;
        }
        .date{
            font-size: 18px;
        }
        .fa-trash-can{
            font-size: 18px;
        }
        .title{
            width: 150px;
        }

        .event{
            font-size: 16px;
        }
        .time,.date-event{
            padding-top: 3px;
            font-size: 13px;
        }
        .fa-chevron-down{
            font-size: 15px;
        }
        .event-des{
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
        .range-texts{
            margin-top: 30px;
        }
        .range-text{
            font-size: 25px;
        }
        .date{
            font-size: 15px;
        }
        .nav-item{
            font-size: 15px;
        }
        label{
            font-size: 18px;
        }
        .fa-trash-can{
            font-size: 15px;
        }

        .event{
            font-size: 14px;
        }
        .time ,.date-event{
            font-size: 12px;
        }
        .fa-chevron-down{
            font-size: 10px;
        }

        .event-des{
            font-size: 12px;
        }
    }
    @media only screen and (max-width: 575px) {
        .search-btn{
            width: 100%;

        }
        .time-con,.date-con{
            width: 100%;
        }
        .title{
            width: 300px;
        }
    }
</style>
<%
//    LessonSRV lsrv = new LessonSRV();
//    lsrv.testKon();
        Student student = new Student();
        Long idPerson = (Long) session.getAttribute("idPerson");
        List<Event> events = new ArrayList<>();
        student = new StudentSRV().readById(Math.toIntExact(idPerson));
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rangeFrm") != null){
            String startDateTime = request.getParameter("eventDateForm1");
            String startDateTime2 = request.getParameter("eventDateForm2");
            if (startDateTime != null && startDateTime2 !=null){
                String[] parts = startDateTime.split(" ");
                String startdTime = parts[0];
                String[] parts2 = startDateTime2.split(" ");
                String startdTime2 = parts2[0];
                events = new EventSRV().readEventByIdForRange(Math.toIntExact(idPerson) , startdTime ,startdTime2);
            }
        }
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rangeFrm") != null && request.getParameter("srvId").equals("1")) {
            session.setAttribute("idPerson", idPerson);
            response.sendRedirect("../../MainPage/mainPage.jsp");
        }
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rangeFrm") != null && request.getParameter("srvId").equals("2")) {
            session.setAttribute("idPerson", idPerson);
            response.sendRedirect("../../Event/AddEvent.jsp");
        }

        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rangeFrm") != null && request.getParameter("srvId").equals("3")) {
            new EventSRV().delete(Long.parseLong(request.getParameter("deId")));
            response.sendRedirect("../../ReportPage/RangeReport/rangeReport.jsp");

        }
        if (request.getMethod().equalsIgnoreCase("post") && request.getParameter("rangeFrm") != null && request.getParameter("srvId").equals("6")) {
            response.sendRedirect("../../MainPage/SignIn.jsp");
        }
    %>
<body>
<header>
    <nav class="navbar navbar-expand-lg header">
        <div class="container p-0">
            <a class="navbar-brand" href="#">
                <img src="../../assets/logo.png" class="logo" alt="" />تقویم
                دانشجویی</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse tags" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-2 mt-lg-0">
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" aria-current="page" href="javascript:void(0);" onclick="gotoMainPage(<%=student.getId()%>)">گزارش رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link" href="javascript:void(0);" onclick="gotoEvent(<%=student.getId()%>)">ثبت رویدادها</a>
                    </li>
                    <li class="nav-item ms-lg-2 link">
                        <a class="nav-link active" href="#">گزارش بازه زمانی</a>
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
    <div class="Main-text">
        <div class="range-texts d-flex">
            <h1 class="range-text">بازه زمانی مد نظرت رو انتخاب کن</h1>
        </div>
        <div class="top-con d-flex justify-content-between">
            <div class="date">
                <p id="todayDate"></p>
            </div>
        </div>
    </div>
    <div class=" range-forms mt-1 mt-sm-4">
        <form class="row flex-column flex-sm-row justify-content-center align-items-center" name="rangeFrm" method="post" action="rangeReport.jsp" id="rangeFrm">
            <input type="hidden" name="rangeFrm">
            <input type="hidden" name="srvId" id="srvId">
            <input type="hidden" name="deId" id="deId">


            <div class="col-11 col-sm-5 col-lg-3">
                <div class="d-flex flex-column flex-sm-row">
                    <label for="eventDateForm1" class="form-label m-2">از</label>
                    <input style="direction: ltr" type="text" class="form-control range-from-example"
                           id="eventDateForm1" name="eventDateForm1" placeholder="yyyy/mm/dd" />
                </div>
            </div>
            <div class="col-11 col-sm-5 col-lg-3">
                <div class="d-flex flex-column flex-sm-row">
                    <label for="eventDateForm2" class="form-label m-2">تا</label>
                    <input style="direction: ltr" type="text" class="form-control range-to-example"
                           id="eventDateForm2" name="eventDateForm2" placeholder="yyyy/mm/dd" />
                </div>
            </div>
            <div class="col-11 col-sm-2 col-lg-1 ">
                <button type="button" class=" search-btn btn btn-primary p-2  mt-4 mt-sm-0"  onclick="doSearch()"><i
                        class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </form>
    </div>


    <div class="event-con mt-5">
        <%for (int i = 0 ; i<= events.size() - 1 ; i++){%>
        <div class="event mb-2">
            <div class="title-clock-con d-sm-flex justify-content-between">
                <div class="event-header d-flex align-items-center">
                    <button class="btn m-0 d-flex" onclick="deleteEvent(<%=events.get(i).getId()%>)">
                        <i class="fa-regular fa-trash-can"></i>
                    </button>
                    <p class="title m-0"><%=events.get(i).getName()%></p>
                </div>
                <div class="event-header d-flex justify-content-end align-items-center">
                    <div class="time-con d-flex align-items-center">
                        <div>
                            <i class="fa-regular fa-clock m-0"></i>
                        </div>
                        <p class="time m-0"><%=events.get(i).getStartTime()%> - <%=events.get(i).getEndTime()%></p>
                    </div>
                    <div class="date-con d-flex align-items-center">
                        <div>
                            <i class="fa-regular fa-calendar ms-1"></i>
                        </div>
                        <p class="date-event m-0"><%=events.get(i).getStartDateTime()%></p>
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



<script src="static/js/lib/jquery-3.2.1.min.js"></script>
<script src="static/js/lib/persian-date.min.js"></script>
<script src="static/js/lib/persian-datepicker.min.js"></script>
<script src="static/js/app.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var to, from;
        to = $(".range-to-example").persianDatepicker({
            inline: false,
            altField: '.range-to-example-alt',
            altFormat: 'LLLL',
            initialValue: false,
            format: "L dddd",
            autoClose: true,
            timePicker: {
                enabled: false,
            },
            responsive: true,
            onSelect: function (unix) {
                to.touched = true;
                if (from && from.options && from.options.maxDate != unix) {
                    var cachedValue = from.getState().selected.unixDate;
                    from.options = { maxDate: unix };
                    if (from.touched) {
                        from.setDate(cachedValue);
                    }
                }
            }
        });
        from = $(".range-from-example").persianDatepicker({
            inline: false,
            altField: '.range-from-example-alt',
            altFormat: 'LLLL',
            initialValue: false,
            format: "L dddd",
            autoClose: true,
            timePicker: {
                enabled: false,
            },
            responsive: true,
            onSelect: function (unix) {
                from.touched = true;
                if (to && to.options && to.options.minDate != unix) {
                    var cachedValue = to.getState().selected.unixDate;
                    to.options = { minDate: unix };
                    if (to.touched) {
                        to.setDate(cachedValue);
                    }
                }
            }
        });

    });
</script>
<script src="https://kit.fontawesome.com/bd1f2aaf1e.js" crossorigin="anonymous"></script>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
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
    function doSearch(){
        document.getElementById("rangeFrm").submit();
    }
</script>
<script>
    function gotoMainPage(){
        document.getElementById("srvId").value = "1";
        document.getElementById("rangeFrm").submit();
    }

    function gotoEvent(){
        document.getElementById("srvId").value = "2";
        document.getElementById("rangeFrm").submit();
    }

    function deleteEvent(id) {
        document.getElementById("srvId").value = "3";
        document.getElementById("deId").value = id;
        document.getElementById("rangeFrm").submit();
    }
    function goToExit(){
        document.getElementById("srvId").value = "6";
        document.getElementById("rangeFrm").submit();
    }
</script>