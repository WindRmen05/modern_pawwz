import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/add_post/view/add_post_page.dart';
import 'package:modern_pawwz/presentation/components/custom_app_bar.dart';
import 'package:modern_pawwz/presentation/home_screen/home_screen.dart';
import 'package:modern_pawwz/presentation/main_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/petshop/view/petshop_page.dart';
import 'package:modern_pawwz/presentation/profile/view/profile_page.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          location: "Kozhikode", profileImage: "assets/images/dog.jpg"),
      body: Consumer<MainScreenNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            body: IndexedStack(
              index: value.selectedIndex,
              children: [
                HomeScreenPage(),
                // PetshopPage(),
                // AddPostPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedLabelStyle: TextStyle(
                color: Colors.black87,
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.black,
              ),
              currentIndex: value.selectedIndex,
              onTap: (p0) {
                value.selectedIndex = p0;
                value.refresh();
              },
              type: BottomNavigationBarType.fixed,
              items: List.generate(value.icons.length - 1, (index) {
                final isSelected = value.selectedIndex == index;
                final iconPath = isSelected
                    ? '${value.icons[index]}-bold.png'
                    : '${value.icons[index]}.png';

                return BottomNavigationBarItem(
                  icon: Image.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                  ),
                  label: value.labels[index],
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
