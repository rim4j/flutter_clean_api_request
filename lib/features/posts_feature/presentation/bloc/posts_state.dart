part of 'posts_bloc.dart';

class PostsState {
  PostsStatus postsStatus;

  PostsState({
    required this.postsStatus,
  });

  PostsState copyWith({PostsStatus? newPostsStatus}) {
    return PostsState(
      postsStatus: newPostsStatus ?? postsStatus,
    );
  }
}
