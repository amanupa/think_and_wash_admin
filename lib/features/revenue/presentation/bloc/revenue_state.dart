import 'package:equatable/equatable.dart';

class RevenueState extends Equatable {
  /// null means "All Time"
  final DateTime? selectedMonth;

  const RevenueState({this.selectedMonth});

  RevenueState copyWith({DateTime? selectedMonth, bool clearMonth = false}) {
    return RevenueState(
      selectedMonth: clearMonth ? null : (selectedMonth ?? this.selectedMonth),
    );
  }

  @override
  List<Object?> get props => [selectedMonth];
}
