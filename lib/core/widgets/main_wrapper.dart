import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/bloc/posts_bloc.dart';

import '../../features/posts_feature/presentation/screens/posts_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(LoadPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('clean request api with bloc'),
        backgroundColor: Colors.black,
      ),
      body: const PostsScreen(),
    );
  }
}
