
# Solved.Earth <br/> (Mobile App to provide strong motivation for environmental protection)

<br/>

> Solved.Earth is designed based on the idea that applying the quest-reward method to environmental protection activities would provide strong motivation for environmental protection. <br/>
> Solved.Earth는 퀘스트-보상 방식을 환경 보호 활동에 접목하면 더 강력한 환경 보호 활동에 대한 동기를 부여할 수 있을 것이라는 아이디어를 바탕으로 하는 모바일 앱 개발 프로젝트입니다.

<br/>
<br/>

## 🔑 GUIDES

<h4>License : <a href="LICENSE">MIT</a> / <a href="./lib/oss_licenses.dart">Third Party</a> </h4>
<h4>Contribute : <a href="CONTRIBUTE.md">How to Contribute</a>

<br/>
<br/>
<br/>
<br/>

## ✔ NOTICE

This is still ongoing project. Please contact us(ecotreegrowing@gmail.com) to discuss how we can work together.</b><br/>

이 프로젝트는 아직 완전히 배포되지 않은 상태입니다. 이 프로젝트에 참여하시고자 한다면 저희 팀 이메일을 통해 연락주시길 바랍니다.(ecotreegrowing@gmail.com)

<br/>
<br/>

## 📷 Demonstration Video (시연 영상)

You can watch the video by clicking the image below.
하단 이미지를 클릭하시면 영상을 시청하실 수 있습니다.

[<img src="썸네일 이미지 URL" alt="Solved.Earth"/>](영상 URL)

<br/>
<br/>

## 📌 Introducing Solved.Earth (프로젝트 소개)

### 1. Background & Purpose of this project (개발배경 및 목적)

&nbsp;&nbsp; Environmental protection can be practiced in various ways in life, but most importantly, proper results can be achieved only when each person's practice is gathered. With the main purpose of encouraging many people to practice environmental protection in their lives, our team discussed which method would be most useful.

&nbsp;&nbsp; At this point, our team was inspired by solved.ac. solved.ac is a community project that measures the difficulty of problems on the algorithm training site and calculates a user's tier based on the problems solved. Our team thought that applying this quest-reward approach to environmental activities would provide a strong incentive to protect the environment.

&nbsp;&nbsp; Designed based on this idea, the project ultimately aims to enable people to carry out environmental challenges in their lives, anytime, anywhere, while carrying out various environmental challenges given, such as using public transportation or donating used clothes.

<br/>
<br/>

&nbsp;&nbsp; 환경 보호는 생활 속에서 다양한 방식으로 실천 가능하나 가장 중요한 것은 한 사람 한 사람의 실천이 모여야만 제대로 된 성과가 나타난다는 점입니다. 생활 속 환경 보호를 많은 사람이 실천하도록 유도하는 것을 주된 목적으로 두고 저희 팀은 어떤 방법이 가장 유용할 지에 대해 토론했습니다.

&nbsp;&nbsp; 이 때 영감을 받은 것이 solved.ac입니다. solved.ac는 알고리즘 트레이닝 사이트에 수록된 문제들의 난이도를 측정하는 커뮤니티 프로젝트이며 해결한 문제들을 바탕으로 사용자의 티어를 계산하는 시스템입니다. 이러한 퀘스트-보상 방식을 환경 보호 활동에 적용한다면 환경 보호에 대한 강력한 동기를 제공할 수 있겠다고 생각했습니다.
  
&nbsp;&nbsp; 이 아이디어를 토대로 고안한 본 프로젝트는 대중교통을 이용하거나 헌 옷 기부하기 등 주어진 다양한 환경 관련 챌린지를 수행하면서 국민 생활에 환경 챌린지를 언제 어디서나 수행할 수 있도록 하는 것을 궁극적인 목표로 합니다.

<br/>
<br/>

## ⚙️ System Configuration and Architecture (시스템 구성 및 아키텍처)

