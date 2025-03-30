import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/domain/models/summary_highlight_entity.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';
import 'package:booking/src/features/review/domain/entities/analytics_entity.dart';
import 'package:booking/src/features/review/presentation/bloc/review_event.dart';
import 'package:booking/src/features/review/presentation/bloc/review_state.dart';

@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc()
      : super(
          ReviewState(
            analyticsDateFilter: DateFilter.day(
              startDate: DateTime.now(),
            ),
          ),
        ) {
    _setupHandlers();
    add(ReviewFetched());
  }

  void _setupHandlers() {
    on<ReviewFetched>(_fetchData);
    on<ReviewAnalyticsFilterChanged>(_analyticsFilterChanged);
  }

  Future<void> _fetchData(
    ReviewFetched event,
    Emitter<ReviewState> emit,
  ) async {
    emit(state.copyWith(
      analytics: null,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        conflicts: [
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 1)),
              location: "Столовая",
              eventType: EventType.conflict,
              assignedTo: UserEntity(
                id: "id",
                fullName: "Карим А",
                imageUrl:
                    "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/1196466b06600ac82d6dee064261a1ccc87b17f9",
              ),
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
            id: "id",
            createdAt: DateTime.now().subtract(const Duration(hours: 4)),
            expiresAt: DateTime.now().add(const Duration(hours: 4)),
            location: "Столовая",
            eventType: EventType.conflict,
            completedAt: DateTime.now(),
            description:
                "Курение в классе вызывает беспокойство из-за нарушения правил и угрозы здоровью. Это поведение может быть связано с давлением сверстников и стрессом. Важно обсудить с ребенком факторы стресса и установить границы. Школа предлагает консультации и программы поддержки для решения проблемы.",
            videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
            assignedTo: UserEntity(
              id: "id",
              fullName: "Арсен А",
              imageUrl:
                  "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/1196466b06600ac82d6dee064261a1ccc87b17f9",
              isMe: true,
            ),
            involvedPeople: [
              SuspectEntity(
                id: "1",
                user: UserEntity(
                  id: "id",
                  fullName: "Ертулеу Б.",
                  imageUrl:
                      "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
                ),
                description:
                    "Курение в классе вызывает беспокойство из-за нарушения правил и угрозы здоровью. Это поведение может быть связано с давлением сверстников и стрессом. Важно обсудить с ребенком факторы стресса и установить границы. Школа предлагает консультации и программы поддержки для решения проблемы.",
                highlights: [
                  SummaryHighlightEntity(
                    title: "Социальная информация",
                    content: "Текст описание обработанное ИИ",
                  ),
                  SummaryHighlightEntity(
                    title: "Еще пункт",
                    content: "Текст описание обработанное ИИ",
                  ),
                  SummaryHighlightEntity(
                    title: "Еще пункт",
                    content: "Текст описание обработанное ИИ",
                  ),
                ],
                imageUrl:
                    "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
              ),
              SuspectEntity(
                id: "2",
                user: UserEntity(
                  id: "id",
                  fullName: "Светлана С.",
                  imageUrl:
                      "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
                ),
                highlights: [
                  SummaryHighlightEntity(
                    title: "Социальная информация",
                    content: "Текст описание обработанное ИИ",
                  ),
                ],
                imageUrl:
                    "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
              ),
            ],
          ),
          EventEntity(
            id: "id",
            createdAt: DateTime.now(),
            expiresAt: DateTime.now().add(const Duration(hours: 10)),
            location: "Столовая",
            eventType: EventType.conflict,
            videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
            involvedPeople: [
              SuspectEntity(
                id: "3",
                user: UserEntity(
                  id: "id",
                  fullName: "Айсин А.",
                  imageUrl:
                      "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
                ),
                imageUrl:
                    "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
              ),
              SuspectEntity(
                id: "4",
                imageUrl:
                    "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/50e3b4ea67e0646689e32b8d3bc6819e699e3408",
              ),
            ],
            assignedTo: UserEntity(
              id: "id",
              fullName: "Арсен А.",
              imageUrl:
                  "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/1196466b06600ac82d6dee064261a1ccc87b17f9",
              isMe: true,
            ),
          ),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 16)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 3)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 10)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 16)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().add(const Duration(hours: 16)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
          EventEntity(
              id: "id",
              createdAt: DateTime.now(),
              expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
              location: "Столовая",
              eventType: EventType.conflict,
              videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4'),
        ],
        analytics: AnalyticsEntity(
          conflicts: 20,
          smoking: 0,
          cheating: 50,
          hotspot: "Кафетерия",
          troubleClass: "5Б",
        ),
      ),
    );
  }

  Future<void> _analyticsFilterChanged(
    ReviewAnalyticsFilterChanged event,
    Emitter<ReviewState> emit,
  ) async {
    if (event.dateFilter.runtimeType == state.analyticsDateFilter.runtimeType &&
        event.dateFilter is! DateFilterCustom) {
      return;
    }
    emit(
      state.copyWith(
        analyticsDateFilter: event.dateFilter,
      ),
    );
    add(ReviewFetched());
  }
}
