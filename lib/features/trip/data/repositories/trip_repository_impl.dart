import 'package:dartz/dartz.dart';
import 'package:travel_riverpod/core/error/failure.dart';
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
  Future<Either<Failure, List<Trip>>> getTrips() async{
    try {
      final trips = localDataSource.getTrips();
      return Right(trips.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(SomeSpecificFailure(message: e.toString()));
    }
  }

}