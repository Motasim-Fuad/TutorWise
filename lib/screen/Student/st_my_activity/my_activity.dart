import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen/Student/st_my_activity/tution_apply_screen.dart';
import 'package:tutorapp/screen/Student/st_my_activity/tution_post.dart';

class StMyActivityScreen extends StatefulWidget {
  const StMyActivityScreen({super.key});

  @override
  State<StMyActivityScreen> createState() => _StMyActivityScreenState();
}

class _StMyActivityScreenState extends State<StMyActivityScreen> {
  final selectedScreenIndex = 0.obs;
  final PageController _pageController = PageController();

  void _onTabTapped(int index) {
    selectedScreenIndex.value = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onPageChanged(int index) {
    selectedScreenIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = theme.colorScheme.primary;
    final inactiveColor = theme.textTheme.bodyMedium?.color?.withOpacity(0.6) ?? Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Activity"),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.only( left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onTabTapped(0),
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedScreenIndex.value == 0
                              ? activeColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      "My Apply",
                      style: TextStyle(
                        color: selectedScreenIndex.value == 0
                            ? activeColor
                            : inactiveColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: () => _onTabTapped(1),
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedScreenIndex.value == 1
                              ? activeColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      "My Post",
                      style: TextStyle(
                        color: selectedScreenIndex.value == 1
                            ? activeColor
                            : inactiveColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  TutionApplyScreen(),
                  TutionPostScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
