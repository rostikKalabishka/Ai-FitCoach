import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomCalendarState();
  }
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2032, 1, 1),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarStyle: CalendarStyle(
            holidayTextStyle: TextStyle(color: Colors.white),
            weekNumberTextStyle: TextStyle(color: Colors.white),
            defaultTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: const Color.fromARGB(255, 46, 54, 90),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: const Color.fromARGB(255, 114, 113, 44),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
