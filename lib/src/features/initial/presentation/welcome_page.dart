import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex: 3, // Give more space to the card
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.card04Light,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Fix alignment
                          children: [
                            Text(
                              'Find any of the events',
                              style: context.typography.displaymdBold.copyWith(
                                color: context.colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Application will help you to find the event and hangout at the time you want',
                              style: context.typography.typography2Regular.copyWith(
                                color: context.colors.blackLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        // Make image flexible
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            'assets/app_images/star.png',
                            fit: BoxFit.contain, // Ensure image fits properly
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 17),
              // Wrap buttons in Flexible to prevent overflow
              Flexible(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(RoutePaths.login, extra: 'Log in as student');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(context.loc.startAsStudent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(RoutePaths.login, extra: 'Log in as Admin');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(context.loc.startAsOrganizationclub),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
