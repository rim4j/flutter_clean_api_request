import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_api_request/core/widgets/main_wrapper.dart';
import 'package:flutter_clean_api_request/features/posts_feature/presentation/bloc/posts_bloc.dart';
import 'package:flutter_clean_api_request/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => locator<PostsBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainWrapper(),
    );
  }
}
