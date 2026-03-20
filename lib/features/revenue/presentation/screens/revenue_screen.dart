import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_bloc.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_event.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_state.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/bloc/revenue_cubit.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/bloc/revenue_state.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/utils/revenue_analytics.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/month_picker_button.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/revenue_line_chart.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/revenue_pie_chart.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/stat_cards_row.dart';

import '../widgets/error_body.dart';
import '../widgets/section_title.dart';

/// Entry point for the Revenue analytics feature.
/// Provides [RevenueCubit] and delegates to [_RevenueBody].
class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RevenueCubit(),
      child: const _RevenueBody(),
    );
  }
}

/// Main body — listens to [OrderBloc] and [RevenueCubit] and builds the UI.
class _RevenueBody extends StatefulWidget {
  const _RevenueBody();

  @override
  State<_RevenueBody> createState() => _RevenueBodyState();
}

class _RevenueBodyState extends State<_RevenueBody> {
  @override
  void initState() {
    super.initState();
    // Trigger load if orders are not in memory yet
    final orderBloc = context.read<OrderBloc>();
    if (orderBloc.state.allOrders.isEmpty && !orderBloc.state.isLoading) {
      orderBloc.add(LoadOrders());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RevenueCubit, RevenueState>(
      builder: (context, revenueState) {
        return BlocBuilder<OrderBloc, OrderState>(
          buildWhen:
              (prev, curr) =>
                  prev.allOrders != curr.allOrders ||
                  prev.isLoading != curr.isLoading ||
                  prev.error != curr.error,
          builder: (context, orderState) {
            // ── Loading ──────────────────────────────────────────────────
            if (orderState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // ── Error ────────────────────────────────────────────────────
            if (orderState.error != null) {
              return ErrorBody(message: orderState.error!);
            }

            final selectedMonth = revenueState.selectedMonth;
            final allOrders = orderState.allOrders;
            final filtered = RevenueAnalytics.filter(allOrders, selectedMonth);
            final stats = RevenueAnalytics.compute(filtered);
            final growth = RevenueAnalytics.buildGrowth(allOrders);

            final periodLabel =
                selectedMonth == null
                    ? 'All Time'
                    : RevenueAnalytics.monthLabel(selectedMonth);

            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Header ──────────────────────────────────────
                            _PeriodHeader(label: periodLabel),
                            const SizedBox(height: 16),

                            // ── Stat cards ───────────────────────────────────
                            StatCardsRow(stats: stats),
                            const SizedBox(height: 24),

                            // ── Pie chart ────────────────────────────────────
                            SectionTitle(
                              title: 'Amount by Payment Type',
                              subtitle: periodLabel,
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 280,
                              child: RevenuePieChart(stats: stats),
                            ),
                            const SizedBox(height: 24),

                            // ── Line chart (fixed) ───────────────────────────
                            const SectionTitle(
                              title: 'Monthly Growth',
                              subtitle: 'All time · fixed',
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height:
                                  growth.isEmpty
                                      ? 120
                                      : max(180, growth.length * 42.0),
                              child: RevenueLineChart(data: growth),
                            ),
                            const SizedBox(height: 86),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // ── Month picker button ──────────────────────────────────
                Positioned(
                  bottom: 12,
                  left: 16,
                  right: 16,
                  child: MonthPickerButton(selectedMonth: selectedMonth),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

// ─── Small shared widgets ─────────────────────────────────────────────────────

class _PeriodHeader extends StatelessWidget {
  final String label;
  const _PeriodHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.analytics_outlined,
          size: 18,
          color: AppColors.primary,
        ),
        const SizedBox(width: 6),
        Text(
          'Revenue Overview · $label',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
