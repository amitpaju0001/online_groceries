
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_groceries/auth/model/user_model.dart';

class AuthService{
  Future createAccount(UserModel userModel)async{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email,
      password: userModel.password,
    );
    print('account created');
  }
  Future login(UserModel userModel)async{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password
    );
    print('Login Successfully');
  }
  Future logout()async{
    await FirebaseAuth.instance.signOut();
  }
  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}