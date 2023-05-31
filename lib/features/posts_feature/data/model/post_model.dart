import 'package:flutter_clean_api_request/features/posts_feature/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(dynamic json) {
    return PostModel(
      userId: json["userId"],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
