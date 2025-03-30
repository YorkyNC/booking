part of 'router.dart';

final leftTabNavigatorKey = GlobalKey<NavigatorState>();
final leftTabTeacherNavigatorKey = GlobalKey<NavigatorState>();
final centerTabNavigatorKey = GlobalKey<NavigatorState>();
final rightTabNavigatorKey = GlobalKey<NavigatorState>();

final st = StorageServiceImpl();

int getCUrrentAcademicYear() {
  final today = DateTime.now();
  return today.month <= 6 ? today.year - 1 : today.year;
}

Page getPage({
  required Widget child,
  required GoRouterState state,
  bool fullscreenDialog = false,
}) {
  return MaterialPage(
    maintainState: true,
    key: state.pageKey,
    fullscreenDialog: fullscreenDialog,
    child: child,
  );
}

// Initialize user role from token data.
UserTokenEntity getCurrentRole() {
  final token = st.getToken();
  if (token == null || token.isEmpty) {
    return UserTokenEntity.fromJson({});
  }
  return UserTokenEntity.fromJson(Jwt.parseJwt(token));
}

// Create a role provider or notifier to manage role state
class RoleProvider extends ChangeNotifier {
  UserTokenEntity? _role;

  RoleProvider() : _role = getCurrentRole();

  UserTokenEntity? get role => _role;

  void updateRole() {
    _role = getCurrentRole();
    notifyListeners();
  }

  void clearRole() {
    _role = null;
    notifyListeners();
  }
}

// final roleNotifier = RoleNotifier();
// String schoolId = roleNotifier.getCurrentSchoolId()!;
int currentYear = getCUrrentAcademicYear();

final dataSource = TimetableLocalDataSource();
final repository = TimetableRepositoryImpl(localDataSource: dataSource);
final useCase = GetTimetableEntries(repository);
final bloc = TimetableBloc(getTimetableEntriesUseCase: useCase);

//pages paths

