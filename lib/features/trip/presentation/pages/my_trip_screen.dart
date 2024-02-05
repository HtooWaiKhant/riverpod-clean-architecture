import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_riverpod/features/trip/presentation/providers/trip_provider.dart';
import 'package:travel_riverpod/features/trip/presentation/widgets/custom_search_bar.dart';

class MyTripScreen extends ConsumerWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);
    print("Trip List: $tripList");

    return Column(
      children: [
        CustomSearchBar(),
        ListView.builder(
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return Text(trip.title);
            }
        ),
      ],
    );
  }
}
