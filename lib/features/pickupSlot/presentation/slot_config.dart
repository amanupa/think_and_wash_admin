import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/features/pickupSlot/presentation/widgets/app_number_field.dart';
import 'package:think_and_wash_admin/features/pickupSlot/presentation/widgets/date_picker_field.dart';
import 'package:think_and_wash_admin/features/pickupSlot/presentation/widgets/submit_button.dart';

import 'bloc/pick_up_slot_bloc.dart';
import 'widgets/spacial_note.dart';
import 'widgets/time_picker.dart';

class VendorSlotConfigScreen extends StatefulWidget {
  const VendorSlotConfigScreen({super.key});

  @override
  State<VendorSlotConfigScreen> createState() => _VendorSlotConfigScreenState();
}

class _VendorSlotConfigScreenState extends State<VendorSlotConfigScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  final _capacityController = TextEditingController();
  final _cutoffController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PickUpSlotBloc(), //context.read<UserSlotRepository>()
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          title: Text(
            "Create Pickup Slot",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),

        body: BlocListener<PickUpSlotBloc, PickUpSlotState>(
          listener: (context, state) {
            if (state is SlotConfigCreated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Slot Config Created")),
              );
              Navigator.pop(context);
            }

            if (state is SlotConfigFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  DatePickerField(
                    value: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 90)),
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = _formatDate(date);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TimePickerField(
                    value: _startTime,
                    label: "Start Time",
                    onTimeSelected: (time) {
                      setState(() => _startTime = time);
                    },
                  ),
                  const SizedBox(height: 16),
                  TimePickerField(
                    value: _endTime,
                    label: "End Time",
                    onTimeSelected: (time) {
                      setState(() => _endTime = time);
                    },
                  ),
                  const SizedBox(height: 16),
                  AppNumberField(
                    controller: _capacityController,
                    label: "Capacity Per Slot",
                  ),
                  const SizedBox(height: 16),
                  AppNumberField(
                    controller: _cutoffController,
                    label: "Caut-off minutes",
                  ),
                  const SizedBox(height: 16),
                  SpacialNote(noteController: _noteController),
                  const SizedBox(height: 24),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return BlocBuilder<PickUpSlotBloc, PickUpSlotState>(
      builder: (context, state) {
        final isLoading = state is SlotConfigCreating;

        return AppSubmitButton(
          isLoading: isLoading,
          onPressed: _onSubmit,
          text: "Create Slot Config",
        );
      },
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDate == null || _startTime == null || _endTime == null) {
      return;
    }

    context.read<PickUpSlotBloc>().add(
      CreateSlotConfig(
        date: _selectedDate!,
        startTime: _formatTime(_startTime!),
        endTime: _formatTime(_endTime!),
        capacityPerSlot: int.parse(_capacityController.text),
        cutOffMinutes: int.parse(_cutoffController.text),
        specialNote: _noteController.text,
        status: "ACTIVE",
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  String _formatDate(DateTime date) {
    return "${date.year}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
}
