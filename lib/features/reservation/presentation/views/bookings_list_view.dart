import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../data/repos/reservation_repo_impl.dart';
import '../manager/cubit/reservation_cubit.dart';
import 'widgets/bookings_list_view_body.dart';

class BookingsListView extends StatelessWidget {
  const BookingsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationCubit(
        reservationRepo: getIt.get<ReservationRepoImpl>(),
      )..getReservations(
          userId: context.read<CurrentAccountCubit>().userInformations!.userId,
        ),
      child: const BookingsListViewBody(),
    );
  }
}
