import 'package:postblocapp/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required body, required title, required id, required userId})
      : super(id: id, body: body, title: title, userId: userId);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        body: json['body'],
        title: json['title'],
        id: json['id'],
        userId: json['userId']);
  }
}
