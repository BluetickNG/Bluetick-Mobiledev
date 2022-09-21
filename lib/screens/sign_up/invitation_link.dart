import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/providers/signupProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';
import 'staff_sign_up.dart';

final loadProvider = StateProvider((ref) => false);

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
    Map<String, String>? invMap;
    final isLoading = ref.watch(loadProvider);
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
            isLoading
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 33),
                    height: 35,
                    width: 35,
                    child: const CircularProgressIndicator())
                : SignUpButton(
                    textColor: AppTheme.mainBlue,
                    text: 'Continue',
                    buttonColor: AppTheme.blue2,
                    onTapButton: () {
                      invMap = {
                        'email': emailcontroller.text,
                        'link': invitationcontroller.text
                      };
                      final invDataT = ref.watch(invitationProvider(invMap!));

                      invDataT.when(loading: () {
                        ref.read(loadProvider.notifier).state = true;
                      }, data: (invSSdata) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(arguments: invSSdata),
                              builder: (_) {
                                return StaffSignUp();
                              },
                            ));
                        //or ref.watch value
                      }, error: (Object error, StackTrace? stackTrace) {
                        return SnackBar(
                          backgroundColor: AppTheme.mainBlue,
                          duration: Duration(seconds: 4),
                          content: Text('Failed'),
                        );
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
