import 'dart:io';

import 'package:bluetick/components/services/api_models/signup_api_model.dart';
import 'package:bluetick/components/services/invsignup_services.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_up/invitation_link.dart';
import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/providers/signupProvider.dart';
import '../../components/widgets/widgets.dart';
import '../home/co_wokers/co_wokers_home_tab.dart';

class StaffSignUp extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return StaffSignUpState();
  }
}

class StaffSignUpState extends ConsumerState<StaffSignUp> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    fullnameController.dispose();
    roleController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signDataT = ref.watch(signUpProvider({
      'fullname': fullnameController.text,
      'role': roleController.text,
      'password': confirmPasswordController.text
    }));
    final invData =
        ModalRoute.of(context)!.settings.arguments as InvSignUpServices;
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ${invData.link}',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${invData.email}',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 21.0,
                ),
                child: Divider(color: AppTheme.blue2, thickness: 2),
              ),
              Text(
                'You are almost done,\nset up your info',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              GeneralTextField(
                hintText: 'Full Name',
                textType: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralTextField(hintText: 'Role', textType: TextInputType.name),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Create Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Confirm Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
                controller: confirmPasswordController,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpButton(
                textColor: AppTheme.mainBlue,
                text: 'Confirm',
                buttonColor: AppTheme.blue2,
                onTapButton: () {
                  signDataT.when(
                      data: (signUpData) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CoWorkerHomeTab(),));},
                            error: (Object error, StackTrace? stacktrace) {},
                            loading: () => CircularProgressIndicator());
                      }
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
