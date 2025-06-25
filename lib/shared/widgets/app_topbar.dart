import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/generated/l10n.dart';
import 'package:kids_area_system/shared/widgets/top_bar_button.dart';
import 'package:kids_area_system/shared/widgets/top_bar_tap.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              const Spacer(),
              TopBarButton(
                iconAsset: 'assets/icons/notification.svg',
                onTap: () {},
                tooltip: S.of(context).notifications,
              ),
              const SizedBox(width: 8),
              TopBarButton(
                iconAsset: 'assets/icons/setting.svg',
                onTap: () {},
                tooltip: S.of(context).settings,
              ),
            ],
          ),
        ),
        // Row 2: Navigation Tabs
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              TopBarTab(
                label: S.of(context).dashboard,
                index: 0,
                selectedIndex: selectedTabIndex,
                onTap: onTabSelected,
              ),
              const SizedBox(width: 24),
              TopBarTab(
                label: S.of(context).currentSessions,
                index: 1,
                selectedIndex: selectedTabIndex,
                onTap: onTabSelected,
              ),
              const SizedBox(width: 24),
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
