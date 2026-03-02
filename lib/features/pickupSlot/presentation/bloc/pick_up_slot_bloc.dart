import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pick_up_slot_event.dart';
part 'pick_up_slot_state.dart';

class PickUpSlotBloc extends Bloc<PickUpSlotEvent, PickUpSlotState> {
  //final UserSlotRepository repository;this.repository
  PickUpSlotBloc() : super(PickUpSlotInitial()) {
    on<CreateSlotConfig>(_onCreateSlotConfig);
  }
  Future<void> _onCreateSlotConfig(
    CreateSlotConfig event,
    Emitter<PickUpSlotState> emit,
  ) async {
    emit(SlotConfigCreating());

    try {
      /*await repository.createSlotConfig({
      "date": event.date,
      "startTime": event.startTime,
      "endTime": event.endTime,
      "capacityPerSlot": event.capacityPerSlot,
      "cutOffMinutes": event.cutOffMinutes,
      "specialNote": event.specialNote,
      "status": event.status,
    });*/

      emit(SlotConfigCreated());
    } catch (e) {
      emit(SlotConfigFailure(e.toString()));
    }
  }
}
