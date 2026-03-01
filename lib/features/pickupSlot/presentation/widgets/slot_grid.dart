import 'package:flutter/material.dart';
import 'package:think_and_wash/core/app_colors.dart';
import 'package:think_and_wash/features/pickupSlot/data/pickup_slot_model.dart';

class SlotGrid extends StatelessWidget {
  final List<PickupSlot> slots;
  final PickupSlot? selectedSlot;
  final Function(PickupSlot) onSelect;

  const SlotGrid({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: slots.length,
        itemBuilder: (context, index) {
          final slot = slots[index];
          final isSelected = selectedSlot?.id == slot.id;

          return GestureDetector(
            onTap: slot.isAvailable ? () => onSelect(slot) : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color:
                    !slot.isAvailable
                        ? Colors.grey.shade300
                        : isSelected
                        ? AppColors.background
                        : AppColors.background,
                borderRadius: BorderRadius.circular(12),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: AppColors.boxShadowPink,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(3, 6),
                          ),
                        ]
                        : [],
                border: Border.all(
                  color:
                      isSelected
                          ? AppColors.seedColor
                          : AppColors.boxShadowblue,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  _formatSlotTime(slot.start, slot.end),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatSlotTime(DateTime start, DateTime end) {
    final startHour = start.hour;
    final endHour = end.hour;

    final startLabel = _formatHour(startHour);
    final endLabel = _formatHour(endHour);

    return "$startLabel-$endLabel";
  }

  String _formatHour(int hour) {
    final period = hour >= 12 ? "PM" : "AM";
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    return "$formattedHour $period";
  }
}
