import 'package:travel_riverpod/features/trip/domain/repositories/trip_repository.dart';

class DeleteTrip {
  final TripRepository tripRepository;

  DeleteTrip(this.tripRepository);

  Future<void> call(int index) async {
    return tripRepository.deleteTrip(index);
  }
}