import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/widgets/app_card.dart';

import '../../domain/entities/post_entity.dart';
import '../bloc/posts_status.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state.postsStatus is PostsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (state.postsStatus is PostsCompleted) {
          final PostsCompleted postsCompleted =
              state.postsStatus as PostsCompleted;

          final List<PostEntity> postsList = postsCompleted.postsEntity;

          return ListView.builder(
            itemCount: postsList.length,
            itemBuilder: (context, index) {
              final post = postsList[index];
              return AppCard(
                title: post.title!,
                subTitle: post.body!,
              );
            },
          );
        }
        if (state.postsStatus is PostsFailed) {
          return const Center(
            child: Text("error"),
          );
        }
        return Container();
      },
    );
  }
}
