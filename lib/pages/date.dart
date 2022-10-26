import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:testing/pages/createmeal.dart';
import 'package:testing/widget/theme.dart';

// import 'package:syncfusion_flutter_calendar/calendar.dart';
class date extends StatefulWidget {
  static const nameRoute = '/date';

  @override
  State<date> createState() => _dateState();
}

class _dateState extends State<date> {
  final CalendarController _controller = CalendarController();
  String headerString = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 9;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
            .pushNamed(createmeal.nameRoute);
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Color.fromARGB(255, 242, 211, 136),
        ),
      body: Column(
        children: [
          Container(
            height: 30,
            color: Color.fromARGB(255, 167, 210, 203),
          ),
          Row(
            children: [
              Container(
                height: cellWidth*2,
                width: cellWidth + 10,
                color: greentosca,
              ),
              Container(
                  width: cellWidth,
                  height: cellWidth*2,
                  color: greentosca,
                  child: IconButton(
                    icon: Icon(Icons.arrow_left,size: 40,),
                    color: darkchoco,
                    highlightColor: Colors.lightGreen,
                    onPressed: () {
                      setState(() {
                        _controller.backward!();
                      });
                    },
                  )),
              Container(
                color: greentosca,
                height: cellWidth*2,
                width: cellWidth * 4.5,
                child: Center(
                  child: Text(headerString,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 19, 12, 12),
                          fontWeight: FontWeight.bold
                          )),
                ),
              ),
              Container(
                  width: cellWidth,
                  height: cellWidth*2,
                  color: greentosca,
                  child: IconButton(
                    icon: Icon(Icons.arrow_right,size: 40,),
                    color: darkchoco,
                    highlightColor: Colors.lightGreen,
                    onPressed: () {
                      setState(() {
                        _controller.forward!();
                      });
                    },
                  )),
              Container(
                height: cellWidth*2,
                width: cellWidth + 10,
                color: greentosca,
              ),
            ],
          ),
          Container(
            height: 630,
            child: SfCalendar(
              controller: _controller,
              headerHeight: 0,
              todayHighlightColor: darkchoco,
              headerStyle: CalendarHeaderStyle(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  textAlign: TextAlign.center),

              // ),
              view: CalendarView.month,
              onViewChanged: (ViewChangedDetails details) {
                List<DateTime> dates = details.visibleDates;
                final DateTime visibleStartDate = details.visibleDates.first;
                final DateTime visibleEndDate = details.visibleDates.last;
                final int totalVisibleDays =
                    (visibleStartDate.difference(visibleEndDate).inDays);
                final DateTime midDate =
                    visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
                headerString =
                    DateFormat('MMMM yyyy').format(midDate).toString();
                SchedulerBinding.instance.addPostFrameCallback((duration) {
                  setState(() {});
                });
              },
              cellBorderColor: Color.fromARGB(255, 135, 76, 98),
              backgroundColor: Color.fromARGB(255, 167, 210, 203),

              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
          ),
        ],
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final List<DateTime> startTime = [
    DateTime(today.year, today.month, today.day, 11, 0, 0),
    DateTime(today.year, today.month, today.day, 17, 0, 0),
  ];
  final DateTime endTime = startTime[0].add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime[0], endTime, Color.fromARGB(255, 84, 18, 176)));
  meetings.add(
      Meeting('Makan', startTime[1], endTime, Color.fromARGB(255, 134, 15, 67)));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

 
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
}
