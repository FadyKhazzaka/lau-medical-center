import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AgeTextField extends StatefulWidget {
  const AgeTextField({Key? key}) : super(key: key);

  @override
  AgeTextFieldState createState() => AgeTextFieldState();
}

class AgeTextFieldState extends State<AgeTextField> {
  final TextEditingController _textEditingController = TextEditingController();
// String?errorText;
   String _selectedDate = '';
//  void _onTextFieldClick() {
//     setState(() {
//       errorText = null;
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime.now(),
                onConfirm: (date) {
                  setState(() {
                    _selectedDate =
                        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}';

                    _textEditingController.text = _selectedDate;
                  });
                },
                currentTime: DateTime.now(),
                locale: LocaleType.en,
              );
            },
            child: AbsorbPointer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[200],
                    child: TextFormField(
                      controller:
                          _textEditingController, // Add TextEditingController here
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your dob';
                        }
                        return null;
                      },

                      // validator: (value) {
                      //   if (value == null || value == '') {
                      //     setState(() {
                      //       errorText = 'Please enter your dob';
                      //     });
                      //   }
                      //   return null;
                      // },

                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today_outlined),
                        hintText: 'Select your date of birth',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
