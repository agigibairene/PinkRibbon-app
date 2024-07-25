import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up user
 Future<String> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        // Register user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Add user to Firestore database
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
        });

        res = "success";
      } else {
        res = "Please fill all fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        res = "Network error. Please try again.";
      } else {
        res = e.message ?? "An error occurred";
      }
      print("FirebaseAuthException: ${e.code} - ${e.message}");
    } catch (err) {
      res = err.toString();
      print("Error: $res");
    }
    return res;
  }

  // Log in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        res = "Incorrect password";
      } else {
        res = e.message ?? "An error occurred";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Get user data
  Future<Map<String, dynamic>> getUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();
      return userDoc.data() as Map<String, dynamic>;
    }
    return {};
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}