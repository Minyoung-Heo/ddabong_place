![전체로고](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/969d33e3-478c-440b-9483-4963b95073fe)

# ☕ 카페 예약 / 웨이팅 플랫폼 따봉플레이스(DDABONG_PLACE)
따봉플레이스는 JAVA 와 Sping MVC 를 기반으로 제작한 프로젝트입니다.


이용자는 손님 측 / 업체 측으로 나뉘며, Q&A를 관리하는 관리자 계정(admin)을 갖습니다.


## 🗓️ 프로젝트 제작 기간
기간 : 2023/10/02 ~ 2023/11/03 (약 1개월)



## 👨‍👩‍👧‍👦 프로젝트 팀 소개

|   Name   | 허민영                               | 박정빈                                            | 안형진                             | 표가은                                                       |
| :------: | ------------------------------------ | ------------------------------------------------- | ---------------------------------- | ------------------------------------------------------------ |
| Profile  | ![민영](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/860b73a8-aa20-4489-b5f5-c37a03aa7b67)           | ![정빈](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/00a35cc4-3426-4274-bab0-b01ab3e16188) | ![형진](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/32a11d48-a8a6-445c-8308-1197ab508c49)|![가은](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/7963876b-c39f-4332-88d9-274717058040)  | 
| Position | 팀장 & Front/Backend Develop  | Backend Develop                                  | Front/Backend Develop                   | Front/Backend Develop                              |
|   Git    | [@Minyoung-Heo](https://github.com/Minyoung-Heo) | [@JbPark1199](https://github.com/JbPark1199)            | [@BrotherZin](https://github.com/BrotherZin) | [@gaeunpyo](https://github.com/gaeunpyo)                 |

### 역할 
**허민영**

DB설계 및 ERD 제작 / 메인화면 / 이달의 따봉왕 / 따봉어워드 / 예약HOT랭킹 / Q&A / 웨이팅 / 카페 리스트 / 업체 측 회원 정보 관리 / 리뷰 삭제 /
전반적인 CSS 및 코드 관리 담당


**박정빈**

유저용 주 기능 전반 (통합 검색 / 맞춤형 카페 추천 / 매장 상세 페이지 / 예약 / 즐겨찾기 / 리뷰) 및 CSS 담당  


**안형진**

UI/UX 설계 / 회원 관련 기능 전반 (로그인 / 회원 가입 / 아이디,비밀번호 찾기 / 손님 측 회원정보관리 / 예약 현황), 메인화면 팝업창, 메인화면 배너 제작, 이벤트 기능 및 CSS 담당


**표가은**

UI/UX 설계 / 업체 측 매장 CRUD / 즐겨찾기 목록 / 카페 추천 결과 / 따봉 어워드 및 CSS / PPT 담당


# 📝 프로젝트 구성 및 설계

### 📌  유스케이스 다이어그램 (Use Case Diagram)

![1101최신화 drawio](https://github.com/Minyoung-Heo/ddabong_place/assets/104006894/b95f0d02-8f88-48a7-87fa-afa5cffc1e8a)

### 📌  Database ERD (Entity Relation Diagram)

![ERD](https://github.com/Minyoung-Heo/ddabong_place/assets/104006894/d1edd029-dad6-4a90-8149-80493df91f02)



### 📌 사용 기술

**백앤드**

- Java 11
- Spring MVC
- JSP
- MyBatis
- AJAX

**DB & WAS**

- Oracle(Oracle Database 11g Express Edition Release 11.2.0.2.0)
- Tomcat 9(9.0.64)

**프론트**

- HTML/CSS
- JavaScript
- JQuery

**Environment & Tool**

- Windows 11
- Eclipse(2022-12)
- GitHub
- Fork
- Oracle SQL Developer

  
# 📌 기능 소개
**메인화면**

![메인화면](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/11c809e4-4457-4b8d-bacd-aa6563f70b9a)


**이달의 따봉왕**


**따봉 어워드**


**예약 HOT 랭킹**


**예약**

- 카페 예약

![카페예약](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/a2a67b4f-c1f9-47c1-a312-46ffbf886f0d)


- 예약 취소


![카페예약취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/2bcaf458-7c4d-48f3-af69-26c0202b7da8)

- 업체 측 예약 확인

![업체예약현황](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/484f741c-21aa-4a63-af5c-adb0ad32512e)


- 업체 측 예약 취소하기

 ![업체측예약취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/1ed404bc-39ed-4f67-b6bc-6c433f2330ea)
  
**웨이팅**

- 웨이팅

![웨이팅](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/3aa80f73-e19d-414a-8ab5-cedc0f116680)

- 웨이팅 취소

![웨이팅취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/7bf133a3-5f67-4ff0-9a94-936db1934a14)

- 업체 측 웨이팅 호출

![웨이팅호출](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/edf5fdd4-5739-48a5-86e7-6e8b0f5b3433)


- 손님 측 웨이팅 입장하기

![손님입장하기](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/76db8bb9-80d7-4795-b158-bc1be4df4f00)


**리뷰**

- 로그인 전

![로그인전리뷰](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/3af75653-71c4-4442-9140-774a1dc8a52b)

- 로그인 후 리뷰 달기


![리뷰달기](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/e5a32e49-f09c-47d0-a7a8-68e5381455fb)


- 리뷰 삭제

![리뷰삭제](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/0719281b-2cdd-4390-802d-cac6c58182d6)


## 📌 [다른 기능 더 보기](https://plant-decision-6e3.notion.site/DDABONG_PLACE-873f879a889944158439a8ec38fb319d?pvs=4)
