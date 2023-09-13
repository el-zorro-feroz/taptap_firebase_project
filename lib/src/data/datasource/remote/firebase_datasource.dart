import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:taptapfirebase/src/data/models/user_firebase_model.dart';

class FirebaseDatasource {
  final FirebaseFirestore firebaseFirestore;

  FirebaseDatasource({
    required this.firebaseFirestore,
  });

  Future<Unit> sendData(UserFirebaseModel model) async {
    try {
      final collection = firebaseFirestore.collection('iOS');
      await collection.add(model.toMap());

      return unit;
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
