import 'package:flutter/material.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/generated/l10n.dart';
import 'package:kids_area_system/core/widgets/top_bar_button.dart';
import 'package:kids_area_system/core/widgets/top_bar_tap.dart';

class AppTopBar extends StatelessWidget {
  final int selectedTabIndex;
  final Function(int) onTabSelected;

  const AppTopBar({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: Branding and quick Icons
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.extraLargePadding,
            vertical: AppConstants.mediumPadding,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/logo.png", width: 160),
              const Spacer(),
              TopBarButton(
                iconAsset: 'assets/icons/notification.svg',
                onTap: () {},
                tooltip: S.of(context).notifications,
              ),
              const SizedBox(width: AppConstants.smallPadding),
              TopBarButton(
                iconAsset: 'assets/icons/setting.svg',
                onTap: () {},
                tooltip: S.of(context).settings,
              ),
            ],
          ),
        ),
        // Row 2: Navigation Tabs
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.extraLargePadding,
          ),
          child: Row(
            children: [
              TopBarTab(
                label: S.of(context).dashboard,
                index: 0,
                selectedIndex: selectedTabIndex,
                onTap: onTabSelected,
              ),
              const SizedBox(width: AppConstants.largePadding),
              TopBarTab(
                label: S.of(context).currentSessions,
                index: 1,
                selectedIndex: selectedTabIndex,
                onTap: onTabSelected,
              ),
              const SizedBox(width: AppConstants.largePadding),
              TopBarTab(
                label: S.of(context).addChild,
                index: 2,
                selectedIndex: selectedTabIndex,
                onTap: onTabSelected,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
