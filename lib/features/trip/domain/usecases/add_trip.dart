import 'package:travel_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_riverpod/features/trip/domain/repositories/trip_repository.dart';

class AddTrip {
  final TripRepository tripRepository;

  AddTrip(this.tripRepository);

  Future<void> call(Trip trip) async {
    return await tripRepository.addTrip(trip);
  }
}