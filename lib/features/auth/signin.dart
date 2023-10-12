import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_debstech_riverpod2_todo_app/features/auth/otp_verification.dart';

import '../../common/utils/constants.dart';
import '../../common/widgets/appstyle.dart';
import '../../common/widgets/custom_outline_btn.dart';
import '../../common/widgets/custom_textfield.dart';
import '../../common/widgets/height_spacer.dart';
import '../../common/widgets/reusable_text.dart';

class LoginPod extends ConsumerStatefulWidget {
  const LoginPod({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPodState();
}

class _LoginPodState extends ConsumerState<LoginPod> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController countryCode = TextEditingController();

  void sendCodeToUser() {
    // if (phone.text.isEmpty) {
    //   return showAlertDialog(context: context, message: "Please enter  your number");
    // } else if (phone.text.length < 8) {
    //   return showAlertDialog(context: context, message: "Phone number too short");
    // }
    //
    // ref.read(authControllerProvider).sendSmsCode(
    //       context: context,
    //       phone: '+${ref.read(countryCodeProvider).phoneCode}${phone.text}',
    //     );
  }

  ///
  @override
  Widget build(BuildContext context) {
    final country = Country(
      phoneCode: '',
      countryCode: 'JP',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'JAPAN',
      example: 'JAPAN',
      displayName: 'JAPAN',
      displayNameNoCountryCode: 'JP',
      e164Key: '',
    );

    // var country = ref.watch(countryCodeProvider);
    //
    //

    return Scaffold(
      backgroundColor: AppConst.kBackgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset('assets/images/todo.png', width: 300),
              ),
              const HeightSpacer(size: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: 'Please enter your number to get verification code',
                  style: appstyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 20),
              Center(
                child: CustomTextField(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.kGreyDark.withOpacity(0.4),
                            textStyle: const TextStyle(color: Colors.white),
                            inputDecoration: InputDecoration(
                              fillColor: AppConst.kBlueLight.withOpacity(0.2),
                              filled: true,
                            ),
                            bottomSheetHeight: AppConst.kHeight * 0.6,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          context: context,
                          onSelect: (code) {},
//                          onSelect: (code) => ref.read(countryCodeProvider.notifier).setCountry(code),
                        );
                      },
                      child: ReusableText(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        style: appstyle(18, AppConst.kBackgroundDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboard: TextInputType.phone,
                  hintText: 'Enter your phone number',
                  controller: phone,
                  hintStyle: appstyle(16, AppConst.kBackgroundDark, FontWeight.w600),
                ),
              ),
              const HeightSpacer(size: 20),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomOutlineBtn(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerification(smsCodeId: '', phone: ''),
                      ),
                    );
                  },

                  // onTap: sendCodeToUser,
                  //
                  //

                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.07,
                  color2: AppConst.kLight,
                  text: 'Send Code',
                  color: AppConst.kBackgroundDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
