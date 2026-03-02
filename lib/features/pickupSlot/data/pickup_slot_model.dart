import 'package:equatable/equatable.dart';

class PickupSlot extends Equatable {
  final String id;
  final DateTime start;
  final DateTime end;
  final int availableCapacity;
  final bool isAvailable;

  const PickupSlot({
    required this.id,
    required this.start,
    required this.end,
    required this.availableCapacity,
    required this.isAvailable,
  });

  factory PickupSlot.fromJson(Map<String, dynamic> json) {
    return PickupSlot(
      id: json['id'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      availableCapacity: json['availableCapacity'],
      isAvailable: json['isAvailable'],
    );
  }

  @override
  List<Object?> get props => [id];
}
