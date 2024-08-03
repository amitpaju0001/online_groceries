
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:online_groceries/auth/model/user_model.dart';
import 'package:online_groceries/auth/service/auth_service.dart';
import 'package:online_groceries/core/storage_helper.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  bool isLoggedIn = false;

  Future createAccount(UserModel userModel) async {
    try {
      isError = false;
      notifyListeners();
      isLoading = true;
      notifyListeners();
      AuthService authService = Get.find();
      await authService.createAccount(userModel);
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }else{
        Fluttertoast.showToast(msg: 'Auth Error ${e.code}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future login(UserModel userModel) async {
    try {
      isError = false;
      notifyListeners();
      isLoading = true;
      notifyListeners();
      AuthService authService = Get.find();
      await authService.login(userModel);
      StorageHelper storageHelper = Get.find();
      storageHelper.saveLoginStatus();
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }else{
        Fluttertoast.showToast(msg: 'Auth Error ${e.code}');
      }
    }
  }
  Future logout()async{
    try {
      isError = false;
      isLoading = false;
      notifyListeners();
      AuthService authService = Get.find();
      await authService.logout();
      StorageHelper storageHelper = Get.find();
      storageHelper.removeLoginStatus();
    }catch (e){
      isError = true;
      isLoading = false;
      notifyListeners();
    }
  }
  Future resetPassword(String email) async {
    try {
      isError = false;
      notifyListeners();
      isLoading = true;
      notifyListeners();
      AuthService authService = Get.find();
      await authService.resetPassword(email);
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Password reset link sent.');
    } on FirebaseAuthException catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Auth Error ${e.code}');
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  Future loadLoginStatus()async{
    StorageHelper storageHelper = Get.find();
    isLoggedIn = await storageHelper.getLoginStatus();
    notifyListeners();
  }
}
