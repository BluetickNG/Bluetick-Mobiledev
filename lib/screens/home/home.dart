import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/home/sub_home/staff_profile_admin.dart';
import 'package:bluetick/screens/home/todo_screen.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../components/app_theme.dart';
import '../../components/config/config_sheet.dart';
import 'home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar:
          // GeneralAppBar(),
          AppBar(
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   icon: const ImageIcon(AssetImage('Assets/images/Group 7.png')),
        //   onPressed: () => null,
        //   //     Navigator.push(
        //   //   context,
        //   //   MaterialPageRoute(
        //   //     builder: (_) => Drawer(child: const HomeDrawer()),
        //   //   ),
        //   // ),
        // ),
        backgroundColor: AppTheme.mainBlue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          'BlueTick',
          style: GoogleFonts.montserrat(
            fontSize: 23.97,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppTheme.white,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TodoScreen(),
              ),
            ),
            child: Container(
              height: 45, //31.95,
              width: 45, //31.96,
              margin: EdgeInsets.only(right: 11),
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     'hello',
                  //   ),
                  //   fit: BoxFit.contain,
                  // ),
                  ),
              child: Image.asset(
                'Assets/sample_pic.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.17,
            ),
            checkInHeader(context),
            searchStaff(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  //todo fix this page
                  AppRouter.chatScreen,
                  // AppRouter.personalProfile,
                  //     MaterialPageRoute(builder: (_) => StaffProfileAdmin()),
                );
              },
              child: onlineStaff(
                name: 'John Mac',
                time: "8:11",
              ),
            ),
            onlineStaff(
              name: 'Sandra Who',
              time: "11:00",
            ),
            onlineStaff(
              name: 'Johnson Grace',
              time: "5:00",
            ),
            onlineStaff(
              name: 'Edoki Chuks',
              time: "1:00",
            ),
            offlineStaff(
              name: 'John Mac',
              time: "8:11",
            ),
            offlineStaff(
              name: 'Sandra Who',
              time: "11:00",
            ),
            offlineStaff(
              name: 'Johnson Grace',
              time: "5:00",
            ),
            offlineStaff(
              name: 'Edoki Chuks',
              time: "1:00",
            ),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }

  Container searchStaff() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      height: 42,
      color: AppTheme.mainBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              'Search',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppTheme.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Search for a staff',
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blue2,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                fillColor: AppTheme.offWhite,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: AppTheme.mainBlue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: AppTheme.mainBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Image.asset(
                'Assets/search_icon.png',
                width: 18.97,
                height: 18.97,
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container checkInHeader(BuildContext context) {
    return Container(
      height: 164.97,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.mainBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            spreadRadius: 0,
            blurRadius: 16,
            inset: false,
            color: Color.fromRGBO(22, 40, 80, 0.4),
          ),
          BoxShadow(
            offset: Offset(12, 12),
            spreadRadius: 0,
            blurRadius: 12,
            inset: true,
            color: Color.fromRGBO(9, 16, 32, 0.6),
          ),
          BoxShadow(
            offset: Offset(-12, -12),
            spreadRadius: 0,
            blurRadius: 12,
            inset: true,
            color: Color.fromRGBO(150, 167, 208, 0.6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12/06/2022',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Tuesday',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '09:15am',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Clock in:',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '05/21',
                style: GoogleFonts.montserrat(
                  fontSize: ResponsiveValue(context,
                      defaultValue: 40.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: MOBILE,
                          value: 50.0,
                        ),
                        Condition.largerThan(name: TABLET, value: 60.0),
                      ]).value,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container onlineStaff({required String name, required String time}) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 51.97,
      color: AppTheme.mainBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  //top: 2, bottom: 2,
                  right: 25.96,
                ),
                child: Container(
                  height: 31.95,
                  width: 31.96,
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //     //todo Change is image
                      //     'Assets/saasdklmple_pic.png',
                      //   ),
                      //   fit: BoxFit.contain,
                      // ),
                      ),
                  child: Image.asset(
                    'Assets/sample_pic.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Online',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Clock in ${time}am',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container offlineStaff({required String name, required String time}) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 51.97,
      color: AppTheme.mainBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 25.96,
            ),
            child: Container(
              height: 31.95,
              width: 31.96,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     'Assets/sample_pic.png',
                  //   ),
                  //   fit: BoxFit.contain,
                  // ),
                  ),
              child: Image.asset(
                'Assets/sample_pic.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Offline',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar GeneralAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 68.11],
                colors: [linearBlue1, darkBlue])),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const ImageIcon(AssetImage('Assets/images/Group 7.png')),
        onPressed: () => null,
      ),
      title: const Text(
        'BlueTick',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.96),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'Assets/images/Ellipse 20.png',
              fit: BoxFit.contain,
            ),
          ),
          //     const CircleAvatar(
          //   backgroundImage: AssetImage(''),
          // ),
        )
      ],
    );
  }
}
