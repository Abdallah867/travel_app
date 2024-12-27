import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../agencies/presentation/manager/bloc/agencies_bloc.dart';
import 'travel_agency_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TravelAgenciesListView extends StatelessWidget {
  const TravelAgenciesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgenciesBloc, AgenciesState>(
      builder: (context, state) {
        switch (state) {
          case AgenciesLoadInProgress():
            // Show a loading indicator when data is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          case AgenciesLoaded():
            // Display the list of travel agencies when data is loaded
            return SizedBox(
              height: 130.w, // Adjust height as needed
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.agencies.length,
                  itemBuilder: (context, index) {
                    return TravelAgencyCard(
                      agency: state.agencies[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                ),
              ),
            );
          case AgenciesFailure():
            // Display an error message when there is a failure
            return Center(
              child: Text(
                'Error: ${state.errMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          default:
            // Handle the initial state or unexpected states
            return const Center(
              child: Text('No data available.'),
            );
        }
      },
    );
  }
}
