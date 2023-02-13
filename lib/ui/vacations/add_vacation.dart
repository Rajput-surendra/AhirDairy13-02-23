import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:table_calendar/table_calendar.dart';

class AddVacation extends StatefulWidget {
  AddVacation({
    this.buttonText,
    this.callback,
  });

  final String? buttonText;
  final ValueChanged? callback;
  @override
  _AddVacationState createState() => _AddVacationState();
}

class _AddVacationState extends State<AddVacation> {
  // late TableCalendar _calendarController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime _fromSelected = DateTime.now();
  DateTime? _toSelected;
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'may',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: Container(
        color: isDark
            ? AppThemes.DarkModeColor
            : AppThemes.lightWhiteBackGroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              color:
                  isDark ? AppThemes.smoothBlack : AppThemes.lightTextGreyColor,
            ),
            Positioned(
              right: 25,
              top: MediaQuery.of(context).size.height * 0.3,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppThemes.lightButtonBackGroundColor,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppThemes.lightWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: .60,
              minChildSize: .60,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: isDark
                          ? AppThemes.DarkModeColor
                          : AppThemes.lightWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      )),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Column(
//                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getTranslator("from") +
                                                "            ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppThemes
                                                      .lightTextGreyColor,
                                                  fontSize: 13,
                                                ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '${_fromSelected.day} ${months[_fromSelected.month - 1].substring(0, 3)} ${_fromSelected.year}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 2,
                                    color: AppThemes.lightGreyBackGroundColor,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            getTranslator("to"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppThemes
                                                      .lightTextGreyColor,
                                                  fontSize: 13,
                                                ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            _toSelected != null
                                                ? '${_toSelected!.day} ${months[_toSelected!.month - 1].substring(0, 3)} ${_toSelected!.year}'
                                                : '---',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Container(
                                child: TableCalendar(
                                  firstDay: DateTime.now(),
                                  lastDay: DateTime.parse('2024-12-24'),
                                  focusedDay: _focusedDay,
                                  calendarFormat: _calendarFormat,
                                  selectedDayPredicate: (day) {
                                    // Use `selectedDayPredicate` to determine which day is currently selected.
                                    // If this returns true, then `day` will be marked as selected.

                                    // Using `isSameDay` is recommended to disregard
                                    // the time-part of compared DateTime objects.
                                    return isSameDay(_selectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDay, selectedDay)) {
                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDay = selectedDay;
                                        _focusedDay = focusedDay;
                                        _toSelected = selectedDay;
                                      });
                                    }
                                  },
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
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              Center(
                                child: CommonRaisedButton(
                                  title: widget.buttonText ??
                                      getTranslator("add"),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                      vertical: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
