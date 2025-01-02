import 'package:task_todo/Features/Domain/Entities/home_entities.dart';

class HomeModel extends HomeEntities {
  const HomeModel({
    required super.id ,
    required super.title ,
    required super.image ,
    required super.desc ,
    required super.priority ,
    required super.status ,
    required super.user ,
    required super.createdAt ,
    required super.updatedAt
  });

  factory HomeModel.fromJson(Map<String , dynamic> json) {
    return HomeModel(
      id: json['_id'] ,
      title: json['title'] ,
      image: json['image'] ,
      desc: json['desc'] ,
      priority: json['priority'] ,
      status: json['status'] ,
      user: json['user'] ,
      createdAt: json['createdAt'] ,
      updatedAt: json['updatedAt']
    );
  }

}