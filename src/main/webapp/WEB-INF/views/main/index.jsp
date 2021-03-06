<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>G-FAIR KOREA</title>

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css" />
    


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>
    <script src="/resources/js/movebanner.js" type="text/javascript"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>

<body>
    <div id="wrap">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="/resources/img/slide1.png" alt=""></div>
          <div class="swiper-slide"><img src="/resources/img/slide2.png" alt=""></div>
          <div class="swiper-slide"><img src="/resources/img/slide3.png" alt=""></div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
      </div>

        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- Initialize Swiper -->
        <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
            delay: 2500,
            disableOnInteraction: false,
            },
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
            navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
            },
        });
        </script>

        <div id="quick_Menu_Wrap">
            <div id="quick_Menu">
                <ul>
                    <li class="quick"><a href="#"><img src="/resources/img/quick_1.png" alt="">????????? ??????</a></li>
                    <li class="quick"><a href="#"><img src="/resources/img/quick_2.png" alt="">?????? ??????</a></li>
                    <li class="quick"><a href="#"><img src="/resources/img/quick_3.png" alt="">???????????? ??????</a></li>
                    <li class="quick"><a href="#"><img src="/resources/img/quick_4.png" alt="">?????????</a></li>
                    <li class="quick"><a href="#"><img src="/resources/img/quick_5.png" alt="">??????????????????</a></li>
                </ul>
            </div>
        </div>

        <div id="notice_Wrap">
            <div id="notice_Board">
                <h2><a href="#">????????????</a></h2>
                <ul>
                    <li><a href="#">G-FAIR KOREA 2021 ???????????? ?????? ??????</a></li>
                    <li><a href="#">GFK-KOTRA : ?????? ?????? ????????? ????????? ?????? (??????~7.30.(???))</a></li>
                    <li><a href="#">GFK-KOTRA : ?????? ?????????????????? B2B ????????? 1688.com ???????????? (??????~7.31.(???))</a></li>
                    <li><a href="#">G-FAIR KOREA ????????? ??????????????? ?????? (7.26.(???) ~ 27.(???))</a></li>
                    <li><a href="#">????????? ????????? ?????? ?????? ?????? ?????? (????????? ??????) (~07/23)</a></li>
                </ul>
            </div>
        </div>

        <div id="member_Join_Wrap">
            <div id="member_Join">
                <h3>????????? ???????????? ??? ?????? ????????? ?????? ????????????????</h3>
                <div><a href="#" class="member_Join_btn">????????????</a></div>
            </div>

        </div>



        <div class="partner">
            <div class="partnerBox">
              <ul>
                  <li class="p1"><a href="#" title="????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner1.png" alt="" /></a></li>
                  <li class="p2"><a href="#" title="??????????????????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner2.png" alt="" /></a></li>
                  <li class="p3"><a href="#" title="???????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner3.png" alt="" /></a></li>
                  <li class="p4"><a href="#" title="??????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner4.jpg" alt="" /></a></li>
                  <li class="p5"><a href="#" title="???????????????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner5.jpg" alt="" /></a></li>
                  <li class="p6"><a href="#" title="?????????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner8.jpg" alt="" /></a></li>
                  <li class="p7"><a href="#" title="??????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner7.jpg" alt="" /></a></li>
                  <li class="p8"><a href="#" title="Green Growth ???????????? ??????" target="_blank"><img src="/resources/img/partner8.jpg" alt="" /></a></li>
                  <li class="p1"><a href="#" title="????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner1.jpg" alt="" /></a></li>
                  <li class="p2"><a href="#" title="??????????????????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner2.png" alt="" /></a></li>
                  <li class="p5"><a href="#" title="???????????????????????? ???????????? ??????" target="_blank"><img src="/resources/img/partner5.jpg" alt="" /></a></li>
              </ul>
            </div>
          </div>       
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>