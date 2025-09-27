import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay=DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: AppText(
                  text: "Manage your Time",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
          
              /// Calendar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0x66FFFFFF),
                      Color(0x1AFFFFFF),
                    ],
                    stops: [0.4, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TableCalendar(
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2100),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.lightBlueAccent),
                  ),

                  calendarStyle: CalendarStyle(
                    // 👇 Default text colors
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    weekendTextStyle: const TextStyle(color: Colors.lightBlueAccent),

                    // 👇 Today ke liye condition lagayi
                    todayTextStyle: TextStyle(
                      color: (_focusedDay.weekday == DateTime.saturday ||
                          _focusedDay.weekday == DateTime.sunday)
                          ? AppColors.grey2
                          : AppColors.grey2,
                    ),
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: (_focusedDay.weekday == DateTime.saturday ||
                            _focusedDay.weekday == DateTime.sunday)
                            ? AppColors.grey2
                            : AppColors.grey2,
                      ),
                    ),

                    // 👇 Jab select karein
                    selectedDecoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blue3,
                      border: Border.all(
                        color:isSameDay(_selectedDay, DateTime.now())?
                        AppColors.white1
                            : Colors.transparent,
                      ),
                    ),
                    selectedTextStyle: const TextStyle(color: Colors.white),
                  ),



                  // calendarStyle: CalendarStyle(
                  //   todayTextStyle: TextStyle(
                  //     color: _selectedDay== DateTime.now()?AppColors.white1:AppColors.blue4
                  //
                  //   ),
                  //   todayDecoration: BoxDecoration(
                  //     // color: Colors.blueAccent,
                  //     shape: BoxShape.circle,
                  //     border: Border.fromBorderSide(
                  //       BorderSide(color: AppColors.blue4,)
                  //     ),
                  //   ),
                  //   selectedDecoration: BoxDecoration(
                  //     color: Colors.lightBlue,
                  //     shape: BoxShape.circle,
                  //     border: Border.fromBorderSide(
                  //       BorderSide(
                  //         color: AppColors.white1
                  //       )
                  //     )
                  //   ),
                  //   defaultTextStyle: TextStyle(color: Colors.white),
                  //   weekendTextStyle: TextStyle(color: Colors.lightBlueAccent),
                  //   outsideDaysVisible: false,
                  // ),
                ),
              ),
          
              /// Bottom container
              Container(
                width: 340,
                height: 160,
                margin: const EdgeInsets.symmetric(vertical: 40,horizontal: 9),
                padding: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // AppText(
                    //   text: _selectedDay != null
                    //       ? "Selected: ${_selectedDay!.day}-${_selectedDay!.month}-${_selectedDay!.year}"
                    //       : "No date selected",
                    //   fontSize: 16,
                    //   color: AppColors.black1,
                    //   fontWeight: FontWeight.w400,
                    // ),
                    AppText(
                      text: "Set task for ${DateFormat('d - MMM - yyy').format(_selectedDay!)}",
                        fontSize: 16,
                        color: AppColors.black1,
                        fontWeight: FontWeight.w400,
                    ),
                    AppTextForm(
                      hintText: "task",
                      fillColor: AppColors.blue2,
                      textColor: AppColors.white1,
                      cursorColor: AppColors.blue4,
                    ),
                    ContainerButton(
                        onTap: (){},
                        bgColor: AppColors.blue4,
                        text: "submit",
                      width: 120,
                    )
                  ],
                ),
          
              ),
            ],
          ),
        ),
      ),
    );
  }
}
