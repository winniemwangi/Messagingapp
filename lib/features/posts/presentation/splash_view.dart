import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messaging_app/features/posts/data/data_source.dart/remote_data_source.dart';
import 'package:messaging_app/features/posts/data/repository/post_repository_imp.dart';
import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';
import 'package:messaging_app/features/posts/domain/use_cases/fetch_post_use_cases.dart';
import 'package:messaging_app/features/posts/presentation/views/home_view.dart';
import 'package:messaging_app/features/posts/presentation/widgets/regular_text_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:messaging_app/core/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
   

  @override
  void initState() {
      final postDataSource = RemoteDataSource();
  final postRepository = PostRepositoryImpl(remoteDataSource: postDataSource);
  final fetchActualRepos = FetchActualRepository(repository: postRepository);
    timer = Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: HomeView(fetchActualRepositoryUseCase: fetchActualRepos,), type: PageTransitionType.bottomToTop)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryThemeColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegularTextWidget(
                text: 'Messaging App',
                color: AppColors.whiteThemeColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )
            ]),
      ),
    );
  }
}
