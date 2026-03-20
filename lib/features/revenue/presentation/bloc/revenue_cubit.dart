import 'package:flutter_bloc/flutter_bloc.dart';
import 'revenue_state.dart';

class RevenueCubit extends Cubit<RevenueState> {
  RevenueCubit() : super(const RevenueState());

  /// Select a specific month. Pass null to reset to "All Time".
  void selectMonth(DateTime? month) {
    if (month == null) {
      emit(const RevenueState());
    } else {
      emit(RevenueState(selectedMonth: DateTime(month.year, month.month)));
    }
  }
}
