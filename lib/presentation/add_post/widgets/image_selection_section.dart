import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/add_post/provider/add_post_provider.dart';
import 'package:modern_pawwz/presentation/add_post/widgets/post_details_section.dart';
import 'package:provider/provider.dart';

class ImageSelectionScreen extends StatelessWidget {
  const ImageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPostNotifier>(context);

    // Dummy gallery images (replace with real gallery fetcher)
    final galleryImages = List.generate(12, (i) => "Image $i");

    return Scaffold(
      appBar: AppBar(
          title:
              Center(child: Text("New Post", style: Theme.of(context).textTheme.titleLarge))),
      body: Column(
        children: [
          // Selected Images Preview
          if (provider.selectedImages.isNotEmpty)
            SizedBox(
              height: 100.sp,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.selectedImages.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.all(8.sp),
                  width: 80.sp,
                  color: Colors.grey[300],
                  child: Center(child: Text(provider.selectedImages[index])),
                ),
              ),
            ),

          // Gallery Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 8.sp,
              ),
              itemCount: galleryImages.length,
              itemBuilder: (_, index) {
                final image = galleryImages[index];
                final isSelected = provider.selectedImages.contains(image);
                return GestureDetector(
                  onTap: () => provider.toggleImage(image),
                  child: Container(
                    color: isSelected ? Colors.teal : Colors.grey[300],
                    child: Center(
                      child: Text(
                        image,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Next Button
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: ElevatedButton(
              onPressed: provider.selectedImages.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider.value(
                                value: provider,
                                builder: (context, _) {
                                  return PostDetailsScreen();
                                })),
                      );
                    },
              child: Text("Next",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
