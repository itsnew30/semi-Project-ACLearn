<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACLearn - 배우고, 나누고, 성장하세요</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<style>
    .a { /* 섹션>div 공통 */
      margin: 0 auto; 
      padding: 0 20px; 
      max-width: 1200px;
    }
    
    main {
      margin-top: 100px;
      margin-bottom: 100px;
    }
    /* lctr_details banner, lctr_details contents  공통부분*/
    .container {
      box-sizing: border-box; 
      display: flex; 
      flex-direction: row; 
      flex-wrap: wrap; 
      margin: 0 -8px;
    }
    .lctr_details_banner {
      align-items: center
    }

    /* lctr_details banner */
    .img_wrapper {
      box-sizing: border-box; 
      flex: 0 0 auto; 
      padding-left: 8px; 
      padding-right: 8px; 
      max-width: 41.6666667%;
    }
    .banner_img {
      box-sizing: inherit; 
      padding: 30px 28px; 
      width: 100%; 
      max-width: 720px
    }
    .main_explain {
      /* box-sizing: border-box; 
      flex: 0 0 auto; 
      padding: 10px 0px; 
      max-width: 58.3333333%; */
      line-height: 2.5rem;
    }
    
    #lctrLike, #likeTd {
    font-size: 1.2rem;
    background: none;
    border: none;
    }
    
    #lctrUser {
    font-size: 1rem;
    background: lightgray;
    border: 0.5px solid black;
    border-radius: 5px;
    height: 2rem;
    }
    
    /* color: white; */
    border-radius: 5px;
    height: 2rem;

    /* lctr_details menu */
    .menu__el_wrapper {
      display: flex; 
      align-items: flex-end; 
      height: 45px; 
      overflow-x: auto; 
      padding: 0 35px; 
      margin: 0 auto; 
      box-sizing: border-box;
    }
    .menu__el {
      display: inline-block; 
      margin-right: 30px; 
      line-height: 1.3; 
      padding: 15px 0 6px;
    }
    .menu__el:hover {
      border-bottom: 1px solid black; 
   }

    a {
      box-sizing: inherit; 
      text-decoration: none;
    }
    
    /* lctr_details contents */
    .content_wrapper {
      box-sizing: inherit; 
      padding: 0 16px 0 34px; 
      width: 100%; 
      max-width: 720px
    }
    .aa {
      margin-top: 30px;
      padding : 10px;
      border: 1px solid lightgray;
      border-radius: 10px;
    }
    .content {
      width: 800px;
      padding-left: 8px; 
      padding-right: 8px;
      box-sizing: border-box; 
    }
    .left {
      flex-basis: 80%; 
      max-width: 80%; 
      flex: 0 0 auto; 
    }
    .right {
      flex-basis: 20%; 
      max-width: 20%; 
      flex: 0 0 auto; 
    }
    .floating {
      box-sizing: inherit; 
      width: 100%; 
      max-width: 320px; 
      position: sticky; 
      top:75px; 
      margin: 28px 34px 20px auto;
    }
    .floating_container {
      box-sizing: inherit;
    }
    .floating__card {
      box-sizing: inherit; 
      border: 1px solid lightgray
    }
    .content_video {
       margin: 30px 0px;
    }
    .content_image {
       margin: 30px 0px;
       width: 670px;
    }
    
    a#topBtn {
      position: fixed;
      right: 42rem;
      bottom: 15rem;
      display: none;
   }
   .menu__el_a {
     text-decoration: none;	
     color: gray;
   }
   
   .menu__el_a:hover {
     color: black;
   }
   
   .entire-wrap {
   	display:flex;
   	flex-direction: column;
   }
   .content_detail.autosize { min-height: 300px; }
  </style>
