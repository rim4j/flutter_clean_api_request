import 'package:bloc/bloc.dart';
import 'package:flutter_clean_api_request/core/resources/data_state.dart';
import 'package:flutter_clean_api_request/core/usecase/use_case.dart';
import 'package:flutter_clean_api_request/features/posts_feature/domain/use_cases/posts_usecase.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/bloc/posts_status.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsUseCase postsUseCase;

  PostsBloc(this.postsUseCase)
      : super(
          PostsState(postsStatus: PostsLoading()),
        ) {
    on<LoadPostsEvent>(_onLoadPostsEvent);
  }

  void _onLoadPostsEvent(LoadPostsEvent event, Emitter<PostsState> emit) async {
    emit(state.copyWith(newPostsStatus: PostsLoading()));

    DataState dataState = await postsUseCase(NoParams());

    if (dataState is DataSuccess) {
      emit(state.copyWith(newPostsStatus: PostsCompleted(dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newPostsStatus: PostsFailed(dataState.error!)));
    }
  }
}