### 1. Solved.Earth System Structure (Solved.Earth 시스템 구조)

&nbsp;&nbsp; Solved.Earth는 유저가 다양한 환경 챌린지를 수행할 수 있는 모바일 플랫폼입니다. Dart 기반의 Flutter 프레임워크를 사용하고, 전체적인 챌린지 인증 프로토콜은 대부분 파이썬으로 작성되었습니다. 자세한 챌린지 인증 프로토콜의 구조는 아래 3번(API 상세 구조)을 참고하시길 바랍니다.
   
&nbsp;&nbsp; Flutter App에서 FastAPI를 통해 사진을 전송하면 detect.py의 Load Test Data 부분에 사진이 입력되며 YOLOv5로 트레이닝 된 모델을 통해 챌린지 인증 통과 여부를 도출합니다. 이렇게 도출된 결과를 바탕으로 FastAPI를 통해 인증 성공 시, 사진이 Firebase Cloud Storage 유저별 디렉토리에 저장이 되고 인증 실패 시, Flutter App UI 상에 snackbar로 어떤 물체가 인식되지 않았는지 나타납니다.

&nbsp;&nbsp; 유저 등록 및 인증은 Firebase Authentication을 통해 개별적인 유저별 UID로 판단하며 유저 데이터는 Cloud Firestore 데이터베이스에 유저의 이름, 이메일, 생일, UID, 인증한 챌린지와 그 사진에 대한 데이터가 저장됩니다.

   <p align="center"><img src=./report/struct1.jpg alt="struct1" width="800"/></p>

<br/>
<br/>
   
### 2. Solved.Earth App Client Application Structure (Solved.Earth 앱 클라이언트 어플리케이션 구조)

&nbsp; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

   <p align="center"><img src=./report/struct2.jpg alt="struct2" width="800"/></p>

<br/>
   
앱 클라이언트 애플리케이션의 n가지 모듈의 기능은 다음과 같다. 

<details>
<summary><b>AAAAAAAAA</b></summary>
<div markdown="1">       
&nbsp;&nbsp; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
</div>
</details>

<details>
<summary><b>BBBBBBBBB</b></summary>
<div markdown="1">       
&nbsp;&nbsp; bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
</div>
</details>

<details>
<summary><b>CCCCCCCCCC</b></summary>
<div markdown="1">       
&nbsp;&nbsp; cccccccccccccccccccccccccccccc
</div>
</details>

<br/>
<br/>
   
### 3. API Detail View (API 상세 구조)

&nbsp; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

   <p align="center"><img src=./report/struct3.jpg alt="struct3" width = "800"/></p>

<br/>

<details>
<summary><b>AAAAAAAAAAAAAAAAA</b></summary>
<div markdown="1">       
&nbsp;&nbsp; aaaaaaaaaaaaaaaaaaaaaaaaaaa
</div>
</details>

<details>
<summary><b>BBBBBBBBBBBBBBBBBBBBBB</b></summary>
<div markdown="1">       
&nbsp;&nbsp; bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

</div>
</details>

<details>
<summary><b>CCCCCCCCCCCCCCCCCCCCCCCC</b></summary>
<div markdown="1">       
&nbsp;&nbsp; cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
</div>
</details>

<details>
<summary><b>DDDDDDDDDDDDDDDDDDDDDDDDDDD</b></summary>
<div markdown="1">       
&nbsp;&nbsp; dddddddddddddddddddddddddddddddddddddddddddddddddddddddd
</div>
</details>

<br/>
<br/>

## 🔧 Applied Technology (적용 기술)

### - Core Technology (핵심 기술)

- Mobile app that can provide an environment for the users to participate in various environmental challenges
- An authentication protocol that uses OpenCV's YOLOv5 model based on FastAPI to object-detect user-uploaded images and store authentication results in Firebase if they meet the authentication criteria
- Firebase Authentication for user authentication and registration, and Cloud Firestore for archiving and managing user data

