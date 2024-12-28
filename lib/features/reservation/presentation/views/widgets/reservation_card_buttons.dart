import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../trip/data/repos/trip_repo_impl.dart';
import '../../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../data/models/reservation_model.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'reservation_cancelled_buttons.dart';
import 'reservation_card_bloc_builder.dart';
import 'reservation_previous_buttons.dart';
import 'reservation_upcoming_buttons.dart';

class ReservationCardButtons extends StatelessWidget {
  final ReservationStatus status;
  const ReservationCardButtons({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final reservation = context.read<ReservationCubit>().reservation!;
    switch (status) {
      case ReservationStatus.upcoming:
        return ReservationUpcomingButtons(reservation: reservation);
      case ReservationStatus.previous:
        return ReservationPreviousButtons(reservation: reservation);
      case ReservationStatus.cancelled:
        return ReservationCancelledButtons(reservation: reservation);
    }
  }
}
