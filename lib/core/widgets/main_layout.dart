import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/widgets/app_topbar.dart';
import 'package:kids_area_system/features/add_child/presentation/screens/add_child_screen.dart';
import 'package:kids_area_system/features/current_sessions/presentation/screens/current_sessions_screen.dart';
import 'package:kids_area_system/features/dashboard/presentation/screens/dashboard_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          AppTopBar(
            selectedTabIndex: selectedTab,
            onTabSelected: (index) {
              setState(() {
                selectedTab = index;
              });
            },
          ),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedTab) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const CurrentSessionsScreen();
      case 2:
        return const AddChildScreen();
      default:
        // return const SizedBox.shrink();
        return const DashboardScreen();
    }
  }
}