<br/>
<br/>

- Flutter 기반으로 개발한 다양한 환경 챌린지에 참여할 수 있는 모바일 앱
- FastAPI를 기반으로 OpenCV의 YOLOv5 모델을 사용하여 유저가 업로드 한 이미지를 객체탐지 한 뒤 인증 조건에 부합한 경우, 인증 결과가 Firebase에 저장되는 인증 프로토콜
- 유저 인증 및 등록을 수행할 수 있는 Firebase Authentication과 유저 데이터를 보관 및 관리할 수 있는 Cloud Firestore

<br/>
<br/>

### - Dev. Environment (개발 환경) 

![Windows 11](https://img.shields.io/badge/Windows%2011-0078D4?style=for-the-badge&logo=windows11&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

### - Dev. Tool (개발 도구)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Colab](https://img.shields.io/badge/Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=white)

### - Framework (프레임워크)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![OpenCV](https://img.shields.io/badge/opencv-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white)
![YOLOv5](https://img.shields.io/badge/YOLOv5-00FFFF?style=for-the-badge&logo=YOLOv5&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=FastAPI&logoColor=white)

### - Programming Language (개발 언어)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

<br/>
<br/>

## 🖼 Project Result (프로젝트 결과)

### 1. Project Image (프로젝트 사진)

<b> 
The images below show only part of the project.
<br/>
아래 사진들은 프로젝트의 일부만 보여줍니다.
<b> 
<br/>
<br/>
<b> 

- 메인 화면 & 사이드바 화면 & 나무 변경하기 화면
 <img src=./report/appview/mainpage.png alt="mainpage" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/sidebar.png alt="sidebar" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/tree_slide_show.gif alt="tree_slide_show" height = "500" />
 
<br/><br/>

 - 챌린지 화면
 <img src=./report/appview/challenge_list.png alt="challenge_list" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/challenge_detail.png alt="challenge_detail" height = "500" />
 
<br/><br/>

 - 설정 화면 & 서비스 이용약관 화면 & 개인정보처리 화면 & 오픈소스 라이선스 화면
 <img src=./report/appview/settings_page.png alt="settings_page" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/tos.png alt="tos" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/personal_info.png alt="personal_info" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/oss_license.png alt="oss_license" height = "500" />

<br/><br/>

 - 가입하기 화면
 <img src=./report/appview/signin.png alt="signin" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/signin_1.png alt="signin_1" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/signin_2.png alt="signin_2" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/signin_3.png alt="signin_3" height = "500" />
 &nbsp;&nbsp;&nbsp;
 <img src=./report/appview/signin_4.png alt="signin_4" height = "500" />

 
</b>
<br/>
<br/>

### 2. Application Areas & Expected Effects (활용분야 및 기대효과)

- <b>This open source project will continue to be developed so that it can be used for various environmental events and campaigns, such as ultimately being used to conduct the University Federation Environmental Challenge campaign. </b>


- <b>Through this, we expect to secure access to environmental practices that allow people to carry out environmental challenges at any time in their lives. </b>

<br/>

- <b>본 오픈소스 프로젝트는 궁극적으로 대학교 연합 환경 챌린지 캠페인을 진행하는 데에 사용하는 등 다양한 환경 관련 이벤트 및 캠페인에 활용이 될 수 있도록 지속적으로 개발하고자 합니다. </b>


- <b>이를 통해 국민 생활에 환경 챌린지를 언제든지 수행할 수 있도록 하는 환경 실천에 대한 접근성을 확보할 수 있을 것이라 기대합니다. </b>

<br/>
<br/>

### 3. Etc. (기타)

- <b>설명1 </b>

	부가설명1

- <b>설명2 </b>

	부가설명2

- <b>설명3 </b>

	부가설명3
	
- <b>설명4 </b>

	부가설명4

<br/>
<br/>
