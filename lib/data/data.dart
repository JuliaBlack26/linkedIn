import 'package:linkedin1/model/user_model.dart';
import 'package:linkedin1/model/user_post_model.dart';

class Data {
  static final List<UserPostModel> postList = [
    UserPostModel(
        name: "User 1",
        ProfileUrl: "assets/profile1.jpg",
        headline: "HR Executive ",
        tags:
            "#positivity #motivation #learning #progress #development #networking #business #jobhunters #jobseekers #connections #networking #linkedin #nevergiveup #staypositive #staystrong #positiveattitude",
        description:
            "Stay Strong!\n\nKeep Your Head Up!\n\nRejection means a better opportunity awaits you elsewhere.\n\nYour thoughts?",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "assets/post1.jpg",
        likes: "800"),
    UserPostModel(
        name: "User 2",
        ProfileUrl: "assets/profile2.jpg",
        headline: "MEAN Stack Developer | Freelancer",
        tags:"#meanstack",
        description:
            "MEAN is a source-available JavaScript software stack for building dynamic web sites and web applications. A variation known as MERN replaces Angular with React.js front-end, and another named MEVN use Vue.js as front-end.",
        isVideoPost: false,
        comments: "1k",
        video: "",
        isOnline: true,
        image: "assets/post2.jpeg",
        likes: "20k", ),
    UserPostModel(
        name: "User 3",
        ProfileUrl: "assets/profile3.jpg",
        headline: "Logo Designer | Freelancer |",
        tags: "#datascience #machinelearning #programming #python #joke",
        description: "Google, Stack Overflow are your saviors :)",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: true,
        image: "assets/post3.png",
        likes: "230", ),
    UserPostModel(
        name: "User 4",
        ProfileUrl: "assets/profile6.jpg",
        headline: "Flutter Open Projects | Flutter Drat world",
        tags:
            "#FlutterOpenProject, #FlutterMagicWorld, #Mobile&WebOpenApps, #Flutter+Dart❤️",
        description:
            "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia.",
        isVideoPost: false,
        comments: "20k",
        video: "",
        isOnline: true,
        image: "assets/post4.png",
        likes: "101k"),
  ];
  static final userProfile = UserModel(
      headline:
          "Android & IOS Mobile Application flutter developer | Freelancer",
      ProfileUrl: "assets/profile.jpg",
      name: "Dear Programmer",
      connections: "1,837",
      viewProfile: "300");
}