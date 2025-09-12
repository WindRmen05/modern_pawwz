import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/add_post/provider/add_post_provider.dart';
import 'package:modern_pawwz/presentation/components/CustomTextField.dart';
import 'package:modern_pawwz/presentation/components/custom_date_picker.dart';
import 'package:modern_pawwz/presentation/components/custom_drop_down_widget.dart';
import 'package:modern_pawwz/presentation/components/custom_image_slider.dart';
import 'package:provider/provider.dart';
import 'package:sizable/sizable.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPostNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("Post Details",
              style: Theme.of(context).textTheme.titleLarge)),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageGallery(
              images: [
                "https://i.pinimg.com/1200x/4c/93/83/4c9383a9ae48d90f7b7d944a4de6db6b.jpg",
                "https://i.pinimg.com/1200x/4c/93/83/4c9383a9ae48d90f7b7d944a4de6db6b.jpg",
                "https://i.pinimg.com/1200x/4c/93/83/4c9383a9ae48d90f7b7d944a4de6db6b.jpg",
                "https://i.pinimg.com/1200x/4c/93/83/4c9383a9ae48d90f7b7d944a4de6db6b.jpg",
              ],
              mainImageHeight: 320.h,
              thumbnailSize: 70.h,
            ),
            // Post Type Selector
            CustomDropDownWithRefresh(
              value: provider.postType,
              hint: "Select Post Type",
              isEmpty: false,
              list: ["Social", "Pet Adoption", "Sell Product"],
              menuList: ["Social", "Pet Adoption", "Sell Product"]
                  .map(
                    (e) => DropdownMenuItem(value: e, child: Text(e)),
                  )
                  .toList(),
              onChangedFunction: (val) {
                provider.setPostType(val ?? "Social");
              },
              refreshFunction: () {},
            ),
            // SizedBox(height: 20.sp),

            // Dynamic Form
            Expanded(child: _buildForm(provider, context)),

            // Submit Button
            SizedBox(
              height: 50.sp,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(
                      "Post Created → ${provider.postType} → ${provider.postDetails}");
                  Navigator.pop(context);
                },
                child: Text("Submit",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white)),
              ),
            ),
            20.sp.sizeh,
          ],
        ),
      ),
    );
  }

  Widget _buildForm(AddPostNotifier provider, BuildContext context) {
    switch (provider.postType) {
      case "Social":
        return _FunForm(provider: provider);
      case "Pet Adoption":
        return _SellPetForm(provider: provider);
      case "Sell Product":
        return _SellProductForm(provider: provider);
      default:
        return const SizedBox();
    }
  }
}

/// -------------------------
/// FUN POST FORM
/// -------------------------
class _FunForm extends StatelessWidget {
  final AddPostNotifier provider;
  const _FunForm({required this.provider});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        minLines: 4,
        maxLines: 5,
        label: "Comment",
        onChanged: (val) => provider.setDetail("Comment", val));
    // TextField(
    //   decoration: const InputDecoration(labelText: "Comment"),
    //   onChanged: (val) => provider.setDetail("comment", val),
    // );
  }
}

/// -------------------------
/// SELL PET FORM
/// -------------------------
class _SellPetForm extends StatelessWidget {
  final AddPostNotifier provider;
  const _SellPetForm({required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildField("Breed"),
        _buildField("Age"),
        _buildField("Sex"),
        _buildField("Weight (optional)"),
        _buildField(
          "Description",
          minLines: 4,
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildField(String label, {int? minLines, int? maxLines}) {
    return CustomTextField(
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        label: label,
        onChanged: (val) => provider.setDetail(label, val));
  }
}

/// -------------------------
/// SELL PRODUCT FORM
/// -------------------------
class _SellProductForm extends StatelessWidget {
  final AddPostNotifier provider;
  const _SellProductForm({required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildField("Product Name"),
        _buildField(
          "Description",
          minLines: 4,
          maxLines: 5,
        ),
        CustomDatePicker(
          title: "Expiry Date",
          onDateSelected: (p0) {
            provider.setDetail("Expiry Date", p0);
          },
        ),
        _buildField("Delivery Method"),
        _buildField("Amount"),
      ],
    );
  }

  Widget _buildField(String label, {int? minLines, int? maxLines}) {
    return CustomTextField(
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        label: label,
        onChanged: (val) => provider.setDetail(label, val));
  }
}
