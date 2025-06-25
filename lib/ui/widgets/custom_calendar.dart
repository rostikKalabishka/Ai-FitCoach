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
    final theme = Theme.of(context);
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
          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleTextStyle: theme.textTheme.headlineMedium!.copyWith(fontSize: 18),
            formatButtonTextStyle: theme.textTheme.headlineMedium!,
            formatButtonDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          calendarStyle: CalendarStyle(
            holidayTextStyle:
                TextStyle(color: theme.textTheme.headlineMedium?.color),
            weekNumberTextStyle:
                TextStyle(color: theme.textTheme.headlineMedium?.color),
            defaultTextStyle:
                TextStyle(color: theme.textTheme.headlineMedium?.color),
            todayDecoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
