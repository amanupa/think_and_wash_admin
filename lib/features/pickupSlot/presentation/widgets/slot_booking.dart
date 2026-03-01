/*class UserSlotScreen extends StatelessWidget {
  final String vendorId;
  final String date;

  const UserSlotScreen({
    required this.vendorId,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserSlotBloc(
        UserSlotRepository(ApiClient()),
      )..add(LoadUserSlots(vendorId, date)),
      child: Scaffold(
        appBar: AppBar(title: const Text("Select Pickup Slot")),
        body: BlocBuilder<UserSlotBloc, UserSlotState>(
          builder: (context, state) {
            if (state is UserSlotLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserSlotLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.slots.length,
                itemBuilder: (context, index) {
                  final slot = state.slots[index];
                  final isSelected =
                      state.selectedSlot?.id == slot.id;

                  return GestureDetector(
                    onTap: slot.isAvailable
                        ? () => context
                            .read<UserSlotBloc>()
                            .add(SelectSlot(slot))
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: !slot.isAvailable
                            ? Colors.grey.shade300
                            : isSelected
                                ? Colors.blue
                                : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "${_format(slot.start)} - ${_format(slot.end)}",
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(child: Text("Error"));
          },
        ),
      ),
    );
  }

  String _format(DateTime dt) {
    return "${dt.hour}:00";
  }
} */
