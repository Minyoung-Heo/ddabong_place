# ☕ 카페 예약 / 웨이팅 플랫폼 따봉플레이스(DDABONG_PLACE)
따봉플레이스는 JAVA 와 Sping MVC 를 기반으로 제작한 프로젝트입니다.


이용자는 손님 측 / 업체 측으로 나뉘며, Q&A를 관리하는 관리자 계정(admin)을 갖습니다.


### 👨‍👩‍👧‍👦 프로젝트 팀 구성
팀장 : 

허민영 - ERD 작성, 이달의 따봉왕, 따봉어워드, 예약HOT랭킹, 메인화면 기능 및 CSS, Q&A, 웨이팅, 카페 리스트, 전반적인 CSS 및 코드 관리, 업체측 회원 정보 관리, 리뷰 CSS 및 삭제 담당


팀원 : 

박정빈

안형진

표가은

### 🗓️ 프로젝트 제작 기간
기간 : 2023/10/02 ~ 2023/11/03 (약 1개월)

# 📝 프로젝트 구성 및 설계

### 📙  Site Map

![사이트맵 (2).png](GOING%20-%20SPRING%2065d55764fa834e57b754e36919143cd1/sitemap.png)

### 📙  Database ERD

![ERD](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/a729fc07-061a-4697-b11c-ea97c8793a51)

사진을 저장하는 BUSINESS(사업자)와 ROOM(객실) 테이블은 동일하고 중복되지 않는 시퀀스(pic_num)를 공유해 사진의 위치를 저장하도록 했습니다.   

### 📙  사용 기술

**백앤드**

- Java 11
- Spring MVC
- JSP
- MyBatis
- AJAX

**DB & WAS**

- Oracle
- Tomcat 9

**프론트**

- HTML/CSS
- JavaScript
- JQuery

**Environment & Tool**

- Windows 11
- Eclipse
- GitHub
- Oracle SQL Developer

# ⚡️ 프로젝트 키워드

# ⚡️ [프로젝트 주요 기능](https://www.notion.so/GOING-31fb2f99c5c84a098a448b423d1e98b8#a6e8329d5b594dd19cb9417d02a9b8c8)



이에 **객실 번호 - 예약 날짜**를 저장하는 RESERVED 테이블을 만들었고 객실을 예약할 때는 예약 된 날짜 하루하루를 저장할 수 있도록 하여 간단하게 BETWEEN을 이용해 중복 여부를 확인할 수 있도록 했습니다.

<aside>
💡 1월 1일 ~ 1월 3일 예약할 시 테이블에 1일, 2일, 3일 저장

</aside>
