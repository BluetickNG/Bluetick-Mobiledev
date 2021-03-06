import 'package:bluetick/screens/home/home.dart';
import 'package:bluetick/screens/home/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/app_theme.dart';
import '../../chatScreen/chatScreen.dart';
import '../notifications.dart';

import '../sub_home/messagelist.dart';
import 'staffhomepage.dart';
import 'co_workers.dart';
import 'co_workers_drawer.dart';

class CoWorkerHomeTab extends StatefulWidget {
  const CoWorkerHomeTab({Key? key}) : super(key: key);

  @override
  State<CoWorkerHomeTab> createState() => _CoWorkerHomeTabState();
}

class _CoWorkerHomeTabState extends State<CoWorkerHomeTab> {
  final pageController = PageController();
  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          StaffHomePage(),
          Notifications(),
          Workers(),
          Chatscreen(),
        ],
        onPageChanged: onPageClicked,
        controller: pageController,
      ),
      // drawer: CoWorkersDrawer(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff244BA9),
              Color(0xff162850),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: 70,
        child: CupertinoTabBar(
          currentIndex: initialPage,
          backgroundColor:
              const Color(0xff162850).withOpacity(0.1), //Color(0xff244BA9),
          // Color(0xff162850),

          onTap: onClicked,

          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'Assets/home.png',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppTheme.offWhite,
                        letterSpacing: 0.8),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'Assets/notification.png',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Notification',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.offWhite,
                      letterSpacing: 0.8,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'Assets/icons/coworker.png',
                    scale: 0.8,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Co-Workers',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppTheme.offWhite,
                        letterSpacing: 0.8),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon:
                  // Image.asset('name'),
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('Assets/message.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Messages',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppTheme.offWhite,
                        letterSpacing: 0.8),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onClicked(int value) {
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  void onPageClicked(int value) {
    setState(() {
      initialPage = value;
    });
  }
}
