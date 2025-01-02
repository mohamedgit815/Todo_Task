import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String id, name, phone, address, level, createdAt, updatedAt;
  final int years;

  const UserEntities({required this.id, required this.name, required this.phone, required this.address, required this.level, required this.years, required this.createdAt, required this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    phone,
    address,
    level,
    years,
    createdAt,
    updatedAt
  ];
}