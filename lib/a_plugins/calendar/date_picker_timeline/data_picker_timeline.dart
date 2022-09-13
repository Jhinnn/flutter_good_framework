import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class DatePickerTimelineDemo extends StatefulWidget {
  const DatePickerTimelineDemo({
    Key? key,
  }) : super(key: key);

  @override
  _DatePickerTimelineDemoState createState() => _DatePickerTimelineDemoState();
}

class _DatePickerTimelineDemoState extends State<DatePickerTimelineDemo> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.replay),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: const Text('DatePickerTimelineDemo'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.blueGrey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("You Selected:"),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(_selectedValue.toString()),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              DatePicker(
                DateTime.now(),
                width: 60,
                height: 80,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                inactiveDates: [
                  DateTime.now().add(const Duration(days: 3)),
                  DateTime.now().add(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 7))
                ],
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
