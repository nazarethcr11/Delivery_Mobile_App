import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //get the instance of the firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //get current user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  //sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //register with email and password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //sign out
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}