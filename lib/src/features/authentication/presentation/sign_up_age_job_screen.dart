import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widget/banner_widget.dart';
import 'package:sarang_app/src/common_widget/custom_button_widget.dart';
import 'package:sarang_app/src/common_widget/custom_textfield_widget.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';
  const SignUpAgeJobScreen(
      {super.key,
      required this.fullname,
      required this.email,
      required this.password});

  final String fullname;
  final String email;
  final String password;

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    jobController.clear();
    ageController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 50.0,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const BannerWidget(),
            CustomTextFieldWidget(
              labelName: 'Occupation',
              hintext: 'Write your occupation',
              controller: jobController,
            ),
            CustomTextFieldWidget(
              labelName: 'Age',
              hintext: 'Write your age',
              controller: ageController,
            ),
            SizedBox(
              height: 117.0,
            ),
            CustomButtonWidget(
                title: 'Continue Sign Up',
                onTap: () {
                  UserAccount userAccount = UserAccount(
                      fullname: widget.fullname,
                      email: widget.email,
                      password: widget.password,
                      occupation: jobController.text,
                      age: ageController.text);
                  Navigator.pushNamed(
                    context,
                    SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount,
                  );
                })
          ],
        )),
      ),
    );
  }
}
