import 'package:flutter/material.dart';
import 'package:flutter_test_ricky/features/combined/widgets/combined_app_bar.dart';
import 'package:flutter_test_ricky/features/prefs/presentation/views/prefs_list_view.dart';

import '../api-items/presentation/presentation.dart';

class CombinedPage extends StatefulWidget {
  const CombinedPage({super.key});

  @override
  State<CombinedPage> createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: CombinedAppBar(
        index: currentIndex,
        onTabSelected: goTo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF0B0F1A),
              Color(0xFF1B5E20),
            ],
          ),
        ),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: const [
            ApiListView(), 
            PrefsListPage(),   
          ],
        ),
      ),
    );
  }
}
