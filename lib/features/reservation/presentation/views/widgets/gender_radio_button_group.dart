import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/reservation_cubit.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  final String selectedGender;

  const GenderRadioButtonGroup({
    super.key,
    required this.selectedGender,
  });

  @override
  GenderRadioButtonGroupState createState() => GenderRadioButtonGroupState();
}

class GenderRadioButtonGroupState extends State<GenderRadioButtonGroup> {
  @override
  Widget build(BuildContext context) {
    final ReservationCubit reservationCubit = context.read<ReservationCubit>();

    final selectedGender = reservationCubit.genderController.text;
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gender',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Radio<String>(
                      activeColor: Colors.blue,
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          reservationCubit.genderController.text = 'Male';
                        });
                      },
                    ),
                    const Text('Male'),
                  ],
                ),
                const SizedBox(width: 20.0),
                Row(
                  children: [
                    Radio<String>(
                        value: 'Female',
                        activeColor: Colors.pink,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            reservationCubit.genderController.text = 'Female';
                          });
                        }),
                    const Text('Female'),
                  ],
                ),
              ],
            ),
            state is ReservationFormError
                ? Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 4.0, start: 8.0),
                    child: Text(
                      'Gender is required',
                      style: TextStyle(color: Colors.red[800], fontSize: 12),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }
}
