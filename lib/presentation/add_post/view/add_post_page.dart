import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/add_post/provider/provider.dart';
import 'package:modern_pawwz/presentation/add_post/widgets/add_post_body.dart';

class AddPostPage extends StatelessWidget {
  static const String routeName = "AddPostPage";
  const AddPostPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddPostPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostNotifier(),
      child: const Scaffold(
        body: AddPostView(),
      ),
    );
  }
}

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddPostBody();
  }
}
