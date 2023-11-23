import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynisit/features/user_auth/presentation/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/notification_services.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynisit/features/user_auth/presentation/widgets/theme.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _addDateBar(),
            const SizedBox(
              height: 25,
            ),
            _bottomAppBar(),
          ],
        ),
      ),
    );
  }

  _bottomAppBar() {
    final links = [
      {"title": "University Website", "url": "http://www.ku.ac.th"},
      {"title": "Student Information System", "url": "http://regis.ku.ac.th"},
      {"title": "Special Program Student Registration System", "url": "http://sp-regis.ku.ac.th"},
      {"title": "History Record And Attached New Student Survey", "url": "http://student.ku.ac.th/newregis/"},
      {"title": "Teaching Evaluation System", "url": "http://eassess.ku.ac.th"},
      {"title": "eduFarm - KU Learning Farm", "url": "http://lms.ku.ac.th"},
      {"title": "KU Webmail", "url": "http://webmail.ku.ac.th"},
      {"title": "Password Recovery System (Account Nontri)", "url": "http://accounts.ku.ac.th"},
      {"title": "Accounting Services KU-Google", "url": "http://accounts.ku.ac.th/kgg/"},
      {"title": "Online Reservation Service For Computer Use, Kits-room", "url": "http://kits.ku.ac.th/booking"},
    ];

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Link",
            style: headingStyle,
          ),
          SizedBox(height: 15),
          // Replace Card with a custom Container
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFB2BB1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: links.length,
              separatorBuilder: (context, index) => Divider(), // Add spacing between items
              itemBuilder: (context, index) {
                final title = links[index]["title"] ?? "";
                final url = links[index]["url"] ?? "";
                return buildQuickLink(title, url);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget buildQuickLink(String title, String url) {
    final brightness = Theme.of(context).brightness;

    return Container(
      color: brightness == Brightness.dark ? Colors.black : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ปรับความห่างที่นี่
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: brightness == Brightness.dark ? Colors.white : Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(
            url,
            style: TextStyle(
              color: brightness == Brightness.dark ? Colors.grey : Colors.grey,
            ),
          ),
          onTap: () async {
            final link = Uri.parse(url);
            if (await canLaunch(link.toString())) {
              await launch(link.toString());
            } else {
              throw 'Could not launch $link';
            }
          },
        ),
      ),
    );
  }


  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: headingStyle,
          ),
          SizedBox(height: 15),
          DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryClr,
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            onDateChange: (date) {
              setState(() {
                // ทำอะไรสักอย่างเมื่อเปลี่ยนวันที่ (ถ้าต้องการ)
              });
            },
          ),
        ],
      ),
    );
  }




  _appBar(){
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap:(){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title:"Theme Changed",
              body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme"
          );

          //notifyHelper.scheduledNotfication();
        },
        child: Icon(Get.isDarkMode ?Icons.wb_sunny_outlined:Icons.nightlight_round,
            size: 20,
            color:Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
              "images/Nisit_6330202605.jpg"
          ),
        ),
        SizedBox(width: 20,),
      ],
    );
  }
}
