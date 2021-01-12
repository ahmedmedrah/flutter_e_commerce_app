import 'package:e_commerce_app/core/services/firestore_user.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount googleUser;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUserToFireStore(user);
      Get.offAll(HomeView());
    });
  }

  void facebookSignInMethod() async {
    FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(['email']);
    final accessToken = facebookLoginResult.accessToken.token;
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(credential).then((user) async {
        saveUserToFireStore(user);
        Get.offAll(HomeView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUserToFireStore(user);
      });

      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUserToFireStore(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      userId: userCredential.user.uid,
      email: userCredential.user.email,
      name: name ?? userCredential.user.displayName,
      imgUrl: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
  }
}
