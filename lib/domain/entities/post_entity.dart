import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String title;
  final String body;
  int id;
  int userId;

  PostEntity(
      {required this.body,
      required this.title,
      required this.id,
      required this.userId});

  @override
  List<Object?> get props => [this.body, this.userId, this.title, this.id];
}
