import 'package:booking/src/app/app_navigation_wrapper.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/features/booking/presentation/booking_page.dart';
import 'package:booking/src/features/camera/presentation/camera_page.dart';
import 'package:booking/src/features/camera/presentation/components/camera_search_view.dart';
import 'package:booking/src/features/class/presentation/class_list_page.dart';
import 'package:booking/src/features/class/presentation/class_students_list_page.dart';
import 'package:booking/src/features/class_events/presentation/class_event_page.dart';
import 'package:booking/src/features/class_events/presentation/components/class_search_view.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';
import 'package:booking/src/features/detection/presentation/cheating_detection_page.dart';
import 'package:booking/src/features/detection/presentation/components/view/active_detection_view.dart';
import 'package:booking/src/features/detection/presentation/components/view/cheating_plan_detection_view.dart';
import 'package:booking/src/features/detection/presentation/components/view/detection_pre_processing_view.dart';
import 'package:booking/src/features/detection/presentation/components/view/detection_processing_view.dart';
import 'package:booking/src/features/events/presentation/events_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/event_video_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_add_participant_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_confirm_involved_people_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_confirm_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_create_description_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_create_suspect_feedback_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_page.dart';
import 'package:booking/src/features/feedback/presentation/pages/feedback_wrapper_page.dart';
import 'package:booking/src/features/history/presentation/booking_history_page.dart';
import 'package:booking/src/features/initial/presentation/welcome_page.dart';
import 'package:booking/src/features/profile_page/presentation/profile_page.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_calendar.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_editing_view.dart';
import 'package:booking/src/features/schedule/presentation/teacher_schedule_page.dart';
import 'package:booking/src/features/set_new_password/presentation/set_new_password_view.dart';
import 'package:booking/src/features/settings/domain/entities/user_token_entity.dart';
import 'package:booking/src/features/settings/presentation/change_password_page.dart';
import 'package:booking/src/features/settings/presentation/settings_page.dart';
import 'package:booking/src/features/student/presentation/student_dossier_page.dart';
import 'package:booking/src/features/student/presentation/student_main_page.dart';
import 'package:booking/src/features/update_password/update_password_view.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../features/actions/presentation/actions_page.dart';
import '../../features/forgot_password/presentation/forgot_password_page.dart';
import '../../features/login/presentation/login_page.dart';
import '../../features/parent/presentation/parent_events_page.dart';
import '../../features/schedule/data/datasource/timetable_local_data_source.dart';
import '../../features/schedule/data/repository/timetable_repository_impl.dart';
import '../../features/schedule/domain/usecase/get_timetable_entries.dart';
import '../../features/schedule/presentation/bloc/timetable_bloc.dart';
import '../services/storage/storage_service_impl.dart';

part 'route_list.dart';
part 'route_transitions.dart';
part 'router_names.dart';
part 'router_paths.dart';

GoRouter routerProvider() {
  final StorageServiceImpl st = StorageServiceImpl();
  final String? token = st.getToken();

  return GoRouter(
    refreshListenable: st,
    initialLocation: token == null ? RoutePaths.welcome : '/',
    debugLogDiagnostics: true,
    routes: _routes,
  );
}
