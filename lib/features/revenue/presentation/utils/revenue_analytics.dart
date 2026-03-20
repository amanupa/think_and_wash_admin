import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';

/// Immutable view-model for the revenue stats section.
class RevenueStats {
  final int totalOrders;
  final int deliveredOrders;
  final int cancelledOrders;
  final double codAmount;
  final double paidAmount;

  const RevenueStats({
    required this.totalOrders,
    required this.deliveredOrders,
    required this.cancelledOrders,
    required this.codAmount,
    required this.paidAmount,
  });

  double get totalAmount => codAmount + paidAmount;
  bool get hasPieData => totalAmount > 0;
}

/// Immutable data point for a single month on the growth chart.
class MonthGrowthPoint {
  final String label; // e.g. "Jan\n24"
  final int count;
  final DateTime month;

  const MonthGrowthPoint({
    required this.label,
    required this.count,
    required this.month,
  });
}

/// Pure functions — no state, no side-effects. Safe to call inside BlocBuilder.
class RevenueAnalytics {
  RevenueAnalytics._();

  static const _monthAbbr = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String monthLabel(DateTime dt) =>
      '${_monthAbbr[dt.month - 1]} ${dt.year}';

  static String shortLabel(DateTime dt) =>
      '${_monthAbbr[dt.month - 1]}\n${dt.year.toString().substring(2)}';

  /// Filter orders by month; pass null for all-time.
  static List<OrderEntity> filter(
    List<OrderEntity> orders,
    DateTime? month,
  ) {
    if (month == null) return orders;
    return orders
        .where((o) => o.orderDate.year == month.year && o.orderDate.month == month.month)
        .toList();
  }

  /// Compute stats from a (possibly filtered) list of orders.
  static RevenueStats compute(List<OrderEntity> orders) {
    int delivered = 0;
    int cancelled = 0;
    double cod = 0;
    double paid = 0;

    for (final o in orders) {
      if (o.status == OrderStatus.delivered) delivered++;
      if (o.status == OrderStatus.cancelled) cancelled++;
      if (o.paymentType == PaymentType.cod) {
        cod += o.totalAmount;
      } else {
        paid += o.totalAmount;
      }
    }

    return RevenueStats(
      totalOrders: orders.length,
      deliveredOrders: delivered,
      cancelledOrders: cancelled,
      codAmount: cod,
      paidAmount: paid,
    );
  }

  /// Build month-by-month growth data spanning the entire order history.
  static List<MonthGrowthPoint> buildGrowth(List<OrderEntity> allOrders) {
    if (allOrders.isEmpty) return [];

    final sorted = List<OrderEntity>.from(allOrders)
      ..sort((a, b) => a.orderDate.compareTo(b.orderDate));

    final first = DateTime(sorted.first.orderDate.year, sorted.first.orderDate.month);
    final last = DateTime(sorted.last.orderDate.year, sorted.last.orderDate.month);

    final result = <MonthGrowthPoint>[];
    var cursor = first;

    while (!cursor.isAfter(last)) {
      final count = allOrders
          .where((o) => o.orderDate.year == cursor.year && o.orderDate.month == cursor.month)
          .length;
      result.add(MonthGrowthPoint(
        label: shortLabel(cursor),
        count: count,
        month: cursor,
      ));
      cursor = DateTime(cursor.year, cursor.month + 1);
    }

    return result;
  }

  /// Returns the last [n] calendar months ending at [now].
  static List<DateTime> lastNMonths(DateTime now, int n) {
    final months = <DateTime>[];
    for (int i = n - 1; i >= 0; i--) {
      months.add(DateTime(now.year, now.month - i));
    }
    return months;
  }
}
