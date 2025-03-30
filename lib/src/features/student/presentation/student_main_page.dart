import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:booking/src/features/history/presentation/booking_history_page.dart';
import 'package:booking/src/features/history/presentation/components/booking_card.dart';
import 'package:booking/src/features/student/presentation/components/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StudentMainPage extends StatelessWidget {
  const StudentMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime(2025, 1, 17, 12, 0);
    final endTime = DateTime(2025, 1, 17, 14, 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray100,
        centerTitle: true,
        title: Text(
          'Welcome back, West side!',
          style: context.typography.displayxsSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
      ),
      backgroundColor: context.colors.gray100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                IntrinsicHeight(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: context.colors.containerPurple,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You are in the Library',
                                style: context.typography.textlgBold.copyWith(
                                  color: context.colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '132 Hours',
                                style: context.typography.typography4Regular.copyWith(
                                  color: context.colors.black,
                                ),
                              ),
                              Text(
                                '52 Min',
                                style: context.typography.typography4Regular.copyWith(
                                  color: context.colors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    context.assetImages.timerVector,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        // flex: 1,
                        child: Column(
                          children: [
                            // Top card - Bookings
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: context.colors.containerGreen,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'My bookings in September',
                                            style: context.typography.textmdBold.copyWith(
                                              color: context.colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '12 days',
                                            style: context.typography.textmdMedium.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      context.assetImages.restoreVector,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Bottom card - Record
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8E9B7),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Record for the 1 day',
                                            style: context.typography.textmdBold.copyWith(
                                              color: context.colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '6 hours',
                                            style: context.typography.textmdMedium.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      MdiIcons.trophy,
                                      color: const Color(0xFFE4C248), // Golden
                                      size: 36,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CommonContainer(
                  color: const Color(0xff5636B5),
                  title: 'Make a place reservation',
                  path: context.assetImages.a1Vector,
                ),
                const SizedBox(height: 14),
                CommonContainer(
                  color: const Color(0xff35C1D6),
                  title: 'Check my bookings',
                  path: context.assetImages.a2Vector,
                ),
                const SizedBox(height: 14),
                CommonContainer(
                  color: const Color(0xff35D642),
                  title: 'Repeat last booking',
                  path: context.assetImages.a3Vector,
                ),
                const SizedBox(height: 14),
                BookingCard(
                  startTime: startTime,
                  endTime: endTime,
                  floor: '1',
                  sector: 'A',
                  row: '2',
                  place: '8',
                  status: BookingStatus.ongoing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
