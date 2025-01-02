import 'package:equatable/equatable.dart';

class HomeEntities extends Equatable {
  final String id, title, desc, priority, status, user, createdAt,updatedAt;
  final String? image;

  const HomeEntities({
    required this.id,
    required this.title,
    required this.image,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    image,
    desc,
    priority,
    status,
    user,
    createdAt,
    updatedAt
  ];

}