import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/utils/revenue_analytics.dart';

/// Pie chart that shows COD vs Paid split.
/// Uses a local StatefulWidget ONLY to track the transient pie touch index
/// (pure UI ephemeral state — not domain/business state).
class RevenuePieChart extends StatefulWidget {
  final RevenueStats stats;

  const RevenuePieChart({super.key, required this.stats});

  @override
  State<RevenuePieChart> createState() => _RevenuePieChartState();
}

class _RevenuePieChartState extends State<RevenuePieChart> {
  int _touchedIndex = -1;

  static const _codColor = Color(0xFFFFA726);
  static const _paidColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    final stats = widget.stats;
    final total = stats.totalAmount;

    if (!stats.hasPieData) {
      return const _EmptyPie();
    }

    final codPct = (stats.codAmount / total * 100).toStringAsFixed(1);
    final paidPct = (stats.paidAmount / total * 100).toStringAsFixed(1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (evt, resp) {
                  final idx =
                      (resp == null || resp.touchedSection == null)
                          ? -1
                          : resp.touchedSection!.touchedSectionIndex;
                  if (idx != _touchedIndex) {
                    setState(() => _touchedIndex = idx);
                  }
                },
              ),
              centerSpaceRadius: 60,
              sectionsSpace: 3,
              sections: [
                _section(
                  value: stats.codAmount,
                  color: _codColor,
                  label:
                      _touchedIndex == 0
                          ? '₹${stats.codAmount.toStringAsFixed(0)}'
                          : '$codPct%',
                  isTouched: _touchedIndex == 0,
                ),
                _section(
                  value: stats.paidAmount,
                  color: _paidColor,
                  label:
                      _touchedIndex == 1
                          ? '₹${stats.paidAmount.toStringAsFixed(0)}'
                          : '$paidPct%',
                  isTouched: _touchedIndex == 1,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PieLegend(
                color: _codColor,
                label: 'Cash on\nDelivery',
                amount: '₹${stats.codAmount.toStringAsFixed(0)}',
              ),
              const SizedBox(height: 20),
              _PieLegend(
                color: _paidColor,
                label: 'Online\nPaid',
                amount: '₹${stats.paidAmount.toStringAsFixed(0)}',
              ),
              const SizedBox(height: 20),
              _PieLegend(
                color: Colors.grey.shade400,
                label: 'Total',
                amount: '₹${total.toStringAsFixed(0)}',
              ),
            ],
          ),
        ),
      ],
    );
  }

  PieChartSectionData _section({
    required double value,
    required Color color,
    required String label,
    required bool isTouched,
  }) {
    return PieChartSectionData(
      value: value,
      borderSide: BorderSide(color: AppColors.boxShadowblue),
      color: color,
      radius: isTouched ? 72 : 64,
      title: label,
      titleStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class _EmptyPie extends StatelessWidget {
  const _EmptyPie();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.pie_chart_outline, size: 52, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(
            'No payment data\nfor this period',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

class _PieLegend extends StatelessWidget {
  final Color color;
  final String label;
  final String amount;

  const _PieLegend({
    required this.color,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Colors.grey[600]),
            ),
            Text(
              amount,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
