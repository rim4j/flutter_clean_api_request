import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/entities/post_entity.dart';

@immutable
abstract class PostsStatus {}

class PostsLoading extends PostsStatus {}

class PostsCompleted extends PostsStatus {
  final List<PostEntity> postsEntity;

  PostsCompleted(this.postsEntity);
}

class PostsFailed extends PostsStatus {
  final String message;

  PostsFailed(this.message);
}
