import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/get_staff_response.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bluetick/components/config/config_sheet.dart';

import '../../../components/models/profile_model.dart';

class PersonalProfile extends ConsumerStatefulWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  ConsumerState<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends ConsumerState<PersonalProfile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //print('width is $screenWidth');

    String about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    return Scaffold(
        backgroundColor: darkBlue,
        //  bottomNavigationBar: homeBottomNavigationBar(),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(milliseconds: 1000), () {
              ref.refresh(getStaffProvider);
            });
          },
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            Stack(children: [
              Positioned(
                  child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(gradient: linearWhiteGradient),
                width: 428,
                height: 244,
              )),
              Positioned(
                  child: IconButton(
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                      // => Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => const HomeTab())),
                      icon: const Icon(Icons.arrow_back))),
              Positioned(
                right: 65,
                bottom: 102,
                child: IconButton(
                    color: mainBlue,
                    iconSize: 18.75,
                    onPressed: () => null,
                    icon: const ImageIcon(
                        AssetImage('Assets/icons/ant-design.png'))),
              ),
              Positioned(
                  left: 2,
                  right: 2,
                  top: 30,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            AsyncValue<Either<ErrorModel, GetStaffResponse>>
                                adminDp = ref.watch(getStaffProvider);
                            return adminDp.when(
                              data:
                                  (Either<ErrorModel, GetStaffResponse> data) {
                                if (data.isRight) {
                                  return CachedNetworkImage(
                                    imageUrl: data
                                        .right.allStaffDetails![0].profileimg!,
                                    cacheManager:
                                        PersonalProfile.customCacheManager,
                                    key: UniqueKey(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    fit: BoxFit.contain,
                                    imageBuilder: (context, imageProvider) {
                                      return CircleAvatar(
                                        backgroundImage: imageProvider,
                                        radius: 42,
                                      );
                                    },
                                  );
                                } else {
                                  return Icon(Icons.error);
                                }
                              },
                              error: (Object error, StackTrace? stackTrace) =>
                                  Icon(Icons.error),
                              loading: () => CircularProgressIndicator(
                                strokeWidth: 2,
                                color: mainBlue,
                                valueColor: AlwaysStoppedAnimation(
                                    mainBlue.withOpacity(0.8)),
                                backgroundColor: Colors.transparent,
                              ),
                            );
                          },
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            child: Consumer(
                              builder: (BuildContext context, WidgetRef ref,
                                  Widget? child) {
                                AsyncValue<Either<ErrorModel, GetStaffResponse>>
                                    adminName = ref.watch(getStaffProvider);
                                return adminName.when(
                                  data: (Either<ErrorModel, GetStaffResponse>
                                      data) {
                                    if (data.isRight) {
                                      return Text(
                                          data.right.allStaffDetails![0]
                                              .fullname!,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500));
                                    } else {
                                      return Text(
                                          'you don\'t have internet connection',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12));
                                    }
                                  },
                                  error:
                                      (Object error, StackTrace? stackTrace) =>
                                          Text(
                                    'X',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  loading: () => CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: mainBlue,
                                    valueColor: AlwaysStoppedAnimation(
                                        mainBlue.withOpacity(0.8)),
                                    backgroundColor: Colors.transparent,
                                  ),
                                );
                              },
                            )),
                        SizedBox(
                            width: 250,
                            child: Text(
                              about,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ))
                      ])),
              Positioned(
                  right: screenWidth / 2.7692308,
                  bottom: 147,
                  child: IconButton(
                    icon: const ImageIcon(AssetImage('Assets/icons/add.png')),
                    color: mainBlue,
                    iconSize: 21,
                    onPressed: () => null,
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 300, bottom: 10),
              child: Text(
                'Settings',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
                //width: 428,
                height: 385,
                child: ListView.separated(
                    itemCount: settingsItem.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 2, color: mainBlue),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final title = settingsName[index];
                      final bool logOutColor = title == 'Log Out';

                      nvgtion() {
                        if (title == 'Notification') {
                          return Navigator.pushNamed(
                            context,
                            AppRouter.notificationSettings,
                          );
                        } else if (title == 'Help Center') {
                          return Navigator.pushNamed(
                            context,
                            AppRouter.helpCenter,
                          );
                        } else if (title == 'Log Out') {
                          return Navigator.pushNamed(
                            context,
                            AppRouter.login,
                          );
                        } else
                          () {};
                      }

                      return Container(
                          color: logOutColor ? warningRed : blue2,
                          height: 52,
                          child: ListTile(
                            onTap: () => nvgtion(),
                            textColor: logOutColor ? offWhite : mainBlue,
                            leading: ImageIcon(
                              AssetImage(settingsItem[title]!),
                              color: logOutColor ? offWhite : darkBlue,
                            ),
                            title: Text(
                              title,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ));
                    }))
          ]))),
        ));
  }
}
