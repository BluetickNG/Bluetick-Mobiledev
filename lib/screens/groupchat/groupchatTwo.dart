import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';
import '../home/sub_home/addagroup.dart';
import 'groupchatTwo_TabOne.dart';
import 'groupchatTwo_TabTwo.dart';

class GroupChat extends StatelessWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //const img = "assets/recent-passport.png";
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppTheme.darkBlue,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: AppTheme.blue2,
                expandedHeight: 177,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AddGroup()));
                        },
                        child: Image.asset("Assets/icons/add group.png",
                            alignment: Alignment.topRight),
                      ),
                      const SizedBox(height: 12),
                      Image.asset("Assets/icons/edit.png",
                          alignment: Alignment.bottomRight),
                    ],
                  ),
                ],
                flexibleSpace: Container(
                  color: AppTheme.blue2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 2),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('Assets/icons/group pix.png'),
                        radius: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Design group 2",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.blackerBlack),
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.blackerBlack),
                            ),
                          ),
                        ],
                      ),
                      //const SizedBox(width: 150),
                      //Image.asset("assets/images/Vector.png", alignment: Alignment.topRight , ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text("Members",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black, fontSize: 13),
                            ))),
                    Tab(
                        child: Text("Attachments",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black, fontSize: 13),
                            ))),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              MemberTab(),
              AttachmentTab(),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: const HomeTab(),
    ));
  }
}
