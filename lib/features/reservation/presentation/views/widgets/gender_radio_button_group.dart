import 'package:flutter/material.dart';

import '../../manager/cubit/reservation_cubit.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  final void Function(String?) onChanged;
  final ReservationCubit reservationCubit;

  const GenderRadioButtonGroup({
    super.key,
    required this.onChanged,
    required this.reservationCubit,
  });

  @override
  GenderRadioButtonGroupState createState() => GenderRadioButtonGroupState();
}

class GenderRadioButtonGroupState extends State<GenderRadioButtonGroup> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGender = 'Male';
                });
                widget.onChanged(_selectedGender);
              },
              child: Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                      widget.onChanged(_selectedGender);
                    },
                  ),
                  const Text('Male'),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGender = 'Female';
                });
                widget.onChanged(_selectedGender);
              },
              child: Row(
                children: [
                  Radio<String>(
                    value: 'Female',
                    activeColor: Colors.pink,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                      widget.onChanged(_selectedGender);
                    },
                  ),
                  const Text('Female'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
