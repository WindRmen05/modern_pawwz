import 'package:flutter/material.dart';
import 'package:modern_pawwz/main.dart';
import 'package:sizable/sizable.dart';

CustomLoadingWidget({double? ht,double? width}) {
  return SizedBox(
    width: width,
    height: ht ?? height(navigator.currentState!.context) * .85,
    child: Center(child: CircularProgressIndicator()),
  );
}

void showLoadingPopup( {String? message}) {
  showDialog(
    context: navigator.currentState!.context,
    barrierDismissible: false,
    builder: (_) => LoadingPopup(message: message ?? "Loading! Please wait..."),
  );
}

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              message ?? "Loading...",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
