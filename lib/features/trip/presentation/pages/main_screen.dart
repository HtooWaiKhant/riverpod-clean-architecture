import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_riverpod/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:travel_riverpod/features/trip/presentation/pages/my_trip_screen.dart';
import 'package:travel_riverpod/features/trip/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi Khant!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            Text('Travelling Today ?', style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          MyTripScreen(),
          AddTripScreen(),
          Center(
            child: Text('Third Page'),
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
          builder: (BuildContext context, int value, Widget? child) {
            return BottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                _currentPage.value = index;
                _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'My Trips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add Trip',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Map',
                ),
              ],
            );
          }
      )
    );
  }
}
