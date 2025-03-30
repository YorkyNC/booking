import 'package:booking/src/app/application.dart';

import 'src/app/imports.dart';

void main() async {
  // await dotenv.load(fileName: 'assets/env/development.env');
  // Widget tree binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Prevent native splash screen from disappearing
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Set status bar theme
  UIHelpers.statusBarTheme();
  // Prevent landscape mode

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MainApp(
          flavor: AppFlavor.staging,
        ),
      );
    },
  );
}