<body>
	<div class="entire-wrap" style="justify-content: normal;">
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<main class="lctr_details">
<div id="containerDiv">
    <section class="lctr_details banner" style="background-color: lightblue;">
    <input type="hidden" name="lctrCode" id="lctrCode" value="${lctr.lctrCode}">
    <input type="hidden" name="getLctrLike" id="getLctrLike" value="${getLctrLike }">  
    <input type="hidden" name="getLctrUser" id="getLctrUser" value="${getLctrUser }">  
      <div class="lctr_details a">
        <div class="lctr_details_banner container">
          <div class="lctr_details_banner img_wrapper">
            <img class="banner_img" src="/resources/images/${lctr.lctrOriImg1}" >
          </div>
          <div class="main_explain">
            <div>
              <span>조회수 ${lctr.lctrCnt }</span>
            </div>
            <div>
              <h2>${lctr.lctrTitle }</h2>
            </div>
            <div>
            <c:if test="${avgScore ne null}">
              <span>평점 : ${avgScore }</span>
            </c:if> 
              <span>수강평수&nbsp;<span id="ReviewTd">${reviewCnt }</span></span>
              <span>수강자수&nbsp;<span id="UserTd">${lctrUserCnt }</span></span>
            </div>
            <div>
              <c:if test="${loginUser ne null }">
 	             <span><button type="button" id="lctrUser" value="lctrUser">수강</button></span>
              </c:if>
              <span><button type="button" id="lctrLike" value="lctrLike">좋아요</button><span id="likeTd">${lctrLikeCnt }</span></span>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="lctr_details menu">
      <div class="lctr_details a" style="border-bottom: 1px solid lightgray;">
        <div class="menu__el_wrapper">
          <span class="menu__el lctr"><a href="/lctr/getLctr.do?lctrCode=${lctr.lctrCode}#sodyd" class="menu__el_a">강의소개</a></span>
          <span class="menu__el review"><a href="/lctr/getLctr.do?lctrCode=${lctr.lctrCode}#tnrkdvud" class="menu__el_a">수강평</a>&ensp;<span class="menu__el_a">${reviewCnt }</span></span>
        </div>
      </div>
    </section>
    <section class="lctr_details_menu contents">
      <div class="lctr_details a">
        <div class="lctr_details container">
          <div class="content left">
            <div class="content_wrapper">
              <section class="content_image" id="sodyd">
                 <img src="/resources/images/${lctr.lctrOriImg2}" width="670px">
              </section>
              <section class="content_body aa" id="sodyd" >
              	<textarea class="content_detail" style="line-height: 150%; resize: none; width:100%; height:280px; font-size: 18px; border: none;" readonly="readonly">${lctr.lctrDetails }</textarea>
              </section>
              <c:choose>
                 <c:when test="${loginUser eq null}">
                    <section class="content_body aa" id="sodyd">동영상 강의는 로그인 후 수강신청 하셔야 보실 수 있습니다.</section>
                 </c:when>
                 <c:when test="${loginUser ne null && getLctrUser eq 0}">
                    <section class="content_body aa" id="sodyd">동영상 강의는 수강신청 하셔야 보실 수 있습니다.</section>
                 </c:when>
                 <c:otherwise>
                    <section class="content_video" id="sodyd">
                       <iframe width="670" height="378" src="https://www.youtube.com/embed/${lctr.lctrVideoLink}" title="YouTube video player" 
                       frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                       allowfullscreen></iframe>
                   </section>
                 </c:otherwise>
              </c:choose>
              <section class="content_review aa" id="tnrkdvud">
            <div class="review_header" style="display: flex; align-items: baseline;">
               <span style=" padding: 10px; margin-right: 8px; margin-left: 8px; ling-height: 1.4; box-sizing: inherit;">수강평</span>
               <span style="font-size: 13px;">${reviewCnt }개</span>
            </div>
            <div class="review_write" style="box-sizing: inherit; margin: 20px 18px; display: flex; width:100%;">
               <c:choose>
                  <c:when test="${loginUser eq null}">
                     <div style="display: none;"></div>
                  </c:when>
                  <c:otherwise>
                     <form method="post" action="/lctr/addReview.do" style="width: 100%; margin-right: 37px;">
                         <input type="hidden" name="lctrCode" id="lctrCode" value="${lctr.lctrCode}">
                         <input type="hidden" name="userNickname" id="userNickname" value="${loginUser.userNickname}">
                        <input type="hidden" name="userId" id="userId" value="${loginUser.userId }">
                        <span>[&nbsp;${loginUser.userNickname}&nbsp;] </span>
                        <select name="reScore" id="reScore" >
                           <option value="5">5점</option>
                           <option value="4">4점</option>
                           <option value="3">3점</option>
                           <option value="2">2점</option>
                           <option value="1">1점</option>
                        </select>
                        <textarea name="reContents" id="reContents" style="margin-top: 5px; width:100%;  resize: none; " rows="5"></textarea>
                        <div style="float: right;"> <button type="submit">리뷰 등록</button></div>
                     </form>
                  </c:otherwise>
               </c:choose>
            </div>
            <div class="review_content" style="box-sizing: inherit; margin-top: 10px;">
            <c:forEach items="${review}" var="review">
               <div class="review-list__filter review-filter" style="display: flex; overflow-x: auto; align-item; padding: 0 16px 10px; bordor-bottom: 1px solid lightgray; white-space: nowrap; box-sizing: inherit;">
                  <div class="review-list__el-cover" style="border: 1px solid lightgray; border-radius:10px; padding: 32px 0; width: 100%; box-sizing: inherit; display: block;">
                     <div class="review-list__el review-el" style="margin-left: 20px; margin-right: 20px; box-sizing: inherit; display: block">
                        <div class="review-el__header" style="margin-bottom: 12px; display: flex; align-items: center; box-sizing: inherit;">
                           <div class="review-el__header--left" style="display: flex; align-items: flex-start">
                              <div class="review-el__thumbnail" style="margin-right: 8px; flex-shrink:0; overflow: hidden; width: 42px; height: 42px; border-radius: 100%; border: 1px solid lightgray;">
                                 <img src="/resources/images/user.png" alt="회원사진" style="width:100%; height: 100%; object-fit: cover; max-width: 100%; display:block;">
                              </div>
                              <div class="review-el__user-info" style="display: flex; flex-direction: column; box-sizing: inherit;">
                                 <div class="review-el__star-cover" style="display: inline-flex; align-items: center; margin-bottom: 4px;">
                                       <span style="line-height: 1.3; letter-space: -.3px; font-size: 15px; font-wight: 700;">${review.reScore}점</span>
                                 </div>
                                 <div class="review-el__name" style="line-height: 1.3; letter-space: -.3px; font-size: 13px; font-wegit: 700; box-sizing: inherit; display: block">${review.userNickname}</div>
                              </div>
                           </div>
                        </div>
                        <div class="review-el__body" style="margin-bottom: 12px; line-height:1.6; letter-spacing: -.3px; font-size: 15px; white-space: pre-line;">${review.reContents}</div>
                        <div class="review-el__tools" style="display: flex; align-items: center; box-sizing: inherit;">
                           <div class="review-el__tools--left" style="box-sizing: inherit; display: block;">
                              <span class="review-el__tool" style="line-height: 1.3; display: inline-flex; align-items: center; font-size: 13px;">${review.reRegdate}</span>
                           </div>
                           <c:choose>
                              <c:when test="${review.userId == loginUser.userId }">
                              <div class="review-el__tools--right" style="margin-left: auto; box-sizing: inherit; display: block;">
                                 <!-- <a href="#">수정</a> -->
                                 <a href="/lctr/deleteReview.do?lctrCode=${lctr.lctrCode}&reCode=${review.reCode}&userId=${review.userId}" style="line-decoration: none; font-size: 13px;">삭제 x</a>
                              </div>
                              </c:when>
                           </c:choose>
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
            </div>
            <!-- <div class="review_more">
               <button>수강평 더보기</button>
            </div> -->
         </section>
            </div>
          </div>
          <a id="topBtn" href="#">
           <img src="https://widit2.knu.ac.kr/~kiyang/teaching/IT/stPrj/happydpqhs/jam/%ED%83%91%EB%B2%84%ED%8A%BC.png"
           style="width:3rem; height:3rem">
         </a>
        </div>
      </div>
    </section>
 </div>
 </main>
 <jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
 </div>