List<RouteBase> _routes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppNavigationWrapper(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        child: navigationShell,
      );
    },
    branches: [
      // First Tab - Role-specific content
      StatefulShellBranch(
        navigatorKey: leftTabNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.initial,
            redirect: (context, state) => RoutePaths.studentMain,
          ),
          GoRoute(
            path: RoutePaths.studentMain,
            pageBuilder: (context, state) {
              // final roleNotifier = context.watch<RoleNotifier>();

              return getPage(child: const StudentMainPage(), state: state);
              // return getPage(
              //     child: const PsychologistReviewPage(), state: state);

              // // Role-specific page routing
              // switch (roleNotifier.currentRole) {
              //   case 'teacher':
              //     return getPage(child: const SizedBox(), state: state);
              //   case 'classroomTeacher':
              //     return getPage(child: const SizedBox(), state: state);
              //   case 'parent':
              //     return getPage(child: const SizedBox(), state: state);
              //   default:
              //     return getPage(child: const SizedBox(), state: state);
              // }
            },
          ),
          GoRoute(
            path: RoutePaths.events,
            pageBuilder: (context, state) {
              return getPage(child: const EventsPage(), state: state);
            },
          ),
        ],
      ),
      // Second Tab - News (Common for all roles)
      StatefulShellBranch(
        navigatorKey: centerTabNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.booking,
            pageBuilder: (context, state) => getPage(
              child: const BookingPage(),
              state: state,
            ),
          ),
        ],
      ),
      // Third Tab - Chats (Common for all roles)
      StatefulShellBranch(
        navigatorKey: rightTabNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.history,
            pageBuilder: (context, state) => getPage(
              child: const BookingHistoryPage(),
              state: state,
            ),
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.profile,
            pageBuilder: (context, state) => getPage(
              child: const ProfilePage(),
              state: state,
            ),
          ),
        ],
      ),
    ],
  ),

  GoRoute(
    path: RoutePaths.parentEvents,
    pageBuilder: (context, state) {
      return getPage(child: const ParentEventsPage(), state: state);
    },
  ),

  GoRoute(
    path: RoutePaths.actions,
    pageBuilder: (context, state) {
      return getPage(child: const ActionsPage(), state: state);
    },
  ),

  GoRoute(
    path: RoutePaths.changePassword,
    pageBuilder: (context, state) {
      return getPage(child: const ChangePasswordPage(), state: state);
    },
  ),

  // GoRoute(
  //   path: RoutePaths.createNews,
  //   pageBuilder: (context, state) {
  //     final VoidCallback? refreshPosts = state.extra as VoidCallback?;
  //     return MaterialPage(
  //       child: NewPublicationPage(
  //         refreshPosts: refreshPosts ?? () {},
  //       ),
  //     );
  //   },
  // ),

  // GoRoute(
  //   path: RoutePaths.chatsMessage,
  //   pageBuilder: (context, state) {
  //     final data = state.extra as Map<String, dynamic>;
  //     return getPage(
  //       child: ChatMessagePage(
  //         chatId: data['chatId'],
  //         chatTitle: data['chatTitle'],
  //       ),
  //       state: state,
  //     );
  //   },
  // ),
  ShellRoute(
    builder: (context, state, child) => FeedbackWrapperPage(
      eventId: state.pathParameters["eventId"]!,
      event: state.extra as EventEntity?,
      child: child,
    ),
    routes: [
      GoRoute(
        path: "${RoutePaths.feedback}/:eventId",
        pageBuilder: (context, state) {
          return getPage(
            child: const FeedbackPage(),
            state: state,
          );
        },
        routes: [
          GoRoute(
            path: RoutePaths.addParticipant,
            pageBuilder: (context, state) {
              return getPage(
                child: const FeedbackAddParticipantPage(),
                state: state,
              );
            },
          ),
          GoRoute(
            path: RoutePaths.confirmSuspects,
            pageBuilder: (context, state) {
              return getPage(
                child: const FeedbackConfirmInvolvedPeoplePage(),
                state: state,
              );
            },
          ),
          GoRoute(
            path: RoutePaths.description,
            pageBuilder: (context, state) {
              return getPage(
                child: const FeedbackCreateDescriptionPage(),
                state: state,
              );
            },
          ),
          GoRoute(
            path: "${RoutePaths.suspectFeedback}/:suspectIndex",
            pageBuilder: (context, state) {
              return getPage(
                child: FeedbackCreateSuspectFeedbackPage(
                  suspectIndex: int.tryParse(state.pathParameters["suspectIndex"]!)!,
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            path: RoutePaths.confirm,
            pageBuilder: (context, state) {
              return getPage(
                child: const FeedbackConfirmPage(),
                state: state,
              );
            },
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: RoutePaths.eventVideo,
    pageBuilder: (context, state) {
      return getPage(
        child: EventVideoPage(
          event: state.extra as EventEntity,
        ),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.cameraPage,
    pageBuilder: (context, state) {
      return getPage(
        child: const CameraPage(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.studentDossier,
    pageBuilder: (context, state) {
      final data = state.extra as Map<String, dynamic>;
      return getPage(
        child: StudentDossierPage(
          firstName: data['firstName'],
          secondName: data['secondName'],
        ),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.studentsList,
    pageBuilder: (context, state) {
      final data = state.extra as Map<String, dynamic>;
      return getPage(
        child: ClassStudentsListPage(
          className: data['className'],
          studentsCount: data['studentsCount'],
        ),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.classesList,
    pageBuilder: (context, state) {
      return getPage(
        fullscreenDialog: false,
        child: const ClassListPage(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.classEvents,
    pageBuilder: (context, state) {
      return getPage(
        child: const ClassEventPage(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.cheatingDetection,
    pageBuilder: (context, state) {
      return getPage(
        child: const CheatingDetectionPage(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.teacherSchedule,
    pageBuilder: (context, state) {
      return getPage(
        child: const TeacherSchedulePage(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.scheduleCalendar,
    pageBuilder: (context, state) {
      return getPage(
        child: const ScheduleCalendar(),
        state: state,
        fullscreenDialog: true,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.scheduleEdit,
    pageBuilder: (context, state) {
      return getPage(
        child: const ScheduleEditingView(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.cheatingPlanDetection,
    pageBuilder: (context, state) {
      return getPage(
        child: const CheatingPlanDetectionView(),
        state: state,
        fullscreenDialog: true,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.activeDetection,
    pageBuilder: (context, state) {
      final detection = state.extra as DetectionEntity;
      return getPage(
        child: ActiveDetectionView(
          detectionEntity: detection,
        ),
        state: state,
        fullscreenDialog: false,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.detectionPreProcessing,
    pageBuilder: (context, state) {
      final detection = state.extra as DetectionEntity;
      return getPage(
        child: DetectionPreProcessingView(
          detectionEntity: detection,
        ),
        state: state,
        fullscreenDialog: false,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.detectionProcessing,
    pageBuilder: (context, state) {
      return getPage(
        child: const DetectionProcessingView(),
        state: state,
        fullscreenDialog: false,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.classSearch,
    pageBuilder: (context, state) {
      final data = state.extra as Map<String, dynamic>;
      return getPage(
        child: ClassSearchView(
          heroTag: data['heroTag'],
          initialQuery: '',
        ),
        state: state,
        fullscreenDialog: false,
      );
    },
  ),
  GoRoute(
    path: RoutePaths.cameraSearch,
    pageBuilder: (context, state) {
      final data = state.extra as Map<String, dynamic>;
      return getPage(
        child: CameraSearchView(
          heroTag: data['heroTag'],
          initialQuery: '',
        ),
        state: state,
        fullscreenDialog: false,
      );
    },
  ),
  GoRoute(
    name: RouteNames.forgotPassword,
    path: RoutePaths.forgotPassword,
    pageBuilder: (context, state) {
      return getPage(
        child: const ForgotPasswordPage(),
        state: state,
      );
    },
  ),
  GoRoute(
    name: RouteNames.register,
    path: RoutePaths.register,
    pageBuilder: (context, state) {
      return getPage(
        child: const RegisterPage(),
        state: state,
      );
    },
  ),
  GoRoute(
      name: RouteNames.setNewPassword,
      path: RoutePaths.setNewPassword,
      pageBuilder: (context, state) {
        return getPage(
            child: const SetNewPasswordView(
                // email: state.extra as String,
                ),
            state: state);
      }),
  GoRoute(
    name: RouteNames.updatePassword,
    path: RoutePaths.updatePassword,
    pageBuilder: (context, state) {
      return getPage(
          child: const UpdatePasswordView(
            email: 'tursynbekov@gmail.com',
          ),
          state: state);
    },
  ),
  GoRoute(
    name: RouteNames.login,
    path: RoutePaths.login,
    builder: (context, GoRouterState state) {
      return LoginPage(
        title: state.extra as String,
      );
    },
  ),
  GoRoute(
    name: RouteNames.welcome,
    path: RoutePaths.welcome,
    builder: (context, GoRouterState state) {
      return const WelcomePage();
    },
  ),
  GoRoute(
    path: RoutePaths.settings,
    pageBuilder: (context, state) {
      return getPage(
        child: const SettingsPage(),
        state: state,
      );
    },
  ),
];
