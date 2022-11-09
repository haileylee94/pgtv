<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Movie Project</title>

<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</head>
<body style="background-color: #1b1b1b;">
   <div class="wrap">
      <div class="intro_bg">
         <div class="img_gradiant">
            <div class="header">
               <h1 class="logo">
                  <a href="/">G.TV</a>
               </h1>
               <ul class="nav">
                  <li><a href="/">HOME</a></li>
                   <li><a href="/screening">RESERVE</a></li>
                  <li><a href="./sub-main/view_movie.jsp">CATEGORY</a></li>
                  <li><a href="movie">MOVIE</a></li>
                  <sec:authorize access="isAnonymous()">
      					<li><a href="/customlogin" id="sign_in">SIGN IN</a></li>
   				  </sec:authorize>
    			  <sec:authorize access="hasRole('MEMBER')">
    					<li><a href="#">MyPage</a></li>
       					<li><a href="#" onclick="document.getElementById('logout').submit();">LogOut</a></li>
   				  </sec:authorize>
   				  <sec:authorize access="hasRole('ADMIN')">
       					<li><a href="/admin/main">AdminPage</a></li>
       					<li><a href="#" onclick="document.getElementById('logout').submit();">LogOut</a></li>
   				  </sec:authorize>
               </ul>
               <div class="search_area">
                  <form>
                     <input type="search" placeholder="Ready to watch?"> <span>검색</span>
                  </form>
               </div>
               <form id="logout" method="post" action="/logout">
      		   <input type="hidden" name="${_csrf.parameterName}" class="logout" value="${_csrf.token}" />
   			   </form>
               <!-- search_area -->
            </div>
            <!-- header -->
            <ul class="intro_text">
               <li>
                  <h2 class="wu">우영우</h2>
               </li>
               <li>
                  <h4 class="wu">똑바로 읽어도 거꾸로 읽어도 우영우입니다.</h4>
               </li>
               <li><a href="#" class="btn_view">WATCH</a></li>
            </ul>
            <!-- intro_text-->
            <span class="arrow-prev"></span> <span class="arrow-next"></span>
         </div>
         <!-- img_gradiant -->
      </div>
      <!-- intro_bg -->
   </div>
   <!-- wrap -->
   <!-- intro end -->
   <div class="top5_section">
      <div class="top5_title">
         <span class="title_area">TOP 5</span> <a href="#" class="seemore">더
            보기</a>
      </div>
      <!-- top5_title -->
      <div class="top5_programes">
         <div class="card-box">
            <div class="img-gradient"></div>
            <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
            <div class="text-wrap">
               <h1>용의 출현</h1>
               <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
            </div>
            <div class="play-btn"></div>
         </div>
         <!-- 한산 -->

         <div class="card-box">
            <div class="img-gradient"></div>
            <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
            <div class="text-wrap">
               <h1>용의 출현</h1>
               <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
            </div>
            <div class="play-btn"></div>
         </div>
         <!-- moneyheist -->

         <div class="card-box">
            <div class="img-gradient"></div>
            <img src="./resources/images/main_movie/woyoungwo.jpeg" alt="우영우">
            <div class="text-wrap">
               <h1>용의 출현</h1>
               <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
            </div>
            <div class="play-btn"></div>
         </div>
         <!-- 우영우 -->

         <div class="card-box">
            <div class="img-gradient"></div>
            <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
            <div class="text-wrap">
               <h1>용의 출현</h1>
               <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
            </div>
            <div class="play-btn"></div>
         </div>
         <!-- 한산 -->

         <div class="card-box">
            <div class="img-gradient"></div>
            <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
            <div class="text-wrap">
               <h1>용의 출현</h1>
               <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
            </div>
            <div class="play-btn"></div>
         </div>
         <!-- moneyheist -->

      </div>
      <!-- top5_programes -->
   </div>
   <!--top5_section -->

   <div class="new_section">
      <div class="new_title">
         <span class="new_area">New Releases</span> <a href="#"
            class="seemore">더 보기</a>
      </div>
      <!-- new_title -->

      <!-- Slider main container -->
      <div class="swiper">
         <!-- Additional required wrapper -->
         <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
               <a href="#">
                  <div class="new_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

            <div class="swiper-slide">
               <a href="#">
                  <div class="new_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

            <div class="swiper-slide">
               <a href="#">
                  <div class="new_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

         </div>
         <!-- If we need pagination -->
         <div class="swiper-pagination"></div>

         <!-- If we need navigation buttons -->
         <div class="swiper-button-prev"></div>
         <div class="swiper-button-next"></div>

      </div>

      <script src="../JS/customer.js"></script>
   </div>
   <!--new_section -->
   
   <div class="only_section">
      <div class="only_title">
         <span class="new_area">G.TV Only</span> <a href="#" class="seemore">더
            보기</a>
      </div>
      <!-- only_title -->

      <!-- Slider main container -->
      <div class="swiper">
         <!-- Additional required wrapper -->
         <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
               <a href="#">
                  <div class="only_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/woyoungwo.jpeg" alt="우영우">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

            <div class="swiper-slide">
               <a href="#">
                  <div class="only_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/woyoungwo.jpeg" alt="우영우">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

            <div class="swiper-slide">
               <a href="#">
                  <div class="only_programes">
                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/woyoungwo.jpeg" alt="우영우">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/money.jpeg" alt="money_heist">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/hansan.jpg" alt="한산">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>

                     <div class="card-box">
                        <div class="img-gradient"></div>
                        <img src="./resources/images/main_movie/woyoungwo.jpeg" alt="우영우">
                        <div class="text-wrap">
                           <h1>용의 출현</h1>
                           <p>왜군에 한양을 빼앗기며 절체절명의 위기에 놓인다.</p>
                        </div>
                        <div class="play-btn"></div>
                     </div>
                  </div>
               </a>
            </div>

         </div>
         <!-- If we need pagination -->
         <div class="swiper-pagination"></div>

         <!-- If we need navigation buttons -->
         <div class="swiper-button-prev"></div>
         <div class="swiper-button-next"></div>

      </div>

      <script src="../JS/customer.js"></script>
   </div>
   <!--only_section -->
   <div class="footer">
      <p class="footer-top">
         질문이 있으신가요? 문의 전화: &nbsp; <a class="footer-top-a"
            href="tel:080-123-4567">080-123-4567</a>
      </p>

      <div class="last-footer">
         <div class="copy-text">
            대표: 톰핸슨 <br> Email: gtvcutomer_service.gtv.com <br> 주소:
            서울특별시 강남구 강남대로84길 16 11, 12층 <br> 사업자 등록번호: 123-4567-8910 <br>
            클라우드 호스팅: Amazon Web Services Inc <br> 공정거래위원회 사이트
         </div>

         <div class="lan-menu">
            <div class="selected-lan">한국어</div>
            <ul>
               <li><a href="#">English</a></li>
               <li><a href="#">Korean</a></li>
               <li><a href="#">Chinese</a></li>
               <li><a href="#">French</a></li>
            </ul>
         </div>
         <!-- lan-menu -->
      </div>
      <!-- last-footer -->

      <ul class="footer-links-list">
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">고객센터</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">이용 약관</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">문의하기</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">개인정보</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">입사 정보</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">회사 정보</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">자주 묻는 질문</span>
         </a></li>
         <li class="footer-link-item"><a class="footer-link" href="#">
               <span class="footer-label">오시는 길</span>
         </a></li>
      </ul>
   </div>
   <!-- footer -->
</body>
</html>