import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../trips/presentation/views/widgets/search_bar_and_filter_widget.dart';
import 'trips_view.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(S.of(context).availableTrips),
      body: TripsView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: const SearchBarAndFilterWidget(),
        ),
      ),
    );
  }
}
