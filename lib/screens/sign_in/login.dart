import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/components/constants/extensions/validation_extension.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/login.dart';
import 'package:bluetick/components/services/login_repo.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/screens/sign_up/admin_sign_up.dart';
import 'package:bluetick/components/app_theme.dart';

import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/config/config_sheet.dart';
import '../../components/services/api_models/signup_api_model.dart';
import '../../components/services/providers.dart';

import '../../components/widgets/loading_indicator.dart';
import '../../components/widgets/widgets.dart';

import '../sign_up/invitation_link.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ///Declaring provider that was used
    final notifier = ref.read(logInProvider.notifier);
    final state = ref.watch(logInProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        key: const Key('login_screen'),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child:
                      // state.isLoading
                      //     ? LoadingIndicator()
                      //     :
                      Column(
                    children: [
                      Hero(
                          tag: 'login',
                          child: Image.asset('Assets/BTlogo.png')),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: GeneralTextField(
                          textType: TextInputType.emailAddress,
                          hintText: 'Email Address',
                          validator: context.validateEmailAddress,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GeneralPasswordTextField(
                              validator: context.validatePassword,
                              controller: passwordController,
                              hintText: 'Password',
                              textType: TextInputType.visiblePassword,
                              showPassword: true)),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Forgot Password',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.mainBlue,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.forgotPassword);
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.watch(isLoadingProvider.notifier).state = true;
                          print(ref.read(isLoadingProvider.notifier).state);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 78),
                          child: ref.watch(isLoadingProvider.notifier).state
                              ? Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: mainBlue,
                                    valueColor: AlwaysStoppedAnimation(
                                        mainBlue.withOpacity(0.8)),
                                    backgroundColor: Colors.transparent,
                                  ),
                                )
                              : SignUpButton(
                                  onTapButton: () async {
                                    ///check for isLoading
                                    print(ref
                                        .read(isLoadingProvider.notifier)
                                        .state
                                        .toString());

                                    ///Getting user inputs
                                    ref.read(emailProvider.notifier).state =
                                        emailController.text;
                                    ref.read(passwordProvider.notifier).state =
                                        passwordController.text;

                                    /// In-App-Validation
                                    if (_formKey.currentState!.validate()) {
                                      ///progress bar
                                      ref
                                          .watch(isLoadingProvider.notifier)
                                          .state = true;

                                      Login login = Login(
                                          email: emailController.text,
                                          password: passwordController.text);

                                      var result =
                                          await notifier.loginRequest(login);

                                      if (result.isLeft) {
                                        ref
                                            .read(isLoadingProvider.notifier)
                                            .state = false;
                                        ErrorModel errorMessage = result.left;

                                        showSnackBar(context,
                                            errorMessage.message!['message']);
                                        print(
                                            'Error from login request ${errorMessage.message!['message']}');
                                      } else {
                                        ref
                                            .read(isLoadingProvider.notifier)
                                            .state = false;
                                        Welcome login = result.right;
                                        showSnackBar(
                                            context, login.message['message']);

                                        ///Then navigate to home page
                                      }
                                    }

                                    ///show inputs
                                    print('''
                              This is value that is received from the user 
                             email: ${ref.read(emailProvider.notifier).state} why empty
                              password: ${ref.read(passwordProvider.notifier).state}
                               ''');

                                    ///check for isLoading
                                    print(ref
                                        .read(isLoadingProvider.notifier)
                                        .state
                                        .toString());
                                  },
                                  buttonColor: AppTheme.mainBlue,
                                  text: 'Sign in',
                                  textColor: AppTheme.white,
                                ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 50, bottom: 10),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                'You have a link? ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.offBlack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvitationLink())),
                                child: Text(
                                  'Join a workspace',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.mainBlue,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AdminSignUp(),
                              ),
                            ),
                            child: Text(
                              'Create a new workspace',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.mainBlue,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
