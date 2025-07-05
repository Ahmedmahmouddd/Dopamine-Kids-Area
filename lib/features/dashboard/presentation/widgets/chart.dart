import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

class FlowChart extends StatelessWidget {
  const FlowChart({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy data
    final List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    final List<double> values = [70, 90, 85, 80, 75, 95, 100]; // dummy data
    final maxValue = values.reduce((a, b) => a > b ? a : b);

    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.largePadding,
        AppConstants.mediumPadding,
        AppConstants.largePadding,
        AppConstants.largePadding,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppConstants.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Activity Flow',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ],
          ),
          const SizedBox(height: AppConstants.largePadding),
          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: days.length - 1,
                minY: -1,
                maxY: maxValue + 1,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(days.length, (index) {
                      return FlSpot(index.toDouble(), values[index]);
                    }),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    barWidth: 4,
                    color: AppColors.red,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.red.withAlpha(125),
                          AppColors.red.withAlpha(85),
                          AppColors.red.withAlpha(25),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpots) => AppColors.lightGrey,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${days[spot.x.toInt()]}\n${spot.y.toInt()} points',
                          const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 1.5,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: AppConstants.largePadding,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= days.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: AppConstants.basePadding,
                            left: AppConstants.extraSmallPadding,
                          ),
                          child: Text(
                            days[index],
                            style: AppTextStyles.font11GreyMedium,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 34,
                      interval: 20,
                      getTitlesWidget: (value, meta) {
                        if (value == meta.min || value == meta.max) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: AppConstants.smallPadding,
                          ),
                          child: Text(
                            value.toInt().toString(),
                            style: AppTextStyles.font11GreyMedium,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  getDrawingVerticalLine: (value) => FlLine(
                    color: AppColors.lightGrey,
                    strokeWidth: 1,
                    dashArray: [6],
                  ),
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: AppColors.lightGrey,
                    strokeWidth: 1,
                    dashArray: [6],
                  ),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
