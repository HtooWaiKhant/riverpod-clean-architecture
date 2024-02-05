import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_riverpod/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'City 1');
  final _descriptionController = TextEditingController(text: 'Best City Ever!');
  final _locationController = TextEditingController(text: 'Paris');
  final _pictureController = TextEditingController(text: 'https://www.google.com/paris.jpg');
  final _dateController = TextEditingController(text: '2022-12-12');
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pictureController,
                decoration: InputDecoration(
                  labelText: 'Picture',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter picture';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  pictures.add(value);
                  _pictureController.clear();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  pictures.add(_pictureController.text);
                  if(_formKey.currentState!.validate()){
                    final newTrip = Trip(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      location: _locationController.text,
                      photos: pictures,
                      date: DateTime.parse(_dateController.text),
                    );
                    ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                    ref.watch(tripListNotifierProvider.notifier).loadTrips();
                  }
                },
                child: Text('Add Trip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
