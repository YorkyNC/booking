import 'package:flutter/material.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_bloc.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_event.dart';

class ParentHomeViewModel extends ChangeNotifier {
  final ParentBloc _parentBloc;
  bool _isInSchool = false;

  ParentHomeViewModel({ParentBloc? parentBloc}) : _parentBloc = parentBloc ?? getIt<ParentBloc>() {
    _init();
  }

  bool get isInSchool => _isInSchool;

  void _init() {
    _parentBloc.add(const ParentEventFetched());
  }

  void toggleAttendanceStatus() {
    _isInSchool = !_isInSchool;
    notifyListeners();
  }
}
