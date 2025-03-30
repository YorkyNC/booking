import 'package:booking/src/app/imports.dart';
import 'package:booking/src/features/parent/presentation/components/parent_attendance_shimmer.dart';
import 'package:booking/src/features/parent/presentation/components/parent_home_buttons_shimmer.dart';
import 'package:booking/src/features/parent/presentation/components/parent_schedule_header_shimmer.dart';
import 'package:booking/src/features/parent/presentation/components/parent_schedule_shimmer.dart';

class ParentLoadingState extends StatelessWidget {
  const ParentLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ParentAttendanceShimmer(),
        ),
        SliverToBoxAdapter(
          child: ParentHomeButtonsShimmer(),
        ),
        ParentScheduleHeaderShimmer(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8,
            ),
            child: ParentScheduleShimmer(),
          ),
        ),
      ],
    );
  }
}
