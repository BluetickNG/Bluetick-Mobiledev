import 'package:bluetick/components/models/chatMessage_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../components/app_theme.dart';
import '../home/co_wokers/co_workers_call_screen.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    const cdp = 'Assets/chatdp.png';

    const gcbg = 'Assets/groupchatbg.png';

    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(gcbg),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: AppTheme.offBlack),
                backgroundColor: AppTheme.offWhite,
                elevation: 0.0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Image(
                        image: AssetImage(cdp),
                        // height: kToolbarHeight,
                        // width: 48,
                      ),
                    ),
                    SizedBox(
                      width: 20, //65,
                    ),
                    Text(
                      'John Mac',
                      style: GoogleFonts.montserrat(
                          color: AppTheme.offBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                centerTitle: false,
                actions: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(

                                  ///Ringing
                                  builder: (_) => CoWorkersCallScreen()));
                        },
                        icon: Icon(
                          Icons.call,
                          color: AppTheme.offBlack,
                        ),
                      )),
                ],
              ),
              body: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 20,
                      color: AppTheme.blue2,
                      child: Center(
                        child: Center(
                            child: Text(
                          'Product Manager',
                          style: GoogleFonts.montserrat(
                              color: AppTheme.offBlack,
                              fontStyle: FontStyle.italic),
                        )),
                      )),
                  Expanded(
                      child: GroupedListView<CHATMessage, DateTime>(
                    elements: chatmsg,
                    groupBy: (chatmsg) => DateTime(2022),
                    padding: EdgeInsets.all(16),
                    groupHeaderBuilder: (CHATMessage chatmsg) => SizedBox(),
                    itemBuilder: (context, CHATMessage chatmsg) => Align(
                      alignment: chatmsg.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: chatmsg.isSentByMe
                            ? const EdgeInsets.only(bottom: 8.0, left: 140)
                            : const EdgeInsets.only(bottom: 8.0, right: 140),
                        child: chatmsg.messageTypeAudio
                            ? Container(
                                decoration: BoxDecoration(
                                    color: chatmsg.isSentByMe
                                        ? AppTheme.blue2
                                        : AppTheme.offWhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: chatmsg.isSentByMe
                                        ? Row(
                                            children: [
                                              ImageIcon(AssetImage(
                                                  'Assets/icons/play.png')),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Stack(
                                                      clipBehavior: Clip.none,
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 2,
                                                          color: AppTheme
                                                              .blackerBlack,
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          child: Container(
                                                            height: 9,
                                                            width: 9,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .blackerBlack,
                                                                shape: BoxShape
                                                                    .circle),
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              ),
                                              ImageIcon(AssetImage(
                                                  'Assets/icons/del.png')),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              ImageIcon(AssetImage(
                                                  'Assets/icons/play.png')),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Stack(
                                                      clipBehavior: Clip.none,
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 2,
                                                          color: AppTheme
                                                              .blackerBlack,
                                                        ),
                                                        Positioned(
                                                          left: 0,
                                                          child: Container(
                                                            height: 9,
                                                            width: 9,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .blackerBlack,
                                                                shape: BoxShape
                                                                    .circle),
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          )))
                            : Container(
                                decoration: BoxDecoration(
                                    color: chatmsg.isSentByMe
                                        ? AppTheme.blue2
                                        : AppTheme.offWhite,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: chatmsg.media != null
                                        ? Column(
                                            children: [
                                              Text(chatmsg.text!),
                                              Image.asset(chatmsg.media!)
                                            ],
                                          )
                                        : Column(
                                            children: [Text(chatmsg.text!)],
                                          ))),
                      ),
                    ),
                  )),
                  Container(
                    width: double.infinity,
                    height: 44,
                    color: AppTheme.offWhite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('Assets/icons/file.png'),
                            color: AppTheme.blackerBlack,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          ImageIcon(
                            AssetImage('Assets/icons/face.png'),
                            color: AppTheme.blackerBlack,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.darkBlue,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: TextField(
                                  expands: true,
                                  maxLines: null,
                                  // textAlignVertical: TextAlignVertical.top,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style:
                                      const TextStyle(color: AppTheme.offWhite),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      left: 8,
                                    ),
                                    hintText: 'send message',
                                    hintStyle: GoogleFonts.montserrat(
                                      color: AppTheme.offWhite,
                                    ),
                                  ),
                                )),
                          )),
                          SizedBox(
                            width: 6,
                          ),
                          ImageIcon(
                            AssetImage('Assets/icons/send.png'),
                            color: AppTheme.blackerBlack,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          ImageIcon(
                            AssetImage('Assets/icons/mic.png'),
                            color: AppTheme.blackerBlack,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
