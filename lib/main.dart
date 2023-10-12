import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/models/user.dart';
import 'common/utils/constants.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/todo/todo_screen.dart';
import 'firebase_options.dart';
import 'providers/user_provider.dart';

Widget entrypoint = const OnboardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch();

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(brightness: Brightness.dark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();

    final users = ref.read(userProvider);

    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Todo App with Riverpod',
                theme: ThemeData(
                  colorScheme: lightColorScheme ?? defaultLightColorScheme,
                  useMaterial3: true,
                ),
                darkTheme: ThemeData(
                  colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                  scaffoldBackgroundColor: AppConst.kBackgroundDark,
                  useMaterial3: true,
                ),
                themeMode: ThemeMode.dark,
                // home: ref.watch(userProvider.notifier).defaultEntry(users),
                //
                //
                //

                home: const TodoScreen(),

                // onGenerateRoute: Routes.onGenerateRoute,
                //
                //
                //
              );
            },
          );
        });
  }
}
