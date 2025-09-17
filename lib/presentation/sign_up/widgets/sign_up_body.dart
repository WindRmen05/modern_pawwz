import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/components/CustomTextField.dart';
import 'package:modern_pawwz/presentation/main_screen/main_screen.dart';
import 'package:modern_pawwz/presentation/sign_up/provider/provider.dart';

/// ================= SIGNUP SCREEN =================
class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpNotifier>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // App Logo
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.orange[200],
                child: const Icon(Icons.pets, size: 40, color: Colors.white),
              ),

              const SizedBox(height: 20),

              // Title
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              Text(
                "Enter your credentials to continue",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 30),

              // Name Field
              CustomTextField(
                label: "",
                hint: "Name",
                prefixIcon: Icon(Icons.person),
                initialValue: provider.name,
                onChanged: provider.setName,
              ),

              // Email Field
              CustomTextField(
                label: "",
                hint: "Email or Username",
                prefixIcon: Icon(Icons.email),
                initialValue: provider.email,
                onChanged: provider.setEmail,
              ),

              // Password Field
              CustomTextField(
                label: "",
                hint: "Password",
                prefixIcon: Icon(Icons.lock),
                obscureText: provider.obscurePassword,
                initialValue: provider.password,
                onChanged: provider.setPassword,
                suffixIcon: provider.obscurePassword
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined),
              ),

              const SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: provider.signup,
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Navigate to Sign In");
                      Navigator.pushNamed(context, MainScreenPage.routeName);
                    },
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
