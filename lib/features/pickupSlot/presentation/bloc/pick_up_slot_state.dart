part of 'pick_up_slot_bloc.dart';

sealed class PickUpSlotState extends Equatable {
  const PickUpSlotState();

  @override
  List<Object?> get props => [];
}

final class PickUpSlotInitial extends PickUpSlotState {}

class SlotConfigCreating extends PickUpSlotState {}

class SlotConfigCreated extends PickUpSlotState {}

class SlotConfigFailure extends PickUpSlotState {
  final String message;

  const SlotConfigFailure(this.message);

  @override
  List<Object> get props => [message];
}
