// ignore_for_file: avoid_print

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../z_widget/div_scaffold.dart';

class BottomPickerDemo extends StatelessWidget {
  const BottomPickerDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'bottom_picker',
      child: ExampleApp(),
    );
  }
}

class ExampleApp extends StatelessWidget {
  final countryList = const [
    Text('Algeria 🇩🇿'),
    Text('Maroco 🇲🇦'),
    Text('Tunisia 🇹🇳'),
    Text('Palestine 🇵🇸'),
    Text('Egypt 🇪🇬'),
    Text('Syria 🇸🇾'),
    Text('Irak 🇮🇶'),
    Text('Mauritania 🇲🇷')
  ];

  final buttonWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF6F2F2),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://github.com/koukibadr/Bottom-Picker/blob/main/example/bottom_picker_logo.gif?raw=true',
            width: 200,
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openSimpleItemPicker(context, countryList);
              },
              child: const Text('Simple Item picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openSecondSimpleItemPicker(context, countryList);
              },
              child: const Text('Simple Item picker with different theme'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDatePicker(context);
              },
              child: const Text('Date Picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openTimePicker(context);
              },
              child: const Text('Time Picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDateTimePicker(context);
              },
              child: const Text('Date and Time Picker'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openDateTimePickerWithCustomButton(context);
              },
              child: const Text('Bottom picker with custom button'),
            ),
          ),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                _openPickerWithCustomPickerTextStyle(context);
              },
              child: const Text(
                'Bottom picker with custom picker text style',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openSimpleItemPicker(BuildContext context, List<Text> items) {
    BottomPicker(
      items: items,
      title: 'Choose your country',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      backgroundColor: Colors.yellow.withOpacity(0.6),
      bottomPickerTheme: BottomPickerTheme.morningSalad,
      onSubmit: (index) {
        print(index);
      },
      buttonAlignement: MainAxisAlignment.start,
      displayButtonIcon: false,
      displaySubmitButton: false,
    ).show(context);
  }

  void _openSecondSimpleItemPicker(BuildContext context, List<Text> items) {
    BottomPicker(
      items: items,
      selectedItemIndex: 1,
      title: 'اختر بلدك',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.morningSalad,
      layoutOrientation: LayoutOrientation.rtl,
    ).show(context);
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Birthday',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openTimePicker(BuildContext context) {
    BottomPicker.time(
      title: 'Set your next meeting time',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.orange,
      ),
      onSubmit: (index) {
        print(index);
      },
      onClose: () {
        print('Picker closed');
      },
      bottomPickerTheme: BottomPickerTheme.orange,
      use24hFormat: true,
    ).show(context);
  }

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      title: 'Set the event exact time and date',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('Picker closed');
      },
      iconColor: Colors.black,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
      gradientColors: [const Color(0xfffdcbf1), const Color(0xffe6dee9)],
    ).show(context);
  }

  void _openDateTimePickerWithCustomButton(BuildContext context) {
    BottomPicker.dateTime(
      title: 'Set the event exact time and date',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('Picker closed');
      },
      buttonText: 'Confirm',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: Colors.pink,
      iconColor: Colors.black,
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      gradientColors: const[ Color(0xfffdcbf1),  Color(0xffe6dee9)],
    ).show(context);
  }

  void _openPickerWithCustomPickerTextStyle(BuildContext context) {
    BottomPicker(
      items: const [
         Text('Leonardo DiCaprio'),
         Text('Johnny Depp'),
         Text('Robert De Niro'),
         Text('Tom Hardy'),
         Text('Ben Affleck'),
      ],
      title: 'Select the actor',
      pickerTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      closeIconColor: Colors.red,
    ).show(context);
  }
}
