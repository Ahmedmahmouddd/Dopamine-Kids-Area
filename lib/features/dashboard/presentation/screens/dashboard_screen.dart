import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/features/dashboard/presentation/widgets/chart.dart';
import 'package:kids_area_system/features/dashboard/presentation/widgets/info_card_with_icons.dart';
import 'package:kids_area_system/generated/l10n.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: Row(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InfoCardWithIcon(
                  title: S.of(context).totalSessions,
                  value: '24 ${S.of(context).sessions}',
                  iconColor: AppColors.purple,
                  iconPath: 'assets/icons/total-sessions.svg',
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalPoints,
                  value: '12500 ${S.of(context).points}',
                  iconPath: 'assets/icons/point.svg',
                  iconColor: AppColors.red,
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalRevenue,
                  value: '3700 ${S.of(context).le}',
                  iconPath: 'assets/icons/wallet.svg',
                  iconColor: AppColors.yellow,
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalHours,
                  value: '93 ${S.of(context).hours}',
                  iconPath: 'assets/icons/total-hours.svg',
                  iconColor: AppColors.orange,
                  showStatistics: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              // vertical: 24.0,
              horizontal: 24.0,
            ),
            child: WeeklyFlowChart(),
          ),
        ],
      ),
    );
  }
}
