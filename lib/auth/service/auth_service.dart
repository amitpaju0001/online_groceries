import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_groceries/auth/model/user_model.dart';

class AuthService {
  // Create Account
  Future<void> createAccount(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      print('Account created');
    } catch (e) {
      print('Failed to create account: $e');
      rethrow;
    }
  }

  // Login
  Future<void> login(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      print('Login Successfully');
    } catch (e) {
      print('Failed to login: $e');
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Failed to logout: $e');
      rethrow;
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Password reset email sent');
    } catch (e) {
      print('Failed to send password reset email: $e');
      rethrow;
    }
  }

  // Google Login
  Future<UserCredential> googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        throw Exception('Google sign-in aborted');
      }

      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );

      var finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
      return finalResult;
    } catch (error) {
      print('Failed to sign in with Google: $error');
      rethrow;
    }
  }

  // Verify Phone Number
  Future<void> verifyPhoneNumber(
      String phoneNumber,
      Function(String) codeSent,
      Function(FirebaseAuthException) verificationFailed,
      ) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Optionally handle auto-retrieval
        },
        verificationFailed: verificationFailed,
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('Failed to verify phone number: $e');
      rethrow;
    }
  }

  // Sign In with OTP
  Future<void> signInWithOtp(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in with OTP');
    } catch (e) {
      print('Failed to sign in with OTP: $e');
      rethrow;
    }
  }
}
