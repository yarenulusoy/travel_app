import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signIn({required String email, required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut().whenComplete(() {
        print("cikis yapıldı");
      });
      // await _auth.signOut().then((value) {
      //   Get.toNamed(Routes.AUTHENTICATION);
      // });
    } catch (e) {
      print(e.toString());
    }
  }
}





