import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/features/events/domain/requests/get_all_events_request.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';

@lazySingleton
class GetAllEventsUseCase extends UseCase<List<EventEntity>, GetAllEventsRequest> {
  GetAllEventsUseCase();

  final _mockEvents = [
    EventEntity(
      id: "id",
      createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 0)),
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now().subtract(const Duration(hours: 3, minutes: 50)),
      expiresAt: DateTime.now().add(const Duration(hours: 3)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 5)),
      expiresAt: DateTime.now().add(const Duration(hours: 10)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now().subtract(const Duration(hours: 6, minutes: 10)),
      expiresAt: DateTime.now().add(const Duration(hours: 16)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
      completedAt: DateTime.now().subtract(
        const Duration(hours: 6),
      ),
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 3)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 10)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.cheating,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 16)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.cheating,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.cheating,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 16)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.cheating,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().subtract(const Duration(hours: 3)),
      location: "Столовая",
      eventType: EventType.conflict,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
    EventEntity(
      id: "id",
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      location: "Столовая",
      eventType: EventType.smoking,
      videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_2MB.mp4',
    ),
  ];

  @override
  Future<Either<DomainException, List<EventEntity>>> execute(GetAllEventsRequest requestModel) async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(_mockEvents);
  }
}
