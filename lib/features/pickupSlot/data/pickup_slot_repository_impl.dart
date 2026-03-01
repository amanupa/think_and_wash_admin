import 'pickup_slot_model.dart';

class UserSlotRepository {
  //final ApiClient api;this.api

  UserSlotRepository();

  Future<List<PickupSlot>> fetchSlots(String vendorId, String date) async {
    /*final res = await api.get(
      "/public/pickup-slots",
      query: {"vendorId": vendorId, "date": date},
    );

    final slotsJson = res.data['data']['slots'] as List;

    return slotsJson.map((e) => PickupSlot.fromJson(e)).toList();*/
    return [];
  }
}
