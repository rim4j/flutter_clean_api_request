import 'package:flutter_clean_api_request/features/posts_feature/data/data_source/remote/api_provider.dart';
import 'package:flutter_clean_api_request/features/posts_feature/data/repository/posts_repository_impl.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/repository/posts_repository.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/use_cases/posts_usecase.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  //repositories
  locator.registerSingleton<PostsRepository>(PostsRepositoryImpl(locator()));

  //usecase
  locator.registerSingleton<PostsUseCase>(PostsUseCase(locator()));

  //state management

  locator.registerSingleton<PostsBloc>(PostsBloc(locator()));
}
