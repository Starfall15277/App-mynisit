import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/notification_services.dart';
import '../services/theme_services.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final NotifyHelper notifyHelper = NotifyHelper();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<Color> dayColors = [
    Colors.pink.shade200,
    Colors.green.shade200,
    Colors.deepOrange.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200,
  ];

  late List<Map<String, dynamic>> scheduleData;

  @override
  void initState() {
    super.initState();
    scheduleData = [];
    fetchScheduleData();
  }

  Future<void> fetchScheduleData() async {
    try {
      final querySnapshot = await firestore.collection('schedule').get();
      if (querySnapshot.docs.isNotEmpty) {
        scheduleData = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
        setState(() {}); // Update the UI
      } else {
        scheduleData = [];
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode ? "Activated Light Theme" : "Activated Dark Theme",
            );
          },
          child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("images/Nisit_6330202605.jpg"),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        itemCount: scheduleData.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> schedule = scheduleData[index];
          String day = schedule['day'];
          Color dayColor = dayColors[index]; // เราคืนค่าสีของวันจากตำแหน่ง index
          String time = schedule['time'];
          String courseCode = schedule['courseCode'];
          String courseName = schedule['courseName'];
          String instructor = schedule['instructor'];
          String room = schedule['room'];
          String groupType = schedule['groupType'];
          double latitude = double.parse(schedule['latitude'].toString());
          double longitude = double.parse(schedule['longitude'].toString());

          return buildScheduleItem(
            isDarkTheme: isDarkTheme,
            day: day,
            time: time,
            courseCode: courseCode,
            courseName: courseName,
            instructor: instructor,
            room: room,
            groupType: groupType,
            dayColor: dayColor,
            latitude: latitude,
            longitude: longitude,
          );
        },
      ),
    );
  }

  Widget buildScheduleItem({
    required bool isDarkTheme,
    required String day,
    required String time,
    required String courseCode,
    required String courseName,
    required String instructor,
    required String room,
    required String groupType,
    required Color dayColor,
    required double latitude,
    required double longitude,
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.black38 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: dayColor,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: dayColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Colors.white,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkTheme ? Colors.white : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            courseCode,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          Text(
            courseName,
            style: TextStyle(
              fontSize: 12,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          Text(
            instructor,
            style: TextStyle(
              fontSize: 12,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: isDarkTheme ? Colors.white : Colors.black,
            thickness: 1,
          ),
          Text(
            room,
            style: TextStyle(
              fontSize: 14,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          Text(
            groupType,
            style: TextStyle(
              fontSize: 12,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  launchMap(latitude, longitude);
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                label: Text('MAP'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB2BB1E)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void launchMap(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the Map';
    }
  }
}
