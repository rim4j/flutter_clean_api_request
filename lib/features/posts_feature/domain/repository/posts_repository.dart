import 'package:flutter_clean_api_request/core/usecase/use_case.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/entities/post_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class PostsRepository {
  Future<DataState<List<PostEntity>>> fetchPosts(NoParams param);
}
