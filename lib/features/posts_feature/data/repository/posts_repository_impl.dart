import 'package:dio/dio.dart';
import 'package:flutter_clean_api_request/core/usecase/use_case.dart';
import 'package:flutter_clean_api_request/features/posts_feature/data/data_source/remote/api_provider.dart';
import 'package:flutter_clean_api_request/features/posts_feature/data/model/post_model.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/entities/post_entity.dart';

import 'package:flutter_clean_api_request/core/resources/data_state.dart';

import '../../domain/repository/posts_repository.dart';

class PostsRepositoryImpl extends PostsRepository {
  ApiProvider apiProvider;
  PostsRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<PostEntity>>> fetchPosts(NoParams param) async {
    try {
      Response response = await apiProvider.fetchPostsData();

      if (response.statusCode == 200) {
        List<PostEntity> postsData = [];

        response.data
            .forEach((item) => postsData.add(PostModel.fromJson(item)));

        return DataSuccess(postsData);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }
}
