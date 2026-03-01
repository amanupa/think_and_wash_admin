part of 'pick_up_slot_bloc.dart';

sealed class PickUpSlotEvent extends Equatable {
  const PickUpSlotEvent();

  @override
  List<Object?> get props => [];
}

class CreateSlotConfig extends PickUpSlotEvent {
  final String date;
  final String startTime;
  final String endTime;
  final int capacityPerSlot;
  final int cutOffMinutes;
  final String? specialNote;
  final String status;

  const CreateSlotConfig({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.capacityPerSlot,
    required this.cutOffMinutes,
    this.specialNote,
    required this.status,
  });

  @override
  List<Object?> get props => [
    date,
    startTime,
    endTime,
    capacityPerSlot,
    cutOffMinutes,
    specialNote,
    status,
  ];
}
