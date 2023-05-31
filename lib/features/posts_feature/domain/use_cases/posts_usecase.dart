import 'package:flutter_clean_api_request/core/resources/data_state.dart';
import 'package:flutter_clean_api_request/core/usecase/use_case.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/repository/posts_repository.dart';

class PostsUseCase extends UseCase<DataState<List<PostEntity>>, NoParams> {
  final PostsRepository postsRepository;

  PostsUseCase(this.postsRepository);

  @override
  Future<DataState<List<PostEntity>>> call(NoParams param) {
    return postsRepository.fetchPosts(param);
  }
}
