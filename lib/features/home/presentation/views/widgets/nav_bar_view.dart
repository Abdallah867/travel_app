import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../reservation/presentation/views/booking_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';
import '../../../../trip/data/repos/trip_repo_impl.dart';
import '../../../../trip/presentation/views/saved_trips_view.dart';
import '../../manager/trips_cubit/trips_cubit.dart';
import 'main_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _selectedIndex = 0;
  final List<Widget> _screensList = [
    BlocProvider(
      create: (context) => TripsCubit(
        tripRepo: getIt.get<TripRepoImpl>(),
      )..getTrips(),
      child: const MainView(),
    ),
    const BookingView(),
    const SavedTripsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screensList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.house),
            activeIcon: const Icon(CupertinoIcons.house_fill),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.calendar),
            activeIcon: const Icon(CupertinoIcons.calendar),
            label: S.of(context).bookings,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            activeIcon: const Icon(CupertinoIcons.bookmark_fill),
            label: S.of(context).savedTrips,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person_crop_circle),
            activeIcon: const Icon(CupertinoIcons.person_crop_circle_fill),
            label: S.of(context).profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.platinumGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
