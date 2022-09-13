import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/providers/signupProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';
import 'staff_sign_up.dart';

class InvitationLink extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return InvitationLinkState();
  }
}

class InvitationLinkState extends ConsumerState<StaffSignUp> {
  final TextEditingController invitationcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  void dispose() {
    invitationcontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final invData = {
      'link': invitationcontroller.text,
      'email': emailcontroller.text
    };
    final invDataT = ref.watch(invitationProvider(invData));

    final invitationtextfield = GeneralTextField(
      hintText: 'Invitation link',
      textType: TextInputType.name,
      controller: invitationcontroller,
    );
    final emailtextfield = GeneralTextField(
      hintText: 'Email Address',
      textType: TextInputType.emailAddress,
      controller: emailcontroller,
    );

    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            invitationtextfield,
            const SizedBox(
              height: 25,
            ),
            emailtextfield,
            SizedBox(
              height: 62,
            ),
            RichText(
                text: TextSpan(
                    text: 'By clicking “Continue”, I agree to the',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.offWhite,
                    ),
                    children: <TextSpan>[
                  TextSpan(
                    text: ' Terms of Service',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.blue2,
                    ),
                  ),
                  TextSpan(
                    text: ' and',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.offWhite,
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy.',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.blue2,
                    ),
                  )
                ])),
            SignUpButton(
              textColor: AppTheme.mainBlue,
              text: 'Continue',
              buttonColor: AppTheme.blue2,
              onTapButton: () {
                invDataT.when(
                    loading: () => CircularProgressIndicator(),
                    data: (invSSdata) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(settings: RouteSettings(arguments: invSSdata),
                            builder: (_) {
                        return StaffSignUp();
                      },
                          ));
                       //or ref.watch value
                    },
                    error: (Object error, StackTrace? stackTrace) {
                      return SnackBar(content: Text('Failed'),);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
