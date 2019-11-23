# Runbike
> 실시간 커뮤니티 기능(함께 라이딩)과, 여러 재미요소(기록, 스탬프 등)를 통해 자전거를 더욱 재미있게 즐길 수 있도록 도와주는 서비스
>
> [Runbike 사이트 바로가기 LINK (https://runbike.cf/runbike)](https://runbike.cf/runbike)  
>
> * 테스트용 아이디 : `mail94@gmail.com`, `mail95@gmail.com`, `mail96@gmail.com` ( 직접 가입하셔도 됩니다. )
> * 테스트용 비밀번호 : `ekdo321!`



## 참여자  

**김다애 ( @[magiccircle03](https://github.com/magiccircle03) )**  
김한솔 ( @[HANSOLKIM30](https://github.com/HANSOLKIM30) )   
김희수 ( @[soo74](https://github.com/soo74) )  
주예리나 ( @[orongee22](https://github.com/orongee22) )



## 프로젝트 설명 PPT 및 발표영상

* [PPT LINK](https://docs.google.com/presentation/d/1-ev-xINKcZvE2PZuUH929ff95VMC-zH2X3Hujy5CaF4/edit?usp=sharing)
* [발표 영상 LINK (https://youtu.be/l89zUgKG4cw)](https://youtu.be/l89zUgKG4cw)
  * 발표 영상 댓글에 타임스탬프가 적용된 목차가 있습니다.
  * 발표 영상에서 프로젝트 구현에 대한 더 많은 정보를 확인할 수 있습니다.
  
  
## 프로젝트 설명 PPT 및 발표영상의 목차
 1. 프로젝트 개요
 2. 프로젝트 시연 영상
 3. 사용 기술
 4. Architecture 구성도
 5. 프로세스 흐름도



## 테이블 구조


![테이블 구조](https://user-images.githubusercontent.com/51072198/69480578-effea300-0e4b-11ea-94f4-1692a526c6d5.PNG)


## 기능
* 회원 관리
* 혼자 라이딩
* **함께 라이딩 (방 CRUD, 참여, 방장 기능, 라이딩 시작 및 종료, 채팅)**
* 스탬프, 뱃지
* 관리자 페이지


## 함께라이딩에 사용된 기술

* 사용 언어 및 프레임워크
  * `Java`
  * `Spring Framework`
  * `node.js` 
  * `jsp`, `EL`
  
* 웹 표준 및 프론트
  * `HTML5`, `CSS3`, `Javascript`
  * `jQuery`
  * `Bootstrap4`

* DB
  * DBMS - `MySQL`
  * `MyBatis`
  
* API
  * `T Map Api` : 출발지-도착지 경로 검색, 현재 위치-목적지 거리 계산

* 배포
  * `AWS`의 `EC2`와 `RDS`
  * `FileZila`를 이용한 `FTP 업로드`
  * `Putty`를 이용한 `SSH 접속`
  * `CloudFlare`를 이용한 `보안접속(SSL)`





