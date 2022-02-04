// Helper classes and functions for firebase related operations
// @dart =2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // path is a full path, e.g,
  // '$collectionId/$documentId'
  CollectionReference collection(String path) => _firestore.collection(path);
  DocumentReference document(String path) => _firestore.doc(path);
}

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get auth => _firebaseAuth;
}
