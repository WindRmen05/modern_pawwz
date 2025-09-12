import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/add_post/provider/provider.dart';
import 'package:modern_pawwz/presentation/add_post/widgets/image_selection_section.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPostNotifier>(
      builder: (context, state, child) {
        return ImageSelectionScreen();
      },
    );
  }
}
