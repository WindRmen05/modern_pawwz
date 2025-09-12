import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class CustomFileSelector extends StatelessWidget {
  final String title;
  final List<String> allowedExtensions;
  final bool multiSelect;
  final List<PlatformFile> selectedFiles;
  final Function(List<PlatformFile>) onFilesSelected;

  const CustomFileSelector({
    Key? key,
    required this.title,
    required this.allowedExtensions,
    this.multiSelect = false,
    required this.selectedFiles,
    required this.onFilesSelected,
  }) : super(key: key);

  Future<void> pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type:
      allowedExtensions.isNotEmpty ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
      allowMultiple: multiSelect,
    );

    if (result != null) {
      onFilesSelected(result.files);
    }
  }

  void removeFile(int index) {
    final updatedFiles = List<PlatformFile>.from(selectedFiles)
      ..removeAt(index);
    onFilesSelected(updatedFiles);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spacing(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.sp.sizeh,
          InkWell(
            onTap: () => pickFiles(context),
            child: Container(
              width: double.infinity,
              height: 45.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_file,
                    size: 25.sp,
                    color: Colors.grey.shade600,
                  ),
                  Text(
                    "Attach file",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    allowedExtensions.isNotEmpty
                        ? ".${allowedExtensions.join(', .')} max 5 MB"
                        : "Any file type",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.sp.sizeh,
          if (selectedFiles.isNotEmpty)
            Wrap(
              spacing: 8,
              children: selectedFiles.asMap().entries.map((entry) {
                int index = entry.key;
                PlatformFile file = entry.value;
                return Chip(
                  label: Text(
                    file.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  deleteIcon: Icon(
                    Icons.close,
                    size: 18.sp,
                  ),
                  onDeleted: () => removeFile(index),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
