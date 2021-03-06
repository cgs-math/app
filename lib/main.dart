import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:maths_club/screens/auth/landing_page.dart';
import 'package:maths_club/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// View documentation here: https://github.com/cgs-math/app#adaptive-theme.

void main() async {
  // Initialises Firebase.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MathsClubApp());
}

/// This is the root Maths Club Widget.
///
/// The whole app is wrapped with an [AdaptiveTheme] to provide easy light and
/// dark mode theming, based on the [AppThemes] class.
///
/// More documentation can be viewed [here](https://github.com/cgs-math/app#adaptive-theme)
class MathsClubApp extends StatelessWidget {
  const MathsClubApp({Key? key}) : super(key: key);

  // Creates the app theming using the Adaptive Theme package.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemes.lightTheme,
      dark: AppThemes.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CGS Maths Club',
        theme: theme,
        darkTheme: darkTheme,
        home: const AuthGate(), // Leads to the AuthGate, to handle user status.
      ),
    );
  }
}
