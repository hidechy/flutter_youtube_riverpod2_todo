import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/utils/constants.dart';
import '../../common/widgets/appstyle.dart';
import '../../common/widgets/custom_textfield.dart';
import '../../common/widgets/height_spacer.dart';
import '../../common/widgets/reusable_text.dart';
import '../../common/widgets/width_spacer.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<TodoScreen> with TickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  // late NotificaticationsHelper controller;
  // late var notifyHelper;
  //
  //

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 0), () {
    //   controller = NotificaticationsHelper(ref: ref);
    // });
    //
    // notifyHelper = NotificaticationsHelper(ref: ref);
    //
    // notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions();
    //
    //
  }

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // ref.read(userProvider.notifier).logout(1);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => entrypoint));
                        //
                        //
                      },
                      child: const RotatedBox(quarterTurns: 2, child: Icon(AntDesign.logout)),
                    ),
                    ReusableText(
                      text: 'Task Management',
                      style: appstyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const AddTask(),
                          //   ),
                          // );
                          //
                          //
                        },
                        child: const Center(
                          child: Icon(Icons.add, color: AppConst.kBackgroundDark),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 20),
              CustomTextField(
                hintStyle: appstyle(16, AppConst.kLightGrey, FontWeight.w600),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(AntDesign.search1, color: AppConst.kLightGrey),
                  ),
                ),
                suffixIcon: const Icon(FontAwesome.sliders, color: AppConst.kLightGrey),
                keyboard: TextInputType.phone,
                hintText: 'Search',
                controller: search,
              ),
              const HeightSpacer(size: 15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer(
            builder: (context, ref, child) {
              // ref.watch(todosNotifierProvider.notifier).refresh();
              //
              //

              return ListView(
                children: [
                  const HeightSpacer(size: 25),
                  Row(
                    children: [
                      const Icon(FontAwesome.tasks, size: 20),
                      const WidthSpacer(size: 10),
                      ReusableText(text: 'Today Tasks:', style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                    ],
                  ),
                  const HeightSpacer(size: 25),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const BoxDecoration(
                        color: AppConst.kLightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      controller: tabController,
                      labelPadding: EdgeInsets.zero,
                      labelColor: AppConst.kBlueLight,
                      labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                      unselectedLabelColor: AppConst.kLight,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: AppConst.kWidth * 0.5,
                            child: Center(
                              child: ReusableText(
                                  text: 'Pending', style: appstyle(16, AppConst.kBackgroundDark, FontWeight.bold)),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.h),
                            width: AppConst.kWidth * 0.5,
                            child: ReusableText(
                              text: 'Completed',
                              style: appstyle(16, AppConst.kBackgroundDark, FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const HeightSpacer(size: 20),
                  SizedBox(
                    height: AppConst.kHeight * 0.26,
                    width: AppConst.kWidth,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Container(
                            color: AppConst.kBlueLight,
                            height: AppConst.kHeight * 0.3,
                            // child: const TodoListView(),
                            //
                            //
                            //
                          ),
                          Container(
                            color: AppConst.kBackgroundLight,
                            height: AppConst.kHeight * 0.3,
                            // child: const CompletedListView(),
                            //
                            //
                            //
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const HeightSpacer(size: 20),
                  // const TomorrowList(),
                  // const HeightSpacer(size: 20),
                  // const DayAferTomorrow()
                  //
                  //
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
