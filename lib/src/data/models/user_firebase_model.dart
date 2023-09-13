// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:taptapfirebase/src/domain/entities/user_info.dart';

class UserFirebaseModel {
  final String name;
  final String model;
  final DateTime time;

  UserFirebaseModel({
    required this.name,
    required this.model,
    required this.time,
  });

  factory UserFirebaseModel.fromMap(Map<String, dynamic> map) {
    return UserFirebaseModel(
      name: map['name'] as String,
      model: map['model'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'model': model,
      'time': time.millisecondsSinceEpoch,
    };
  }

  UserInfo toUserInfo() {
    return UserInfo(
      name: name,
      model: model,
    );
  }
}
