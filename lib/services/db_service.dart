import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
// Create a document reference for the current user
  setUserDetails(String username, String profileUrl) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({
      'username': username,
      'profileUrl': profileUrl,
      'email': FirebaseAuth.instance.currentUser?.email
    }, SetOptions(merge: true));
  }

  Future<Map> getUserDetails() async {
    Map userDetails = {};
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) => value.data()?.forEach((key, value) {
              userDetails[key] = (value);
            }));

    return userDetails;
  }

//   getAllUserData() async {
//     final data = [];
//     // Get a reference to the collection
//     final CollectionReference collectionRef =
//         FirebaseFirestore.instance.collection('users');

// // Get all the documents in the collection
//     QuerySnapshot querySnapshot = await collectionRef.get();

// // Iterate over the documents and print the data
//     querySnapshot.docs.forEach((doc) {
//       data.add(doc.data());
//     });
//     return data;
//   }

  isNewUser() async {
    bool newUser = true;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        newUser = false;
      }
    });

    return newUser;
  }
}
