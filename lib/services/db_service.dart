import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
// Create a reference to the Firestore collection
  final _userCollection = FirebaseFirestore.instance.collection('users');

// Get the ID of the current user
  final _userId = FirebaseAuth.instance.currentUser?.uid;

// Create a document reference for the current user
  setUserName(String username) async {
    final userDocRef = _userCollection.doc(_userId);

    try {
      await userDocRef.set({'username': username});
    } catch (error) {
      print("Error adding data: $error");
    }
  }

  setProfileNumber(int profileNumber) async {
    final userDocRef = _userCollection.doc(_userId);

    try {
      await userDocRef.set({'profileNumber': profileNumber});
    } catch (error) {
      print("Error adding data: $error");
    }
  }

  isNewUser() async {
    // Read data from the document
    await _userCollection
        .doc(_userId) // Use the user's UID as the document ID
        .get()
        .then((documentSnapshot) {
      if (!documentSnapshot.exists) {
        return false;
      }
      return true;
    });
  }
}
