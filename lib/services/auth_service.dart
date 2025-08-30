import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithPhone(String phoneNumber,
      Function(String, int?) codeSentCallback) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        codeSentCallback(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<UserCredential> verifyOtp(
      String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await _auth.signInWithCredential(credential);
  }
}
