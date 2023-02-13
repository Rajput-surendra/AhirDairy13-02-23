import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/calender/calender.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event.dart';

class CalenderScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;
  final Function(int)? callback;
  CalenderScreen({Key? key, required this.parentScaffoldKey, this.callback})
      : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  late final ValueNotifier<List<Event>> selectedEvents;
  // Map<DateTime, List<Event>> selectedEvents = {
  //   DateTime.now(): [Event(title: 'Birthday')],
  //   DateTime.now(): [Event(title: 'Anniversary')],
  // };

  @override
  void initState() {
    selectedEvents = ValueNotifier(getEventsForDay(_selectedDay));
    super.initState();
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime? selectedDay) {
    return kEvents[selectedDay] ?? [];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    // Call `setState()` when updating the selected day
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      rangeStart = start;
      rangeEnd = end;
      rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      selectedEvents.value = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents.value = getEventsForDay(end);
    }
  }

  void daySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      // Call `setState()` when updating the selected day
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        rangeStart = null;
        rangeEnd = null;
        rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
    selectedEvents.value = getEventsForDay(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashBoardScreen()));
        return true;
      },
      child: Scaffold(
        backgroundColor:
            isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
            onPressed: () =>
                widget.parentScaffoldKey.currentState?.openDrawer(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor:
              isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
          elevation: 0,
          title: InkWell(
            onTap: () {
              Get.to(SearchForProduct());
            },
            child: IgnorePointer(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: commonFloatingFormField(context, '',
                          hintText: getTranslator('search'),
                          fieldHeight: 40,
                          color: isDark
                              ? AppThemes.smoothBlack
                              : AppThemes.lightWhiteBackGroundColor,
                          contentPadding: EdgeInsets.only(bottom: 10),
                          floatingHint: FloatingLabelBehavior.always,
                          padding:
                              EdgeInsets.only(left: 0, bottom: 0, right: 10),
                          prefixIcon: Icon(Icons.search,
                              size: 28, color: AppThemes.lightTextGreyColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            ShoppingCartButtonWidget(
                iconColor: isDark
                    ? AppThemes.lightGreyColor
                    : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            NotificationButtonWidget(
                iconColor: isDark
                    ? AppThemes.lightGreyColor
                    : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            SizedBox(width: 15)
          ],
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: isDark
                    ? AppThemes.DarkModeColor
                    : AppThemes.lightWhiteBackGroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getTranslator("calendar"),
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getTranslator("calendar_instruction"),
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(CalenderOpenScreen());
                      },
                      child: Container(
                        //                      height: MediaQuery.of(context).size.height * 0.3,
                        child: TableCalendar(
                          firstDay: kFirstDay,
                          lastDay: kLastDay,
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          eventLoader: getEventsForDay,
                          rangeSelectionMode: rangeSelectionMode,
                          calendarBuilders: CalendarBuilders(
                            markerBuilder: (context, day, events) {
                              if (events.isEmpty) return SizedBox();
                              return Container(
                                margin: EdgeInsets.only(top: 30),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: events.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 5,
                                          decoration: BoxDecoration(
                                            color: (index % 2) == 0
                                                ? AppThemes.lightRedColor
                                                : AppThemes.lightGreenColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            },
                          ),
                          selectedDayPredicate: (day) {
                            // Use `selectedDayPredicate` to determine which day is currently selected.
                            // If this returns true, then `day` will be marked as selected.

                            // Using `isSameDay` is recommended to disregard
                            // the time-part of compared DateTime objects.
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: daySelected,
                          onRangeSelected: onRangeSelected,
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              // Call `setState()` when updating calendar format
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                          // Enable week numbers (disabled by default).
                          daysOfWeekVisible: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: ClipOval(
                              child: Container(
                                height: 5,
                                width: 5,
                                color: AppThemes.lightRedColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            getTranslator("vacations_days"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: ClipOval(
                              child: Container(
                                height: 5,
                                width: 5,
                                color: AppThemes.lightGreenColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            getTranslator("you_ordered_products_on_days"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 250,
                      child: ValueListenableBuilder<List<Event>>(
                        valueListenable: selectedEvents,
                        builder: (context, value, _) {
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ListTile(
                                  onTap: () => print('${value[index]}'),
                                  title: Text('${value[index]}'),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
