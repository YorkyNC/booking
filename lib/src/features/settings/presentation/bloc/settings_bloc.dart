import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/services/storage/storage_service_impl.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const _EmptySettingsState()) {
    _initializeLanguage();
  }

  final StorageServiceImpl _storageService = StorageServiceImpl();
  StreamController<String> languageChangeController =
      StreamController<String>.broadcast();

  Future<void> _initializeLanguage() async {
    try {
      await _storageService.openBox();
      String? storedLanguage = _storageService.getLanguageCode();
      if (storedLanguage != null) {
        await _applyLanguage(storedLanguage);
      }
    } catch (e) {
      debugPrint('Error initializing language: $e');
    }
  }

  Future<void> _applyLanguage(String languageCode) async {
    try {
      // Update Intl locale
      Intl.defaultLocale = languageCode;

      // Update app locale
      await S.load(Locale(languageCode));

      // Notify listeners of language change
      languageChangeController.add(languageCode);
    } catch (e) {
      debugPrint('Error applying language: $e');
    }
  }

  @override
  Future<void> close() {
    languageChangeController.close();
    return super.close();
  }

  @override
  Future<void> onEventHandler(SettingsEvent event, Emitter emit) async {
    await event.when(
      retrieve: () => _retrieveSettings(
        event as _RetrieveSettingsEvent,
        emit as Emitter<SettingsState>,
      ),
      update: (lang) => _updateSettings(
        event as _UpdateSettingsEvent,
        emit as Emitter<SettingsState>,
      ),
    );
  }

  Future<void> _retrieveSettings(
      _RetrieveSettingsEvent event, Emitter emit) async {
    emit(const SettingsState.inProgress());

    try {
      await _storageService.openBox();
      String? languageCode = _storageService.getLanguageCode();

      if (languageCode == null) {
        languageCode = 'en';
        await _storageService.setLanguageCode(languageCode);
      }

      await _applyLanguage(languageCode);

      emit(
        SettingsState.done(
          SettingsViewModel(languageCode),
        ),
      );
    } catch (e) {
      emit(SettingsState.error(errorMessage: e.toString()));
    }
  }

  Future<void> _updateSettings(
      _UpdateSettingsEvent event, Emitter<SettingsState> emit) async {
    try {
      final String newLanguageCode = event.languageCode;

      // Update storage
      await _storageService.setLanguageCode(newLanguageCode);

      // Update locale
      Intl.defaultLocale = newLanguageCode;
      await S.load(Locale(newLanguageCode));

      // Update state
      emit(SettingsState.done(SettingsViewModel(newLanguageCode)));
    } catch (e) {
      emit(SettingsState.error(errorMessage: e.toString()));
    }
  }
}
