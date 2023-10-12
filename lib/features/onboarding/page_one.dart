import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/utils/constants.dart';
import '../../common/widgets/appstyle.dart';
import '../../common/widgets/height_spacer.dart';
import '../../common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBackgroundDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset('assets/images/todo.png'),
          ),
          const HeightSpacer(size: 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableText(text: 'ToDo with Riverpod', style: appstyle(30, AppConst.kLight, FontWeight.w500)),
              const HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Text(
                  'Welcome!!! Do you want to clear task super fast with ToDo',
                  textAlign: TextAlign.center,
                  style: appstyle(16, AppConst.kLightGrey.withOpacity(0.8), FontWeight.normal),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
