import 'package:travel_riverpod/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_riverpod/features/trip/data/models/trip_model.dart';
import 'package:travel_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_riverpod/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl extends TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async{
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async{
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async{
    final trips = localDataSource.getTrips();
    return trips.map((e) => e.toEntity()).toList();
  }

}