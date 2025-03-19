import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<DateTime> presentDates = [];
  List<DateTime> absentDates = [];

  // final EventList<Event> _markedDateMap = EventList<Event>(
  //   events: <DateTime, List<Event>>{},
  // );

  // late CalendarCarousel<Event> _calendarCarouselNoHeader;

  late double cHeight;

  void updateDates() {
    // This function is just adding dates to variable,
    // you can make this dynamic and add date in realtime
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;

    // Define the list of day numbers for the current month
    List<int> presentDayNumbers = [1, 5, 6, 9, 15, 21, 22, 23];
    List<int> absentDayNumbers = [2, 7, 8, 12, 13, 14, 16, 19, 20];

    presentDates = presentDayNumbers.map((day) {
      return DateTime(currentYear, currentMonth, day);
    }).toList();
    absentDates = absentDayNumbers.map((day) {
      return DateTime(currentYear, currentMonth, day);
    }).toList();
  }

  void initializeCalendarCarousal() {
    /// This function is used to initializing calendar carousal
    // _calendarCarouselNoHeader = CalendarCarousel<Event>(

    //   height: 286,
    //   width: 293,
    //   headerTextStyle: const TextStyle(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w600
    //   ),
    //   weekdayTextStyle: const TextStyle(
    //     color: Colors.grey,
    //     fontSize: 11
    //   ),
    //   prevDaysTextStyle: const TextStyle(
    //     fontSize: 12
    //   ),
    //   daysTextStyle: const TextStyle(
    //     fontSize: 12
    //   ),
    //   weekendTextStyle: const TextStyle(
    //     color: Colors.black,
    //     fontSize: 12
    //   ),
    //   todayButtonColor: Colors.blue.shade200,
    //   markedDatesMap: _markedDateMap,
    //   markedDateShowIcon: true,
    //   markedDateIconMaxShown: 1,
    //   markedDateMoreShowTotal: null,
    //   // null for not showing hidden events indicator
    //   markedDateIconBuilder: (event) {
    //     return event.icon;
    //   },
    // );
  }

  @override
  void initState() {
    super.initState();
    updateDates();
  }

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    /// You can move this to function initstate,
    /// if you don't want the height from mediaquery
    initializeCalendarCarousal();

    return SingleChildScrollView(
      child: Container(
        height: 293.h,
        width: 286.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          // border: Border.fromBorderSide(

          //   // color: Color(0xFFB4B4B4)

          // ),
        ),
        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // _calendarCarouselNoHeader,
            // markerRepresent(Colors.red, "Absent"),
            // markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: Text(data),
    );
  }
}
