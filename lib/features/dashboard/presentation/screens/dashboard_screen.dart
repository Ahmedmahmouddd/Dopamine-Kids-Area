import 'package:flutter/material.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/features/dashboard/presentation/widgets/chart.dart';
import 'package:kids_area_system/features/dashboard/presentation/widgets/top_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        child: Column(
          spacing: AppConstants.largePadding,
          children: [TopSection(), FlowChart()],
        ),
      ),
    );
  }
}
