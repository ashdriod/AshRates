import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  getQuizData() async {
    return await Firestore.instance.collection("SmartMeter").snapshots();
  }
}