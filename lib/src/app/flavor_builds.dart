part of 'application.dart';

enum AppFlavor { development, staging, production }

MaterialApp _buildApp(AppFlavor flavor, GoRouter router, String languageCode) {
  switch (flavor) {
    case AppFlavor.development:
      return development(router, languageCode);
    case AppFlavor.staging:
      return staging(router, languageCode);
    case AppFlavor.production:
      return production(router, languageCode);
  }
}

MaterialApp development(GoRouter router, String languageCode) => MaterialApp.router(
      title: AppFlavor.development.toString(),
      // Localization
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(languageCode),

      // Router
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,

      // Theme
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.appThemeDark,
      themeMode: ThemeMode.dark,

      // Other
      debugShowCheckedModeBanner: true,
    );

MaterialApp staging(GoRouter router, String languageCode) => MaterialApp.router(
      title: AppFlavor.staging.toString(),
      // Localization
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(languageCode),

      // Router
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,

      // Theme
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.appThemeDark,
      themeMode: ThemeMode.dark,

      // Other
      debugShowCheckedModeBanner: false,
    );

MaterialApp production(GoRouter router, String languageCode) => MaterialApp.router(
      title: AppFlavor.production.toString(),
      // Localization
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(languageCode),

      // Router
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,

      // Theme
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.appThemeDark,
      themeMode: ThemeMode.dark,

      // Other
      debugShowCheckedModeBanner: false,
    );
