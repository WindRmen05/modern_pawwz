import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_back_button.dart';
import 'package:provider/provider.dart';

class AiChatBotBody extends StatelessWidget {
  const AiChatBotBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AiChatBotNotifier>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomBackButtonAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              // Greeting
              Text(
                "Hello, Pet Parent!",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "How can I help you today?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 40.h),

              // Floating Assistant (circle with glow)
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C4DFF), Color(0xFF448AFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "🐶",
                    style: TextStyle(fontSize: 40.sp),
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Action buttons
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: provider.actions.map((action) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(action["icon"]!, style: TextStyle(fontSize: 18.sp)),
                        SizedBox(width: 8.w),
                        Text(
                          action["label"]!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const Spacer(),

              // Bottom Input + Mic
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Text(
                          "Ask me anything...",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.mic, color: Colors.white, size: 24.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

