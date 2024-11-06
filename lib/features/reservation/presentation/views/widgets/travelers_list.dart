import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'traveler_card.dart';

class TravelersList extends StatelessWidget {
  const TravelersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return context.read<ReservationCubit>().travelersList.isEmpty
            ? const SliverToBoxAdapter(child: SizedBox())
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount:
                      context.read<ReservationCubit>().travelersList.length,
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        TravelerCard(
                          reservationCubit: context.read<ReservationCubit>(),
                          traveler: context
                              .read<ReservationCubit>()
                              .travelersList[index],
                        ),
                        const VerticalSpace(size: 8),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