<script>
   $(function() {
      // 세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
      const loginUserId = "${loginUser.userId}";
      
      // 좋아요 클릭 여부에 따른 버튼 모양 
      if(${getLctrLike} == 0) {
         $("#lctrLike").text("🤍")
      } else if(${getLctrLike } == 1) {
         $("#lctrLike").text("❤️")
      }
      // 수강신청 클릭 여부에 따른 버튼 모양 
      if(${getLctrUser} == 0) {
         $("#lctrUser").text("수강신청")
      } else if(${getLctrUser} == 1) {
         $("#lctrUser").text("수강취소")
      }
      
      // 좋아요 클릭 시 동작
      $("#lctrLike").on("click", function() {
      
      var sendDateLike = {
            'lctrCode' : $("#lctrCode").val(), 
            'getLctrLike' : $("#getLctrLike").val() }
         
         $.ajax({
            url : '/lctr/lctrLike.do',
            type: 'post',
            data: sendDateLike,
            success: function(obj) {
               console.log(obj);
               if(obj.getLctrLike==0){
                  $("#lctrLike").text("🤍")
               }
               else if(obj.getLctrLike==1){
                  $("#lctrLike").text("❤️")
               } 
               
               $("#lctrCode").val(obj.lctrCode);
               $("#getLctrLike").val(obj.getLctrLike);
               
               $("#likeTd").text(obj.lctrLikeCnt);
            },
            error : function(e) {
               console.log(e);
            }
         })
      })
      // 수강신청 클릭 시 동작
      $("#lctrUser").on("click", function() {
         
      var sendDateUser = {
            'lctrCode' : $("#lctrCode").val(), 
            'getLctrUser' : $("#getLctrUser").val() }
         
         $.ajax({
            url : '/lctr/lctrUser.do',
            type: 'post',
            data: sendDateUser,
            success: function(obj) {
               console.log(obj);
               if(obj.getLctrUser==0){
                  $("#lctrUser").text("수강신청")
               }
               else if(obj.getLctrUser==1){
                  $("#lctrUser").text("수강취소")
               } 
               
               $("#lctrCode").val(obj.lctrCode);
               $("#getLctrUser").val(obj.getLctrUser);
               
               $("#UserTd").text(obj.lctrUserCnt);
            },
            error : function(e) {
               console.log(e);
            }
         })
      })
   })
   
   $(function() {
   $(window).scroll(function() {
      if ($(this).scrollTop() > 500) {
            $('#topBtn').fadeIn();
            } else {
            $('#topBtn').fadeOut();
      }
   });
   $("#topBtn").click(function() {   
   $('html, body').animate({
     scrollTop : 0
    }, 400);
    return false;
    });
  });
</script>
</body>
</html>