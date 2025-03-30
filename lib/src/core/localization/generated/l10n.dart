// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `От А до Я`
  String get aToZ {
    return Intl.message(
      'От А до Я',
      name: 'aToZ',
      desc: '',
      args: [],
    );
  }

  /// `О ребенке`
  String get aboutChild {
    return Intl.message(
      'О ребенке',
      name: 'aboutChild',
      desc: '',
      args: [],
    );
  }

  /// `Академические достижения`
  String get academicAchievements {
    return Intl.message(
      'Академические достижения',
      name: 'academicAchievements',
      desc: '',
      args: [],
    );
  }

  /// `Академическая дисциплина`
  String get academicDiscipline {
    return Intl.message(
      'Академическая дисциплина',
      name: 'academicDiscipline',
      desc: '',
      args: [],
    );
  }

  /// `Успеваемость`
  String get academicPerformance {
    return Intl.message(
      'Успеваемость',
      name: 'academicPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Успеваемость по вашему предмету`
  String get academicPerformanceInYourSubject {
    return Intl.message(
      'Успеваемость по вашему предмету',
      name: 'academicPerformanceInYourSubject',
      desc: '',
      args: [],
    );
  }

  /// `Успеваемость класса`
  String get academicPerformanceOfTheClass {
    return Intl.message(
      'Успеваемость класса',
      name: 'academicPerformanceOfTheClass',
      desc: '',
      args: [],
    );
  }

  /// `Одобрено`
  String get accepted {
    return Intl.message(
      'Одобрено',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Аккаунт`
  String get account {
    return Intl.message(
      'Аккаунт',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Настройки аккаунта`
  String get accountSettings {
    return Intl.message(
      'Настройки аккаунта',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Достижения`
  String get achievements {
    return Intl.message(
      'Достижения',
      name: 'achievements',
      desc: '',
      args: [],
    );
  }

  /// `Действия`
  String get actions {
    return Intl.message(
      'Действия',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Активно`
  String get active {
    return Intl.message(
      'Активно',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Активная детекция`
  String get activeDetection {
    return Intl.message(
      'Активная детекция',
      name: 'activeDetection',
      desc: '',
      args: [],
    );
  }

  /// `Факт`
  String get actual {
    return Intl.message(
      'Факт',
      name: 'actual',
      desc: '',
      args: [],
    );
  }

  /// `Добавить изображение сертификата`
  String get addACertificateImage {
    return Intl.message(
      'Добавить изображение сертификата',
      name: 'addACertificateImage',
      desc: '',
      args: [],
    );
  }

  /// `Добавить сертификат`
  String get addCertificate {
    return Intl.message(
      'Добавить сертификат',
      name: 'addCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Добавить медиа,файлы`
  String get addMediaFile {
    return Intl.message(
      'Добавить медиа,файлы',
      name: 'addMediaFile',
      desc: '',
      args: [],
    );
  }

  /// `Добавить еще`
  String get addMore {
    return Intl.message(
      'Добавить еще',
      name: 'addMore',
      desc: '',
      args: [],
    );
  }

  /// `После конца уроков`
  String get afterLessons {
    return Intl.message(
      'После конца уроков',
      name: 'afterLessons',
      desc: '',
      args: [],
    );
  }

  /// `Все поля обязательны для заполнения`
  String get allFieldsAreRequired {
    return Intl.message(
      'Все поля обязательны для заполнения',
      name: 'allFieldsAreRequired',
      desc: '',
      args: [],
    );
  }

  /// `Проанализировать`
  String get analyze {
    return Intl.message(
      'Проанализировать',
      name: 'analyze',
      desc: '',
      args: [],
    );
  }

  /// `Проблемы с приложением? Напишите нам на `
  String get appIssuesContactUs {
    return Intl.message(
      'Проблемы с приложением? Напишите нам на ',
      name: 'appIssuesContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Апрель`
  String get april {
    return Intl.message(
      'Апрель',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `Вы уверены, что хотите открепить это сообщение?`
  String get areYouSureYouWantToUnpinThisMessage {
    return Intl.message(
      'Вы уверены, что хотите открепить это сообщение?',
      name: 'areYouSureYouWantToUnpinThisMessage',
      desc: '',
      args: [],
    );
  }

  /// `Усидчивость`
  String get assiduity {
    return Intl.message(
      'Усидчивость',
      name: 'assiduity',
      desc: '',
      args: [],
    );
  }

  /// `Посещ.`
  String get attendance {
    return Intl.message(
      'Посещ.',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Запись аудио об ученике`
  String get audioRecordingAboutStudent {
    return Intl.message(
      'Запись аудио об ученике',
      name: 'audioRecordingAboutStudent',
      desc: '',
      args: [],
    );
  }

  /// `Август`
  String get august {
    return Intl.message(
      'Август',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `Доступные классы`
  String get availableClasses {
    return Intl.message(
      'Доступные классы',
      name: 'availableClasses',
      desc: '',
      args: [],
    );
  }

  /// `Средняя посещаемость`
  String get averageAttendance {
    return Intl.message(
      'Средняя посещаемость',
      name: 'averageAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Средняя оценка`
  String get averageGrade {
    return Intl.message(
      'Средняя оценка',
      name: 'averageGrade',
      desc: '',
      args: [],
    );
  }

  /// `Стать ответственным лицом`
  String get becomeResponsiblePerson {
    return Intl.message(
      'Стать ответственным лицом',
      name: 'becomeResponsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `До начала уроков`
  String get beforeLessons {
    return Intl.message(
      'До начала уроков',
      name: 'beforeLessons',
      desc: '',
      args: [],
    );
  }

  /// `Повед.`
  String get behavior {
    return Intl.message(
      'Повед.',
      name: 'behavior',
      desc: '',
      args: [],
    );
  }

  /// `Behavior`
  String get behaviorNotes {
    return Intl.message(
      'Behavior',
      name: 'behaviorNotes',
      desc: '',
      args: [],
    );
  }

  /// `Оба списка статистики должны содержать ровно 6 значений`
  String get bothStatisticsListsMustContainExactly6Values {
    return Intl.message(
      'Оба списка статистики должны содержать ровно 6 значений',
      name: 'bothStatisticsListsMustContainExactly6Values',
      desc: '',
      args: [],
    );
  }

  /// `Расскажите или напишите кратко об ученике`
  String get briefDescriptionOfStudent {
    return Intl.message(
      'Расскажите или напишите кратко об ученике',
      name: 'briefDescriptionOfStudent',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть все`
  String get buttonViewAll {
    return Intl.message(
      'Посмотреть все',
      name: 'buttonViewAll',
      desc: '',
      args: [],
    );
  }

  /// `По алфавиту`
  String get byAlphabet {
    return Intl.message(
      'По алфавиту',
      name: 'byAlphabet',
      desc: '',
      args: [],
    );
  }

  /// `По посещаемости`
  String get byAttendance {
    return Intl.message(
      'По посещаемости',
      name: 'byAttendance',
      desc: '',
      args: [],
    );
  }

  /// `По дате`
  String get byDate {
    return Intl.message(
      'По дате',
      name: 'byDate',
      desc: '',
      args: [],
    );
  }

  /// `По успеваемости`
  String get byPerformance {
    return Intl.message(
      'По успеваемости',
      name: 'byPerformance',
      desc: '',
      args: [],
    );
  }

  /// `По типу`
  String get byType {
    return Intl.message(
      'По типу',
      name: 'byType',
      desc: '',
      args: [],
    );
  }

  /// `Кабинет`
  String get cabinet {
    return Intl.message(
      'Кабинет',
      name: 'cabinet',
      desc: '',
      args: [],
    );
  }

  /// `Календарь`
  String get calendar {
    return Intl.message(
      'Календарь',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel all classes`
  String get cancelAllClasses {
    return Intl.message(
      'Cancel all classes',
      name: 'cancelAllClasses',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled classes`
  String get cancelledClasses {
    return Intl.message(
      'Cancelled classes',
      name: 'cancelledClasses',
      desc: '',
      args: [],
    );
  }

  /// `Категория`
  String get category {
    return Intl.message(
      'Категория',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Обновление категории`
  String get categoryUpdate {
    return Intl.message(
      'Обновление категории',
      name: 'categoryUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Сертификат`
  String get certificate {
    return Intl.message(
      'Сертификат',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `Сертификаты`
  String get certificates {
    return Intl.message(
      'Сертификаты',
      name: 'certificates',
      desc: '',
      args: [],
    );
  }

  /// `Смена пароля`
  String get changePassword {
    return Intl.message(
      'Смена пароля',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Чаты`
  String get chats {
    return Intl.message(
      'Чаты',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Списывание`
  String get cheating {
    return Intl.message(
      'Списывание',
      name: 'cheating',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика по списыванию`
  String get cheatingAnalytics {
    return Intl.message(
      'Аналитика по списыванию',
      name: 'cheatingAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Проверка соединения...`
  String get checkingConnection {
    return Intl.message(
      'Проверка соединения...',
      name: 'checkingConnection',
      desc: '',
      args: [],
    );
  }

  /// `Портрет ребенка от преподавателей`
  String get childPortraitFromTeachers {
    return Intl.message(
      'Портрет ребенка от преподавателей',
      name: 'childPortraitFromTeachers',
      desc: '',
      args: [],
    );
  }

  /// `Дети`
  String get children {
    return Intl.message(
      'Дети',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `Выберите язык отчета`
  String get chooseReportLanguage {
    return Intl.message(
      'Выберите язык отчета',
      name: 'chooseReportLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Уровень посещаемости класса остаётся стабильным`
  String get classAttendanceLevelRemainsStable {
    return Intl.message(
      'Уровень посещаемости класса остаётся стабильным',
      name: 'classAttendanceLevelRemainsStable',
      desc: '',
      args: [],
    );
  }

  /// `Класс №`
  String get classNumber {
    return Intl.message(
      'Класс №',
      name: 'classNumber',
      desc: '',
      args: [],
    );
  }

  /// `Успеваемость класса`
  String get classPerformance {
    return Intl.message(
      'Успеваемость класса',
      name: 'classPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Класс`
  String get class_ {
    return Intl.message(
      'Класс',
      name: 'class_',
      desc: '',
      args: [],
    );
  }

  /// `Классы`
  String get classes {
    return Intl.message(
      'Классы',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `Классный руководитель`
  String get classroomTeacher {
    return Intl.message(
      'Классный руководитель',
      name: 'classroomTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Класс`
  String get classs {
    return Intl.message(
      'Класс',
      name: 'classs',
      desc: '',
      args: [],
    );
  }

  /// `Очистить все`
  String get clearAll {
    return Intl.message(
      'Очистить все',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `Коллаборация`
  String get collaboration {
    return Intl.message(
      'Коллаборация',
      name: 'collaboration',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий`
  String get coment {
    return Intl.message(
      'Комментарий',
      name: 'coment',
      desc: '',
      args: [],
    );
  }

  /// `комментариев`
  String get comments {
    return Intl.message(
      'комментариев',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `заполнено`
  String get completed {
    return Intl.message(
      'заполнено',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Заполнено`
  String get completedCapital {
    return Intl.message(
      'Заполнено',
      name: 'completedCapital',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердите личность`
  String get confirmPerson {
    return Intl.message(
      'Подтвердите личность',
      name: 'confirmPerson',
      desc: '',
      args: [],
    );
  }

  /// `Конфликт`
  String get conflict {
    return Intl.message(
      'Конфликт',
      name: 'conflict',
      desc: '',
      args: [],
    );
  }

  /// `Конфликты`
  String get conflicts {
    return Intl.message(
      'Конфликты',
      name: 'conflicts',
      desc: '',
      args: [],
    );
  }

  /// `Подключение восстановлено`
  String get connectionRestored {
    return Intl.message(
      'Подключение восстановлено',
      name: 'connectionRestored',
      desc: '',
      args: [],
    );
  }

  /// `Рассмотрение`
  String get consideration {
    return Intl.message(
      'Рассмотрение',
      name: 'consideration',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get continueNext {
    return Intl.message(
      'Продолжить',
      name: 'continueNext',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить запись`
  String get continueRecording {
    return Intl.message(
      'Продолжить запись',
      name: 'continueRecording',
      desc: '',
      args: [],
    );
  }

  /// `Вклад в общий успех`
  String get contributionToTheOverallSuccess {
    return Intl.message(
      'Вклад в общий успех',
      name: 'contributionToTheOverallSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось запустить почтовый клиент`
  String get couldNotLaunchEmailClient {
    return Intl.message(
      'Не удалось запустить почтовый клиент',
      name: 'couldNotLaunchEmailClient',
      desc: '',
      args: [],
    );
  }

  /// `Креативность`
  String get creativity {
    return Intl.message(
      'Креативность',
      name: 'creativity',
      desc: '',
      args: [],
    );
  }

  /// `Дата не указана`
  String get dateNotSpecified {
    return Intl.message(
      'Дата не указана',
      name: 'dateNotSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Дата выдачи`
  String get dateOfIssue {
    return Intl.message(
      'Дата выдачи',
      name: 'dateOfIssue',
      desc: '',
      args: [],
    );
  }

  /// `Декабрь`
  String get december {
    return Intl.message(
      'Декабрь',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Отклонено:`
  String get declined {
    return Intl.message(
      'Отклонено:',
      name: 'declined',
      desc: '',
      args: [],
    );
  }

  /// `Удалить из списка`
  String get deleteFromTheList {
    return Intl.message(
      'Удалить из списка',
      name: 'deleteFromTheList',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get description {
    return Intl.message(
      'Описание',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Описание (необязательно)`
  String get descriptionOptional {
    return Intl.message(
      'Описание (необязательно)',
      name: 'descriptionOptional',
      desc: '',
      args: [],
    );
  }

  /// `Детали`
  String get detail {
    return Intl.message(
      'Детали',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Детали KPI`
  String get detailKpi {
    return Intl.message(
      'Детали KPI',
      name: 'detailKpi',
      desc: '',
      args: [],
    );
  }

  /// `Детекция`
  String get detection {
    return Intl.message(
      'Детекция',
      name: 'detection',
      desc: '',
      args: [],
    );
  }

  /// `Detection history is empty`
  String get detectionHistoryIsEmpty {
    return Intl.message(
      'Detection history is empty',
      name: 'detectionHistoryIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Детекция списывания`
  String get detectionOfCheating {
    return Intl.message(
      'Детекция списывания',
      name: 'detectionOfCheating',
      desc: '',
      args: [],
    );
  }

  /// `Дневник`
  String get diary {
    return Intl.message(
      'Дневник',
      name: 'diary',
      desc: '',
      args: [],
    );
  }

  /// `Не знаю`
  String get doNotKnow {
    return Intl.message(
      'Не знаю',
      name: 'doNotKnow',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete a scheduled detection?`
  String get doYouWantToDeleteAScheduledDetection {
    return Intl.message(
      'Do you want to delete a scheduled detection?',
      name: 'doYouWantToDeleteAScheduledDetection',
      desc: '',
      args: [],
    );
  }

  /// `Вы хотите скачать отчет по ключевым показателям эффективности (KPI)?`
  String get doYouWantToDownloadTheKpiReport {
    return Intl.message(
      'Вы хотите скачать отчет по ключевым показателям эффективности (KPI)?',
      name: 'doYouWantToDownloadTheKpiReport',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Досье`
  String get dossier {
    return Intl.message(
      'Досье',
      name: 'dossier',
      desc: '',
      args: [],
    );
  }

  /// `Скачать`
  String get download {
    return Intl.message(
      'Скачать',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Скачать отчет KPI`
  String get downloadKpiReport {
    return Intl.message(
      'Скачать отчет KPI',
      name: 'downloadKpiReport',
      desc: '',
      args: [],
    );
  }

  /// `Скачать PDF`
  String get downloadPdf {
    return Intl.message(
      'Скачать PDF',
      name: 'downloadPdf',
      desc: '',
      args: [],
    );
  }

  /// `Скачать отчет`
  String get downloadReport {
    return Intl.message(
      'Скачать отчет',
      name: 'downloadReport',
      desc: '',
      args: [],
    );
  }

  /// `URL для скачивания недоступен`
  String get downloadUrlNotAvailable {
    return Intl.message(
      'URL для скачивания недоступен',
      name: 'downloadUrlNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Во время`
  String get during {
    return Intl.message(
      'Во время',
      name: 'during',
      desc: '',
      args: [],
    );
  }

  /// `Перемена`
  String get duringBreak {
    return Intl.message(
      'Перемена',
      name: 'duringBreak',
      desc: '',
      args: [],
    );
  }

  /// `Во время урока`
  String get duringLesson {
    return Intl.message(
      'Во время урока',
      name: 'duringLesson',
      desc: '',
      args: [],
    );
  }

  /// `Редактирование`
  String get editing {
    return Intl.message(
      'Редактирование',
      name: 'editing',
      desc: '',
      args: [],
    );
  }

  /// `Ободрено`
  String get encouraged {
    return Intl.message(
      'Ободрено',
      name: 'encouraged',
      desc: '',
      args: [],
    );
  }

  /// `Вовлеченность`
  String get engagement {
    return Intl.message(
      'Вовлеченность',
      name: 'engagement',
      desc: '',
      args: [],
    );
  }

  /// `Написать вручную`
  String get enterManually {
    return Intl.message(
      'Написать вручную',
      name: 'enterManually',
      desc: '',
      args: [],
    );
  }

  /// `Введите текст об ученике`
  String get enterTextAboutStudent {
    return Intl.message(
      'Введите текст об ученике',
      name: 'enterTextAboutStudent',
      desc: '',
      args: [],
    );
  }

  /// `Зашел в школу`
  String get enteredSchool {
    return Intl.message(
      'Зашел в школу',
      name: 'enteredSchool',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Оцените отчетность учителя`
  String get evaluateTheTeacherReporting {
    return Intl.message(
      'Оцените отчетность учителя',
      name: 'evaluateTheTeacherReporting',
      desc: '',
      args: [],
    );
  }

  /// `событий`
  String get event {
    return Intl.message(
      'событий',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Описание события`
  String get eventDescription {
    return Intl.message(
      'Описание события',
      name: 'eventDescription',
      desc: '',
      args: [],
    );
  }

  /// `События`
  String get events {
    return Intl.message(
      'События',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Новые`
  String get eventsNew {
    return Intl.message(
      'Новые',
      name: 'eventsNew',
      desc: '',
      args: [],
    );
  }

  /// `Старые`
  String get eventsOld {
    return Intl.message(
      'Старые',
      name: 'eventsOld',
      desc: '',
      args: [],
    );
  }

  /// `Срочные`
  String get eventsUrgent {
    return Intl.message(
      'Срочные',
      name: 'eventsUrgent',
      desc: '',
      args: [],
    );
  }

  /// `Контрольная работа`
  String get examination {
    return Intl.message(
      'Контрольная работа',
      name: 'examination',
      desc: '',
      args: [],
    );
  }

  /// `Отличная посещаемость, почти без пропусков`
  String get excellentAttendanceAlmostNoAbsences {
    return Intl.message(
      'Отличная посещаемость, почти без пропусков',
      name: 'excellentAttendanceAlmostNoAbsences',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительные занятия`
  String get extracurricularActivities {
    return Intl.message(
      'Дополнительные занятия',
      name: 'extracurricularActivities',
      desc: '',
      args: [],
    );
  }

  /// `факт`
  String get fact {
    return Intl.message(
      'факт',
      name: 'fact',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось сохранить метрики`
  String get failedToSaveMetrics {
    return Intl.message(
      'Не удалось сохранить метрики',
      name: 'failedToSaveMetrics',
      desc: '',
      args: [],
    );
  }

  /// `Февраль`
  String get february {
    return Intl.message(
      'Февраль',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `Обратная связь`
  String get feedback {
    return Intl.message(
      'Обратная связь',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Фильтры`
  String get filters {
    return Intl.message(
      'Фильтры',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Итоговые оценки`
  String get finalGrades {
    return Intl.message(
      'Итоговые оценки',
      name: 'finalGrades',
      desc: '',
      args: [],
    );
  }

  /// `Найти дату`
  String get findDate {
    return Intl.message(
      'Найти дату',
      name: 'findDate',
      desc: '',
      args: [],
    );
  }

  /// `Найти ученика`
  String get findStudent {
    return Intl.message(
      'Найти ученика',
      name: 'findStudent',
      desc: '',
      args: [],
    );
  }

  /// `Найдите ученика из списка по имени или классу`
  String get findStudentByNameOrClass {
    return Intl.message(
      'Найдите ученика из списка по имени или классу',
      name: 'findStudentByNameOrClass',
      desc: '',
      args: [],
    );
  }

  /// `На проверку`
  String get forChecking {
    return Intl.message(
      'На проверку',
      name: 'forChecking',
      desc: '',
      args: [],
    );
  }

  /// `За день`
  String get forDay {
    return Intl.message(
      'За день',
      name: 'forDay',
      desc: '',
      args: [],
    );
  }

  /// `За месяц`
  String get forMonth {
    return Intl.message(
      'За месяц',
      name: 'forMonth',
      desc: '',
      args: [],
    );
  }

  /// `За период`
  String get forPeriod {
    return Intl.message(
      'За период',
      name: 'forPeriod',
      desc: '',
      args: [],
    );
  }

  /// `На обработку`
  String get forProcessing {
    return Intl.message(
      'На обработку',
      name: 'forProcessing',
      desc: '',
      args: [],
    );
  }

  /// `За неделю`
  String get forWeek {
    return Intl.message(
      'За неделю',
      name: 'forWeek',
      desc: '',
      args: [],
    );
  }

  /// `для`
  String get forr {
    return Intl.message(
      'для',
      name: 'forr',
      desc: '',
      args: [],
    );
  }

  /// `Forward tapped`
  String get forwardTapped {
    return Intl.message(
      'Forward tapped',
      name: 'forwardTapped',
      desc: '',
      args: [],
    );
  }

  /// `Найдено {count}`
  String foundCount(Object count) {
    return Intl.message(
      'Найдено $count',
      name: 'foundCount',
      desc: '',
      args: [count],
    );
  }

  /// `От преподавателя на этой неделе`
  String get fromTeacherThisWeek {
    return Intl.message(
      'От преподавателя на этой неделе',
      name: 'fromTeacherThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `от классного руководителя?`
  String get fromTheClassroomTeacher {
    return Intl.message(
      'от классного руководителя?',
      name: 'fromTheClassroomTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Полное название`
  String get fullName {
    return Intl.message(
      'Полное название',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Начните с добавления Вашего первого сертификата!`
  String get getStartedByAddingYourFirstCertificate {
    return Intl.message(
      'Начните с добавления Вашего первого сертификата!',
      name: 'getStartedByAddingYourFirstCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Перейти`
  String get goTo {
    return Intl.message(
      'Перейти',
      name: 'goTo',
      desc: '',
      args: [],
    );
  }

  /// `цель`
  String get goal {
    return Intl.message(
      'цель',
      name: 'goal',
      desc: '',
      args: [],
    );
  }

  /// `Хорошая посещаемость, редкие пропуски`
  String get goodAttendanceRareAbsences {
    return Intl.message(
      'Хорошая посещаемость, редкие пропуски',
      name: 'goodAttendanceRareAbsences',
      desc: '',
      args: [],
    );
  }

  /// `Оценки`
  String get grades {
    return Intl.message(
      'Оценки',
      name: 'grades',
      desc: '',
      args: [],
    );
  }

  /// `Оценки за:`
  String get gradesFor {
    return Intl.message(
      'Оценки за:',
      name: 'gradesFor',
      desc: '',
      args: [],
    );
  }

  /// `Журнал оценок`
  String get gradesJournal {
    return Intl.message(
      'Журнал оценок',
      name: 'gradesJournal',
      desc: '',
      args: [],
    );
  }

  /// `Журнал оценок`
  String get gradesList {
    return Intl.message(
      'Журнал оценок',
      name: 'gradesList',
      desc: '',
      args: [],
    );
  }

  /// `Значение оценок`
  String get gradesValue {
    return Intl.message(
      'Значение оценок',
      name: 'gradesValue',
      desc: '',
      args: [],
    );
  }

  /// `Опекун`
  String get guardian {
    return Intl.message(
      'Опекун',
      name: 'guardian',
      desc: '',
      args: [],
    );
  }

  /// `Скрыть`
  String get hide {
    return Intl.message(
      'Скрыть',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get history {
    return Intl.message(
      'История',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Горячие точки`
  String get hotspots {
    return Intl.message(
      'Горячие точки',
      name: 'hotspots',
      desc: '',
      args: [],
    );
  }

  /// `{hours} ч`
  String hours(Object hours) {
    return Intl.message(
      '$hours ч',
      name: 'hours',
      desc: '',
      args: [hours],
    );
  }

  /// `Важные темы этой четверти`
  String get importantTopicsOfThisQuarter {
    return Intl.message(
      'Важные темы этой четверти',
      name: 'importantTopicsOfThisQuarter',
      desc: '',
      args: [],
    );
  }

  /// `Улучшились`
  String get improved {
    return Intl.message(
      'Улучшились',
      name: 'improved',
      desc: '',
      args: [],
    );
  }

  /// `В школе`
  String get inSchool {
    return Intl.message(
      'В школе',
      name: 'inSchool',
      desc: '',
      args: [],
    );
  }

  /// `Показатели`
  String get indicators {
    return Intl.message(
      'Показатели',
      name: 'indicators',
      desc: '',
      args: [],
    );
  }

  /// `Инсайты`
  String get insights {
    return Intl.message(
      'Инсайты',
      name: 'insights',
      desc: '',
      args: [],
    );
  }

  /// `Взаимодействие с родителями`
  String get interactionWithParents {
    return Intl.message(
      'Взаимодействие с родителями',
      name: 'interactionWithParents',
      desc: '',
      args: [],
    );
  }

  /// `Интерфейс`
  String get interface {
    return Intl.message(
      'Интерфейс',
      name: 'interface',
      desc: '',
      args: [],
    );
  }

  /// `Причастные лица`
  String get involvedPeople {
    return Intl.message(
      'Причастные лица',
      name: 'involvedPeople',
      desc: '',
      args: [],
    );
  }

  /// `Причастные лица ({count})`
  String involvedPeopleCount(Object count) {
    return Intl.message(
      'Причастные лица ($count)',
      name: 'involvedPeopleCount',
      desc: '',
      args: [count],
    );
  }

  /// `Январь`
  String get january {
    return Intl.message(
      'Январь',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `Журнал`
  String get journal {
    return Intl.message(
      'Журнал',
      name: 'journal',
      desc: '',
      args: [],
    );
  }

  /// `Июль`
  String get july {
    return Intl.message(
      'Июль',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `Июнь`
  String get june {
    return Intl.message(
      'Июнь',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `Язык`
  String get language {
    return Intl.message(
      'Язык',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Лидерские качества`
  String get leadershipSkills {
    return Intl.message(
      'Лидерские качества',
      name: 'leadershipSkills',
      desc: '',
      args: [],
    );
  }

  /// `Осталось`
  String get left {
    return Intl.message(
      'Осталось',
      name: 'left',
      desc: '',
      args: [],
    );
  }

  /// `Вышел из школы`
  String get leftSchool {
    return Intl.message(
      'Вышел из школы',
      name: 'leftSchool',
      desc: '',
      args: [],
    );
  }

  /// `Меньше событий`
  String get lessEvents {
    return Intl.message(
      'Меньше событий',
      name: 'lessEvents',
      desc: '',
      args: [],
    );
  }

  /// `Урок`
  String get lesson {
    return Intl.message(
      'Урок',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `уроков`
  String get lessons {
    return Intl.message(
      'уроков',
      name: 'lessons',
      desc: '',
      args: [],
    );
  }

  /// `Список учеников`
  String get listOfStudents {
    return Intl.message(
      'Список учеников',
      name: 'listOfStudents',
      desc: '',
      args: [],
    );
  }

  /// `Загрузка...`
  String get loading {
    return Intl.message(
      'Загрузка...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Загрузка класса...`
  String get loadingClass {
    return Intl.message(
      'Загрузка класса...',
      name: 'loadingClass',
      desc: '',
      args: [],
    );
  }

  /// `Выйти из учетной записи`
  String get logOut {
    return Intl.message(
      'Выйти из учетной записи',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Низкая посещаемость, много пропусков`
  String get lowAttendanceManyAbsences {
    return Intl.message(
      'Низкая посещаемость, много пропусков',
      name: 'lowAttendanceManyAbsences',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get made {
    return Intl.message(
      'Готово',
      name: 'made',
      desc: '',
      args: [],
    );
  }

  /// `Почта`
  String get mail {
    return Intl.message(
      'Почта',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Выберите 6 качеств, которые вы хотите видеть на главном экране`
  String get mainScreenQualities {
    return Intl.message(
      'Выберите 6 качеств, которые вы хотите видеть на главном экране',
      name: 'mainScreenQualities',
      desc: '',
      args: [],
    );
  }

  /// `Управление`
  String get management {
    return Intl.message(
      'Управление',
      name: 'management',
      desc: '',
      args: [],
    );
  }

  /// `Март`
  String get march {
    return Intl.message(
      'Март',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `Май`
  String get may {
    return Intl.message(
      'Май',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `Сообщение`
  String get message {
    return Intl.message(
      'Сообщение',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Сообщение скопировано`
  String get messageCopiedToClipboard {
    return Intl.message(
      'Сообщение скопировано',
      name: 'messageCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `мин`
  String get min {
    return Intl.message(
      'мин',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `{minutes} мин`
  String minutes(Object minutes) {
    return Intl.message(
      '$minutes мин',
      name: 'minutes',
      desc: '',
      args: [minutes],
    );
  }

  /// `Вы можете менять какие качества вы хотите видеть в настройках`
  String get modifyAttributesDescription {
    return Intl.message(
      'Вы можете менять какие качества вы хотите видеть в настройках',
      name: 'modifyAttributesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Месяц`
  String get month {
    return Intl.message(
      'Месяц',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `еще`
  String get more {
    return Intl.message(
      'еще',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Подробнее`
  String get moreDetail {
    return Intl.message(
      'Подробнее',
      name: 'moreDetail',
      desc: '',
      args: [],
    );
  }

  /// `Больше событий`
  String get moreEvents {
    return Intl.message(
      'Больше событий',
      name: 'moreEvents',
      desc: '',
      args: [],
    );
  }

  /// `Мои предметы`
  String get mySubjects {
    return Intl.message(
      'Мои предметы',
      name: 'mySubjects',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Проблемы с сетью`
  String get networkIssues {
    return Intl.message(
      'Проблемы с сетью',
      name: 'networkIssues',
      desc: '',
      args: [],
    );
  }

  /// `Новые достижения`
  String get newAchievements {
    return Intl.message(
      'Новые достижения',
      name: 'newAchievements',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get news {
    return Intl.message(
      'Новости',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Далее`
  String get next {
    return Intl.message(
      'Далее',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no {
    return Intl.message(
      'Нет',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No active activities`
  String get noActiveActivities {
    return Intl.message(
      'No active activities',
      name: 'noActiveActivities',
      desc: '',
      args: [],
    );
  }

  /// `Нет активных отчетностей`
  String get noActiveReports {
    return Intl.message(
      'Нет активных отчетностей',
      name: 'noActiveReports',
      desc: '',
      args: [],
    );
  }

  /// `Попыток не осталось`
  String get noAttemptsLeft {
    return Intl.message(
      'Попыток не осталось',
      name: 'noAttemptsLeft',
      desc: '',
      args: [],
    );
  }

  /// `Данные о посещаемости отсутствуют`
  String get noAttendanceDataAvailable {
    return Intl.message(
      'Данные о посещаемости отсутствуют',
      name: 'noAttendanceDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Категории не найдены`
  String get noCategoriesFound {
    return Intl.message(
      'Категории не найдены',
      name: 'noCategoriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Сертификаты не найдены`
  String get noCertificatesFound {
    return Intl.message(
      'Сертификаты не найдены',
      name: 'noCertificatesFound',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступных классов`
  String get noClassAvailable {
    return Intl.message(
      'Нет доступных классов',
      name: 'noClassAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Классы не найдены`
  String get noClassesFound {
    return Intl.message(
      'Классы не найдены',
      name: 'noClassesFound',
      desc: '',
      args: [],
    );
  }

  /// `Комментарии не найдены`
  String get noCommentsFound {
    return Intl.message(
      'Комментарии не найдены',
      name: 'noCommentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Подключение отсутствует`
  String get noConnection {
    return Intl.message(
      'Подключение отсутствует',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Курсы недоступны`
  String get noCoursesAvailable {
    return Intl.message(
      'Курсы недоступны',
      name: 'noCoursesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Нет данных`
  String get noData {
    return Intl.message(
      'Нет данных',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Пока нет событий на проверку`
  String get noEventForChecking {
    return Intl.message(
      'Пока нет событий на проверку',
      name: 'noEventForChecking',
      desc: '',
      args: [],
    );
  }

  /// `Пока нет событий`
  String get noEventYet {
    return Intl.message(
      'Пока нет событий',
      name: 'noEventYet',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступных оценок.`
  String get noGradesAvailable {
    return Intl.message(
      'Нет доступных оценок.',
      name: 'noGradesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Качества не найдены`
  String get noQualitiesFound {
    return Intl.message(
      'Качества не найдены',
      name: 'noQualitiesFound',
      desc: '',
      args: [],
    );
  }

  /// `Рекомендации временно недоступны`
  String get noRecommendationsAvailableForNow {
    return Intl.message(
      'Рекомендации временно недоступны',
      name: 'noRecommendationsAvailableForNow',
      desc: '',
      args: [],
    );
  }

  /// `Студенты не найдены`
  String get noStudentsFound {
    return Intl.message(
      'Студенты не найдены',
      name: 'noStudentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Не найдено действительных оценок`
  String get noValidGradesFound {
    return Intl.message(
      'Не найдено действительных оценок',
      name: 'noValidGradesFound',
      desc: '',
      args: [],
    );
  }

  /// `Не выполнено`
  String get notDone {
    return Intl.message(
      'Не выполнено',
      name: 'notDone',
      desc: '',
      args: [],
    );
  }

  /// `Не определено`
  String get notIdentified {
    return Intl.message(
      'Не определено',
      name: 'notIdentified',
      desc: '',
      args: [],
    );
  }

  /// `Не в школе`
  String get notInSchool {
    return Intl.message(
      'Не в школе',
      name: 'notInSchool',
      desc: '',
      args: [],
    );
  }

  /// `Not necessarily`
  String get notNecessarily {
    return Intl.message(
      'Not necessarily',
      name: 'notNecessarily',
      desc: '',
      args: [],
    );
  }

  /// `Здесь пока ничего нет`
  String get nothingHereYet {
    return Intl.message(
      'Здесь пока ничего нет',
      name: 'nothingHereYet',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления о важных событиях будут приходить в любом случае`
  String get notificationsImportantEventsWillArriveAnyway {
    return Intl.message(
      'Уведомления о важных событиях будут приходить в любом случае',
      name: 'notificationsImportantEventsWillArriveAnyway',
      desc: '',
      args: [],
    );
  }

  /// `Собеседники не увидят то, что вы отключили уведомления`
  String get notificationsInvisibilityNote {
    return Intl.message(
      'Собеседники не увидят то, что вы отключили уведомления',
      name: 'notificationsInvisibilityNote',
      desc: '',
      args: [],
    );
  }

  /// `Ноябрь`
  String get november {
    return Intl.message(
      'Ноябрь',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `Октябрь`
  String get october {
    return Intl.message(
      'Октябрь',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `Oк`
  String get ok {
    return Intl.message(
      'Oк',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Другое`
  String get other {
    return Intl.message(
      'Другое',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Другие комментарии`
  String get otherComments {
    return Intl.message(
      'Другие комментарии',
      name: 'otherComments',
      desc: '',
      args: [],
    );
  }

  /// `Общая успеваемость`
  String get overallAcademicPerformance {
    return Intl.message(
      'Общая успеваемость',
      name: 'overallAcademicPerformance',
      desc: '',
      args: [],
    );
  }

  /// `Просрочено`
  String get overdue {
    return Intl.message(
      'Просрочено',
      name: 'overdue',
      desc: '',
      args: [],
    );
  }

  /// `Родитель`
  String get parent {
    return Intl.message(
      'Родитель',
      name: 'parent',
      desc: '',
      args: [],
    );
  }

  /// `Взаимодействие с родителями`
  String get parentInteraction {
    return Intl.message(
      'Взаимодействие с родителями',
      name: 'parentInteraction',
      desc: '',
      args: [],
    );
  }

  /// `Сдано`
  String get passed {
    return Intl.message(
      'Сдано',
      name: 'passed',
      desc: '',
      args: [],
    );
  }

  /// `Пропусков`
  String get passes {
    return Intl.message(
      'Пропусков',
      name: 'passes',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Усп.`
  String get performance {
    return Intl.message(
      'Усп.',
      name: 'performance',
      desc: '',
      args: [],
    );
  }

  /// `Персональные достижения`
  String get personalTraits {
    return Intl.message(
      'Персональные достижения',
      name: 'personalTraits',
      desc: '',
      args: [],
    );
  }

  /// `Физическая подготовка`
  String get physicalTraining {
    return Intl.message(
      'Физическая подготовка',
      name: 'physicalTraining',
      desc: '',
      args: [],
    );
  }

  /// `Закрепленное сообщение`
  String get pinnedMessage {
    return Intl.message(
      'Закрепленное сообщение',
      name: 'pinnedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Место: {place}`
  String place(Object place) {
    return Intl.message(
      'Место: $place',
      name: 'place',
      desc: '',
      args: [place],
    );
  }

  /// `Запланированные`
  String get planned {
    return Intl.message(
      'Запланированные',
      name: 'planned',
      desc: '',
      args: [],
    );
  }

  /// `Запланированная детекция`
  String get plannedDetection {
    return Intl.message(
      'Запланированная детекция',
      name: 'plannedDetection',
      desc: '',
      args: [],
    );
  }

  /// `Навыки планирования`
  String get planningSkills {
    return Intl.message(
      'Навыки планирования',
      name: 'planningSkills',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, выберите класс`
  String get pleaseSelectClass {
    return Intl.message(
      'Пожалуйста, выберите класс',
      name: 'pleaseSelectClass',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, подождите, пока начнётся загрузка`
  String get pleaseWaitForTheDownloadToBegin {
    return Intl.message(
      'Пожалуйста, подождите, пока начнётся загрузка',
      name: 'pleaseWaitForTheDownloadToBegin',
      desc: '',
      args: [],
    );
  }

  /// `Плохое интернет соединение`
  String get poorInternetConnection {
    return Intl.message(
      'Плохое интернет соединение',
      name: 'poorInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Пост успешно добавлен`
  String get postAddedSuccessfully {
    return Intl.message(
      'Пост успешно добавлен',
      name: 'postAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Подготовка к скачиванию`
  String get preparingDownload {
    return Intl.message(
      'Подготовка к скачиванию',
      name: 'preparingDownload',
      desc: '',
      args: [],
    );
  }

  /// `Предыдущий`
  String get previous {
    return Intl.message(
      'Предыдущий',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Обработано`
  String get processed {
    return Intl.message(
      'Обработано',
      name: 'processed',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Профильный предмет`
  String get profileSubject {
    return Intl.message(
      'Профильный предмет',
      name: 'profileSubject',
      desc: '',
      args: [],
    );
  }

  /// `Шестиугольник качеств`
  String get qualitiesHexagon {
    return Intl.message(
      'Шестиугольник качеств',
      name: 'qualitiesHexagon',
      desc: '',
      args: [],
    );
  }

  /// `Качество обратной связи`
  String get qualityOfFeedback {
    return Intl.message(
      'Качество обратной связи',
      name: 'qualityOfFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Журнал оценок`
  String get ratingLog {
    return Intl.message(
      'Журнал оценок',
      name: 'ratingLog',
      desc: '',
      args: [],
    );
  }

  /// `Прочитать полностью`
  String get readFull {
    return Intl.message(
      'Прочитать полностью',
      name: 'readFull',
      desc: '',
      args: [],
    );
  }

  /// `Читать далее`
  String get readMore {
    return Intl.message(
      'Читать далее',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Переадресовать`
  String get redirect {
    return Intl.message(
      'Переадресовать',
      name: 'redirect',
      desc: '',
      args: [],
    );
  }

  /// `Переадресовать...`
  String get redirectTo {
    return Intl.message(
      'Переадресовать...',
      name: 'redirectTo',
      desc: '',
      args: [],
    );
  }

  /// `Переадресовано`
  String get redirected {
    return Intl.message(
      'Переадресовано',
      name: 'redirected',
      desc: '',
      args: [],
    );
  }

  /// `Отклонено`
  String get rejected {
    return Intl.message(
      'Отклонено',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Замечаний`
  String get remarks {
    return Intl.message(
      'Замечаний',
      name: 'remarks',
      desc: '',
      args: [],
    );
  }

  /// `Replying to:`
  String get replyingTo {
    return Intl.message(
      'Replying to:',
      name: 'replyingTo',
      desc: '',
      args: [],
    );
  }

  /// `Отчетности`
  String get report {
    return Intl.message(
      'Отчетности',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Отчетность по`
  String get reportAbout {
    return Intl.message(
      'Отчетность по',
      name: 'reportAbout',
      desc: '',
      args: [],
    );
  }

  /// `Время ожидания запроса истекло. Пожалуйста, попробуйте еще раз.`
  String get requestTimedOutPleaseTryAgain {
    return Intl.message(
      'Время ожидания запроса истекло. Пожалуйста, попробуйте еще раз.',
      name: 'requestTimedOutPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Reset all changes`
  String get resetAllChanges {
    return Intl.message(
      'Reset all changes',
      name: 'resetAllChanges',
      desc: '',
      args: [],
    );
  }

  /// `Ответственность`
  String get responsibility {
    return Intl.message(
      'Ответственность',
      name: 'responsibility',
      desc: '',
      args: [],
    );
  }

  /// `Ответственное лицо`
  String get responsiblePerson {
    return Intl.message(
      'Ответственное лицо',
      name: 'responsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `Став ответственным лицом, вы не сможете отказаться от события`
  String get responsiblePersonExplanation {
    return Intl.message(
      'Став ответственным лицом, вы не сможете отказаться от события',
      name: 'responsiblePersonExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Если событие не в вашей области ответственности, вы можете убрать ее из списка, переадресовав другому`
  String get responsiblePersonSubtitle {
    return Intl.message(
      'Если событие не в вашей области ответственности, вы можете убрать ее из списка, переадресовав другому',
      name: 'responsiblePersonSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Вернуться к записи`
  String get returnToRecord {
    return Intl.message(
      'Вернуться к записи',
      name: 'returnToRecord',
      desc: '',
      args: [],
    );
  }

  /// `Обзор`
  String get review {
    return Intl.message(
      'Обзор',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Удовлетворительная посещаемость, есть пропуски`
  String get satisfactoryAttendanceSomeAbsences {
    return Intl.message(
      'Удовлетворительная посещаемость, есть пропуски',
      name: 'satisfactoryAttendanceSomeAbsences',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Расписание`
  String get schedule {
    return Intl.message(
      'Расписание',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Расписание пустое`
  String get scheduleEmpty {
    return Intl.message(
      'Расписание пустое',
      name: 'scheduleEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Расписание отсутствует`
  String get scheduleMissing {
    return Intl.message(
      'Расписание отсутствует',
      name: 'scheduleMissing',
      desc: '',
      args: [],
    );
  }

  /// `Расписание предметов`
  String get scheduleOfSubjects {
    return Intl.message(
      'Расписание предметов',
      name: 'scheduleOfSubjects',
      desc: '',
      args: [],
    );
  }

  /// `Школа`
  String get school {
    return Intl.message(
      'Школа',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Найти`
  String get search {
    return Intl.message(
      'Найти',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `СОР`
  String get sectionAssessment {
    return Intl.message(
      'СОР',
      name: 'sectionAssessment',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать`
  String get select {
    return Intl.message(
      'Выбрать',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите продолжить, если вы согласны`
  String get selectContinueIfYouAgree {
    return Intl.message(
      'Нажмите продолжить, если вы согласны',
      name: 'selectContinueIfYouAgree',
      desc: '',
      args: [],
    );
  }

  /// `Выберите кадр`
  String get selectFrame {
    return Intl.message(
      'Выберите кадр',
      name: 'selectFrame',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать период`
  String get selectPeriod {
    return Intl.message(
      'Выбрать период',
      name: 'selectPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Выберите кому отправить`
  String get selectReceiver {
    return Intl.message(
      'Выберите кому отправить',
      name: 'selectReceiver',
      desc: '',
      args: [],
    );
  }

  /// `После переадресации событие не будет у вас высвечиваться`
  String get selectReceiverSubtitle {
    return Intl.message(
      'После переадресации событие не будет у вас высвечиваться',
      name: 'selectReceiverSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Select source`
  String get selectSource {
    return Intl.message(
      'Select source',
      name: 'selectSource',
      desc: '',
      args: [],
    );
  }

  /// `Выделите ученика в квадрате`
  String get selectStudentInSquare {
    return Intl.message(
      'Выделите ученика в квадрате',
      name: 'selectStudentInSquare',
      desc: '',
      args: [],
    );
  }

  /// `Выбрано`
  String get selected {
    return Intl.message(
      'Выбрано',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Самостоятельность`
  String get selfsufficiency {
    return Intl.message(
      'Самостоятельность',
      name: 'selfsufficiency',
      desc: '',
      args: [],
    );
  }

  /// `Отправлено`
  String get sent {
    return Intl.message(
      'Отправлено',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Отправлено с опозданием`
  String get sentWithDelay {
    return Intl.message(
      'Отправлено с опозданием',
      name: 'sentWithDelay',
      desc: '',
      args: [],
    );
  }

  /// `Сентябрь`
  String get september {
    return Intl.message(
      'Сентябрь',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `Сервисы`
  String get services {
    return Intl.message(
      'Сервисы',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Поделиться`
  String get share {
    return Intl.message(
      'Поделиться',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Показать сначала`
  String get showFirst {
    return Intl.message(
      'Показать сначала',
      name: 'showFirst',
      desc: '',
      args: [],
    );
  }

  /// `Показать еще`
  String get showMore {
    return Intl.message(
      'Показать еще',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Показать результаты`
  String get showResults {
    return Intl.message(
      'Показать результаты',
      name: 'showResults',
      desc: '',
      args: [],
    );
  }

  /// `Кому показывать`
  String get showToWhom {
    return Intl.message(
      'Кому показывать',
      name: 'showToWhom',
      desc: '',
      args: [],
    );
  }

  /// `Значительно улучшились`
  String get significantlyImproved {
    return Intl.message(
      'Значительно улучшились',
      name: 'significantlyImproved',
      desc: '',
      args: [],
    );
  }

  /// `Значительно ухудшились`
  String get significantlyWorsened {
    return Intl.message(
      'Значительно ухудшились',
      name: 'significantlyWorsened',
      desc: '',
      args: [],
    );
  }

  /// `Курение`
  String get smoking {
    return Intl.message(
      'Курение',
      name: 'smoking',
      desc: '',
      args: [],
    );
  }

  /// `Социальная информация`
  String get socialInfo {
    return Intl.message(
      'Социальная информация',
      name: 'socialInfo',
      desc: '',
      args: [],
    );
  }

  /// `Сортировка`
  String get sort {
    return Intl.message(
      'Сортировка',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Сортировка`
  String get sortOptions {
    return Intl.message(
      'Сортировка',
      name: 'sortOptions',
      desc: '',
      args: [],
    );
  }

  /// `Сортировка`
  String get sorting {
    return Intl.message(
      'Сортировка',
      name: 'sorting',
      desc: '',
      args: [],
    );
  }

  /// `Стабильно`
  String get stable {
    return Intl.message(
      'Стабильно',
      name: 'stable',
      desc: '',
      args: [],
    );
  }

  /// `Ученик`
  String get student {
    return Intl.message(
      'Ученик',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Досье ученика`
  String get studentDossier {
    return Intl.message(
      'Досье ученика',
      name: 'studentDossier',
      desc: '',
      args: [],
    );
  }

  /// `Отчетность об ученике`
  String get studentReport {
    return Intl.message(
      'Отчетность об ученике',
      name: 'studentReport',
      desc: '',
      args: [],
    );
  }

  /// `Ученики`
  String get students {
    return Intl.message(
      'Ученики',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Шестиугольник предметов`
  String get subjectQuality {
    return Intl.message(
      'Шестиугольник предметов',
      name: 'subjectQuality',
      desc: '',
      args: [],
    );
  }

  /// `Журнал предметов`
  String get subjectsJournal {
    return Intl.message(
      'Журнал предметов',
      name: 'subjectsJournal',
      desc: '',
      args: [],
    );
  }

  /// `Суммативные оценивания`
  String get summativeAssessments {
    return Intl.message(
      'Суммативные оценивания',
      name: 'summativeAssessments',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Если вы кого-то не узнали, они будут опознаны администрацией перед отправкой`
  String get suspectListHint {
    return Intl.message(
      'Если вы кого-то не узнали, они будут опознаны администрацией перед отправкой',
      name: 'suspectListHint',
      desc: '',
      args: [],
    );
  }

  /// `Теги`
  String get tags {
    return Intl.message(
      'Теги',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `Задача уже обрабатывается другим человеком`
  String get taskAlreadyAssigned {
    return Intl.message(
      'Задача уже обрабатывается другим человеком',
      name: 'taskAlreadyAssigned',
      desc: '',
      args: [],
    );
  }

  /// `Учитель`
  String get teacher {
    return Intl.message(
      'Учитель',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `Комментарии преподавателей`
  String get teacherComments {
    return Intl.message(
      'Комментарии преподавателей',
      name: 'teacherComments',
      desc: '',
      args: [],
    );
  }

  /// `Рекомендации и запросы учителей`
  String get teachersRecommendationsAndRequests {
    return Intl.message(
      'Рекомендации и запросы учителей',
      name: 'teachersRecommendationsAndRequests',
      desc: '',
      args: [],
    );
  }

  /// `Техподдержка`
  String get techSupport {
    return Intl.message(
      'Техподдержка',
      name: 'techSupport',
      desc: '',
      args: [],
    );
  }

  /// `Временные технические проблемы`
  String get temporaryTechnicalIssues {
    return Intl.message(
      'Временные технические проблемы',
      name: 'temporaryTechnicalIssues',
      desc: '',
      args: [],
    );
  }

  /// `ЧЕТВЕРТЬ`
  String get term {
    return Intl.message(
      'ЧЕТВЕРТЬ',
      name: 'term',
      desc: '',
      args: [],
    );
  }

  /// `СОЧ`
  String get termAssessment {
    return Intl.message(
      'СОЧ',
      name: 'termAssessment',
      desc: '',
      args: [],
    );
  }

  /// `There are no scheduled classes`
  String get thereAreNoScheduledClasses {
    return Intl.message(
      'There are no scheduled classes',
      name: 'thereAreNoScheduledClasses',
      desc: '',
      args: [],
    );
  }

  /// `There are no scheduled detections`
  String get thereAreNoScheduledDetections {
    return Intl.message(
      'There are no scheduled detections',
      name: 'thereAreNoScheduledDetections',
      desc: '',
      args: [],
    );
  }

  /// `Через администрацию`
  String get throughAdministration {
    return Intl.message(
      'Через администрацию',
      name: 'throughAdministration',
      desc: '',
      args: [],
    );
  }

  /// `Time is over`
  String get timeIsOver {
    return Intl.message(
      'Time is over',
      name: 'timeIsOver',
      desc: '',
      args: [],
    );
  }

  /// `Срок истек`
  String get timeOut {
    return Intl.message(
      'Срок истек',
      name: 'timeOut',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get title {
    return Intl.message(
      'Название',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Классному руководителю`
  String get toClassTeacher {
    return Intl.message(
      'Классному руководителю',
      name: 'toClassTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня`
  String get today {
    return Intl.message(
      'Сегодня',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Всего: {count}`
  String total(Object count) {
    return Intl.message(
      'Всего: $count',
      name: 'total',
      desc: '',
      args: [count],
    );
  }

  /// `Обучение`
  String get training {
    return Intl.message(
      'Обучение',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Проблемный класс`
  String get troubleClass {
    return Intl.message(
      'Проблемный класс',
      name: 'troubleClass',
      desc: '',
      args: [],
    );
  }

  /// `Повторить`
  String get tryAgain {
    return Intl.message(
      'Повторить',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Попробуйте снова позже`
  String get tryAgainLater {
    return Intl.message(
      'Попробуйте снова позже',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестный курс`
  String get unknownCourse {
    return Intl.message(
      'Неизвестный курс',
      name: 'unknownCourse',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Student`
  String get unknownStudent {
    return Intl.message(
      'Unknown Student',
      name: 'unknownStudent',
      desc: '',
      args: [],
    );
  }

  /// `Открепить`
  String get unpin {
    return Intl.message(
      'Открепить',
      name: 'unpin',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть все предметы`
  String get viewAllSubjects {
    return Intl.message(
      'Посмотреть все предметы',
      name: 'viewAllSubjects',
      desc: '',
      args: [],
    );
  }

  /// `Еженедельный отчет`
  String get weeklyReport {
    return Intl.message(
      'Еженедельный отчет',
      name: 'weeklyReport',
      desc: '',
      args: [],
    );
  }

  /// `вес`
  String get weight {
    return Intl.message(
      'вес',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Какие у вас впечатления от отчета`
  String get whatAreYourImpressionsOfTheReport {
    return Intl.message(
      'Какие у вас впечатления от отчета',
      name: 'whatAreYourImpressionsOfTheReport',
      desc: '',
      args: [],
    );
  }

  /// `Кто это?`
  String get whoIsItQuestion {
    return Intl.message(
      'Кто это?',
      name: 'whoIsItQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Ухудшились`
  String get worsened {
    return Intl.message(
      'Ухудшились',
      name: 'worsened',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message(
      'Да',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Вчера`
  String get yesterday {
    return Intl.message(
      'Вчера',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Вы`
  String get you {
    return Intl.message(
      'Вы',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `You wont be able to restart it again`
  String get youWontBeAbleToRestartItAgain {
    return Intl.message(
      'You wont be able to restart it again',
      name: 'youWontBeAbleToRestartItAgain',
      desc: '',
      args: [],
    );
  }

  /// `Ваш ребенок`
  String get yourChild {
    return Intl.message(
      'Ваш ребенок',
      name: 'yourChild',
      desc: '',
      args: [],
    );
  }

  /// `Ваш класс`
  String get yourClass {
    return Intl.message(
      'Ваш класс',
      name: 'yourClass',
      desc: '',
      args: [],
    );
  }

  /// `Ваш KPI`
  String get yourKpi {
    return Intl.message(
      'Ваш KPI',
      name: 'yourKpi',
      desc: '',
      args: [],
    );
  }

  /// `Новая публикация`
  String get newPublication {
    return Intl.message(
      'Новая публикация',
      name: 'newPublication',
      desc: '',
      args: [],
    );
  }

  /// `Добавьте комментарий`
  String get addComments {
    return Intl.message(
      'Добавьте комментарий',
      name: 'addComments',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика`
  String get analytics {
    return Intl.message(
      'Аналитика',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Камеры`
  String get cameras {
    return Intl.message(
      'Камеры',
      name: 'cameras',
      desc: '',
      args: [],
    );
  }

  /// `Все события`
  String get allEvents {
    return Intl.message(
      'Все события',
      name: 'allEvents',
      desc: '',
      args: [],
    );
  }

  /// `Все`
  String get all {
    return Intl.message(
      'Все',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Добавить участника`
  String get addParticipant {
    return Intl.message(
      'Добавить участника',
      name: 'addParticipant',
      desc: '',
      args: [],
    );
  }

  /// `Это тот же человек?`
  String get isItSamePersonQuestion {
    return Intl.message(
      'Это тот же человек?',
      name: 'isItSamePersonQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Неопределенные участники будут опознаны администрацией перед отправкой`
  String get suspectListHint2 {
    return Intl.message(
      'Неопределенные участники будут опознаны администрацией перед отправкой',
      name: 'suspectListHint2',
      desc: '',
      args: [],
    );
  }

  /// `Кому отправить`
  String get whoToSend {
    return Intl.message(
      'Кому отправить',
      name: 'whoToSend',
      desc: '',
      args: [],
    );
  }

  /// `Родителю`
  String get toParent {
    return Intl.message(
      'Родителю',
      name: 'toParent',
      desc: '',
      args: [],
    );
  }

  /// `Ученику`
  String get toStudent {
    return Intl.message(
      'Ученику',
      name: 'toStudent',
      desc: '',
      args: [],
    );
  }

  /// `Ученику придет уведомление, но он не сможет прочитать что вы написали`
  String get studentWillBeInformed {
    return Intl.message(
      'Ученику придет уведомление, но он не сможет прочитать что вы написали',
      name: 'studentWillBeInformed',
      desc: '',
      args: [],
    );
  }

  /// `Родитель не будет уведомлен`
  String get studentWillNotBeInformed {
    return Intl.message(
      'Родитель не будет уведомлен',
      name: 'studentWillNotBeInformed',
      desc: '',
      args: [],
    );
  }

  /// `Написать`
  String get write {
    return Intl.message(
      'Написать',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Шаг {from} из {to}`
  String stepFrom(Object from, Object to) {
    return Intl.message(
      'Шаг $from из $to',
      name: 'stepFrom',
      desc: '',
      args: [from, to],
    );
  }

  /// `Обратная связь: {eventType}`
  String feedbackEventType(Object eventType) {
    return Intl.message(
      'Обратная связь: $eventType',
      name: 'feedbackEventType',
      desc: '',
      args: [eventType],
    );
  }

  /// `Опишите инцидент в общих чертах и с личных наблюдений как психолога`
  String get describeIncidentInGeneral {
    return Intl.message(
      'Опишите инцидент в общих чертах и с личных наблюдений как психолога',
      name: 'describeIncidentInGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Дайте обратную связь для родителя`
  String get giveFeedbackToParent {
    return Intl.message(
      'Дайте обратную связь для родителя',
      name: 'giveFeedbackToParent',
      desc: '',
      args: [],
    );
  }

  /// `Дайте обратную связь для ученика`
  String get giveFeedbackToStudent {
    return Intl.message(
      'Дайте обратную связь для ученика',
      name: 'giveFeedbackToStudent',
      desc: '',
      args: [],
    );
  }

  /// `Неопределенный ученик`
  String get unidentifiedStudent {
    return Intl.message(
      'Неопределенный ученик',
      name: 'unidentifiedStudent',
      desc: '',
      args: [],
    );
  }

  /// `Определится после отправки`
  String get willBeIdentifiedAfterSent {
    return Intl.message(
      'Определится после отправки',
      name: 'willBeIdentifiedAfterSent',
      desc: '',
      args: [],
    );
  }

  /// `Есть {count} попытки`
  String attemptsLeft(Object count) {
    return Intl.message(
      'Есть $count попытки',
      name: 'attemptsLeft',
      desc: '',
      args: [count],
    );
  }

  /// `Вы потратили все попытки`
  String get attemptsSpent {
    return Intl.message(
      'Вы потратили все попытки',
      name: 'attemptsSpent',
      desc: '',
      args: [],
    );
  }

  /// `Анализировать с ИИ`
  String get analyzeWithAi {
    return Intl.message(
      'Анализировать с ИИ',
      name: 'analyzeWithAi',
      desc: '',
      args: [],
    );
  }

  /// `Проанализировать снова`
  String get analyzeAgain {
    return Intl.message(
      'Проанализировать снова',
      name: 'analyzeAgain',
      desc: '',
      args: [],
    );
  }

  /// `Идет анализ...`
  String get analysisInProgress {
    return Intl.message(
      'Идет анализ...',
      name: 'analysisInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Что такое ИИ анализ?`
  String get whatIsAiAnalysisQuestion {
    return Intl.message(
      'Что такое ИИ анализ?',
      name: 'whatIsAiAnalysisQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите «Анализировать с ИИ», чтобы быстро обработать ваш текст. Приложение выделит ключевые моменты и коротко опишет их, помогая видеть самое важное в обратной связи.`
  String get aiAnalysisDescription {
    return Intl.message(
      'Нажмите «Анализировать с ИИ», чтобы быстро обработать ваш текст. Приложение выделит ключевые моменты и коротко опишет их, помогая видеть самое важное в обратной связи.',
      name: 'aiAnalysisDescription',
      desc: '',
      args: [],
    );
  }

  /// `Понятно`
  String get understood {
    return Intl.message(
      'Понятно',
      name: 'understood',
      desc: '',
      args: [],
    );
  }

  /// `Про ученика`
  String get aboutStudent {
    return Intl.message(
      'Про ученика',
      name: 'aboutStudent',
      desc: '',
      args: [],
    );
  }

  /// `Главные моменты`
  String get mainPoints {
    return Intl.message(
      'Главные моменты',
      name: 'mainPoints',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Вы успешно заполнили обратную связь`
  String get feedbackSuccessfullySubmitted {
    return Intl.message(
      'Вы успешно заполнили обратную связь',
      name: 'feedbackSuccessfullySubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Родители будут уведомлены о ситуации и получат все ваши комментарии`
  String get parentsWillBeNotified {
    return Intl.message(
      'Родители будут уведомлены о ситуации и получат все ваши комментарии',
      name: 'parentsWillBeNotified',
      desc: '',
      args: [],
    );
  }

  /// `Ученики будут уведомлены о ваших комментариях`
  String get studentsWillBeNotified {
    return Intl.message(
      'Ученики будут уведомлены о ваших комментариях',
      name: 'studentsWillBeNotified',
      desc: '',
      args: [],
    );
  }

  /// `От Я до А`
  String get zToA {
    return Intl.message(
      'От Я до А',
      name: 'zToA',
      desc: '',
      args: [],
    );
  }

  /// `Start as student`
  String get startAsStudent {
    return Intl.message(
      'Start as student',
      name: 'startAsStudent',
      desc: '',
      args: [],
    );
  }

  /// `Start as Organization/club`
  String get startAsOrganizationclub {
    return Intl.message(
      'Start as Organization/club',
      name: 'startAsOrganizationclub',
      desc: '',
      args: [],
    );
  }

  /// `Log in as student`
  String get logInAsStudent {
    return Intl.message(
      'Log in as student',
      name: 'logInAsStudent',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Booking history`
  String get bookingHistory {
    return Intl.message(
      'Booking history',
      name: 'bookingHistory',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
