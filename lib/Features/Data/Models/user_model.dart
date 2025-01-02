
import 'package:task_todo/Features/Domain/Entities/user_entities.dart';

class UserModel extends UserEntities {

  const UserModel({
    required super.id ,
    required super.name ,
    required super.phone ,
    required super.address ,
    required super.level ,
    required super.years ,
    required super.createdAt ,
    required super.updatedAt
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['_id'] as String,
    name: json['displayName'] as String,
    phone: json['username'] as String,
    address: json['address'] as String,
    level: json['level'] as String,
    years: json['experienceYears'] as int,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );

}