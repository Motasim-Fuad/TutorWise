import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/st_hired_tutorinfo.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/st_save_tutorinfo.dart';

class StudentMyTutor extends StatefulWidget {
  const StudentMyTutor({super.key});

  @override
  State<StudentMyTutor> createState() => _StudentMyTutorState();
}

class _StudentMyTutorState extends State<StudentMyTutor> {
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
    final activeColor = theme.colorScheme.primary; // Typically your main theme color
    final inactiveColor = theme.textTheme.bodyMedium?.color?.withOpacity(0.6) ?? Colors.grey;

    return Scaffold(
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
                      "Save",
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
                      "Hired",
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
                  StSaveTutorinfo(),
                  StHiredTutorinfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
