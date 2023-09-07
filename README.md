
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

[<img src="https://i.ytimg.com/vi/QBzceRQ_o9g/maxresdefault.jpg" alt="Solved.Earth"/>](https://youtu.be/QBzceRQ_o9g)

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

&nbsp; Flutter App의 구조는 크게 Pages, Models, Sending Images로 구분할 수 있습니다.

   <p align="center"><img src=./report/struct2.jpg alt="struct2" width="800"/></p>

<br/>
   
앱 클라이언트 애플리케이션의 3가지 구조에 대한 설명입니다. 

<details>
<summary><b>Pages</b></summary>
<div markdown="1">       
&nbsp;&nbsp; 초기 앱 실행 시 Main.dart에서 앱 실행에 필요한 dotenv, firebase 그리고 provider의 초기 설정을 진행합니다. 이후, 라우터를 활용해 페이지들과 연결된 사이드바에 접근합니다.


&nbsp;&nbsp; 유저에게 표시되는 화면은 main page(메인 화면), tree design page(나무 디자인 화면), achievement page(업적 화면), challenge list page(도전과제 목록 화면), challenge page(도전과제 상세 화면), setting page(설정 화면)로 총 6개로 구성되어 있습니다. 이 화면들을 사이드바에 유기적으로 연결되어 유저가 쉽게 이동 가능합니다.

&nbsp;&nbsp; 각 페이지에서 상세한 부분을 tile로 제작하여 components로 분리하였습니다. 특히 certification tile은 Sending Image 구조와 Models 구조가 얽혀 작동하기에 중요한 부분입니다.
Setting page에서는 유저 등록 및 인증을 위해 Firebase와 연결합니다.

</div>
</details>

<details>
<summary><b>Models</b></summary>
<div markdown="1">       
&nbsp;&nbsp; 앱에서 상시적으로 변하는 변수들의 속성을 관리하기 위한 Class들의 집합체입니다.
	
&nbsp;&nbsp; 주된 Model은 다음과 같습니다.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.  도전과제의 정보를 담는 challenge model.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.  앱에서 활용될 나무 사진에 대한 정보를 담는 tree model.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.  이미지 전송에 필요한 데이터들을 담는 post model.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.  유저의 정보를 담는 user profile model.

&nbsp;&nbsp; 위 모델에 저장된 변수의 상태는 Provider를 활용하여 데이터 제공 및 업데이트를 합니다.

</div>
</details>

<details>
<summary><b>Sending Images</b></summary>
<div markdown="1">       
&nbsp;&nbsp; FastApi를 통해 이미지를 전달하기 위해 각 챌린지의 고유 번호와 유저의 Uid를 쿼리 파라미터로 사용하며 이미지 파일을 multipart/form-data 형식으로 전송합니다. 이미지 전송 시 서버와 연결을 먼저 확인하며, 이후 도전과제의 성공 여부와 실패 사유를 전달받습니다.

&nbsp;&nbsp; 또한 전송한 이미지를 Firebase에 유저별로 저장하며 추후 활용 가능한 형태로 사용 및 변환할 예정입니다.

</div>
</details>

<br/>
<br/>
   
### 3. Data Refining & Model Training Detail View (데이터 전처리 & 모델 트레이닝 상세 구조)

#### 🏋️YOLOv5 Training Structure(YOLOv5 학습 구조)
![struct3](https://github.com/solved-earth/Solved.Earth/blob/main/report/struct3.jpg?raw=true)

First, we get raw data from roboflow.com , and then re-label it according to our needs in label_edit_tool.py. This configured dataset enters train.py and model learning takes place.

먼저 roboflow.com 에서 raw-data 를 가져온 다음 label_edit_tool.py에서 필요에 따라 레이블을 다시 지정합니다. 이렇게 구성된 데이터셋은 train.py로 들어가게되고 이후 모델(best.pt) 학습이 이루어집니다.

#### 💻Object-detection-protocol Structure(물체인식 프로토콜 구조)
![struct1](https://github.com/solved-earth/Solved.Earth/blob/main/report/struct1.jpg?raw=true)

The learned model (best.pt) received from YOLOv5 Training goes to detect.py for object detection. The source data is then received from FastAPI. The detected classes are then stored in a set called class_names and then moved back to FastAPI.

YOLOv5 Training 에서 받아온 학습된 모델(best.pt)은 detect.py로 들어가 물체 탐지가 이루어집니다. 이때 소스 데이터는 FastAPI에서 받아오게 됩니다. 이후 탐지된 클래스는 class_names라는 집합에 저장되어 다시 FastAPI로 넘어갑니다.

#### 📷 Object Detection Examples(물체인식 예제)
![](https://github.com/solved-earth/YOLOv5_train/blob/main/yolov5/runs/detect/exp9/sample8.jpg?raw=true)

![](https://github.com/solved-earth/YOLOv5_train/blob/main/yolov5/runs/detect/exp5/sample4.jpg?raw=true)

![](https://github.com/solved-earth/YOLOv5_train/blob/main/yolov5/runs/detect/exp7/sample6.jpg?raw=true)

![](https://github.com/solved-earth/YOLOv5_train/blob/main/yolov5/runs/detect/exp8/sample7.jpg?raw=true)

#### 🖼 Model Training Result(모델 학습 결과)

##### 1. Confusion Matrix
![confusion_matrix](https://github.com/solved-earth/YOLOv5_train/assets/121764610/bfe4a32d-d4ec-47e0-b79f-73cb5f66103c)

<br/>

##### 2. Curve Image
![image](https://github.com/solved-earth/YOLOv5_train/assets/121764610/8cb2917a-6cce-4fb7-8117-260f4bf106fa)

<br/>

##### 3. Results Plot
![results](https://github.com/solved-earth/YOLOv5_train/assets/121764610/2685a976-e148-494c-a339-557d5de7da5e)

<br/>

##### 4. Data & Label Info.
![labels](https://github.com/solved-earth/YOLOv5_train/assets/121764610/d005945f-a0fd-4e9d-a273-b2c4a8af5351)

<br/>

##### 5. Labels Correlogram
![labels_correlogram](https://github.com/solved-earth/YOLOv5_train/assets/121764610/21f9c7c2-4a9d-4a55-8cb0-1260f15cca44)

<br/>
<br/>
   
### 4. API Detail View (API 상세 구조)

   <p align="center"><img src=./report/struct4.jpg alt="struct4" width = "800"/></p>

<br/>

<details>
<summary><b>POST /upload-image</b></summary>
<div markdown="1">
&nbsp;&nbsp; Flutter-App sends POST request to `/upload-image`
	
<br/>
<br/>

&nbsp;&nbsp; Flutter-App에서 `/upload-image`로 POST request를 보냅니다. 
</div>
</details>

<details>
<summary><b>Save file(image) to server</b></summary>
<div markdown="1">
&nbsp;&nbsp; First, the image file is saved on the server. At this time, the save path and file name are created based on username, challenge_name, and datetime.
	
<br/>
<br/>

&nbsp;&nbsp; 먼저 file의 value로 들어온 이미지 파일을 서버에 저장합니다. 이때 저장 경로 및 파일명은 username과 challenge_name, datetime을 토대로 만들어집니다.
</div>
</details>

<details>
<summary><b>MySQL DB</b></summary>
<div markdown="1">
&nbsp;&nbsp; There are User, Photo table int the DB. Server stores requeset data int DB.
	
<br/>
<br/>

&nbsp;&nbsp; DB에는 user, photo 테이블이 존재합니다. request data를 구조화하여 db에 저장합니다.
</div>
</details>

<details>
<summary><b>detect.py</b></summary>
<div markdown="1">
&nbsp;&nbsp; If the request is correct, detect.py determines whether the challenge was successful. detect.py recognizes an image and returns the objects observed in the image in the form of a set.
	
<br/>
<br/>

&nbsp;&nbsp; request가 올바르다면 detect.py에서 challenge 성공 여부를 판별합니다. detect.py는 이미지를 인식하고 해당 이미지에서 관찰되는 objects를 set 형태로 반환합니다.
</div>
</details>

<details>
<summary><b>return</b></summary>
<div markdown="1">
&nbsp;&nbsp; Based on the object set returned from detect.py, check whether the answer conditions for the challenge are satisfied. If the answer condition is satisfied, `{'success':True}` is returned to flutter-app. If not, `{'success':False}` is returned along with the correct answer condition that is not included in the image.
	
<br/>
<br/>

&nbsp;&nbsp; detect.py에서 반환된 사물 리스트를 토대로 해당 challenge의 정답 조건에 부합하는지 확인합니다. 만약 challenge의 정답 조건에 부합하다면 flutter-app에게 `{'success':True}`를 반환하고, 부합하지 않다면 `{'success':False}`와 함께 이미지에 포함되지 않은 정답 조건을 반환합니다.
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
![Linux Ubuntu](https://img.shields.io/badge/Linux_Ubuntu-FCC624?style=for-the-badge&logo=linux&logoColor=black)

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

- <b>Model Training Result </b>

	https://github.com/solved-earth/YOLOv5_train

- <b>YOLOv5 Google Colab </b>

	https://colab.research.google.com/drive/1L50j02n3ogPLDO8EDrmT3pPWsjqXA5zo#scrollTo=epOCkbBvv71B&uniqifier=2

- <b> Dataset Google Drive </b>

	https://drive.google.com/drive/folders/1DswDcEXzLLforWljYQMoobWRmgd_l80c?usp=sharing

<br/>
<br/>
