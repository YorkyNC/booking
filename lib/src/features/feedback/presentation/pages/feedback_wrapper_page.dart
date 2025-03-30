import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';

class FeedbackWrapperPage extends StatelessWidget {
  const FeedbackWrapperPage({
    super.key,
    required this.eventId,
    this.event,
    required this.child,
  });

  final String eventId;
  final EventEntity? event;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FeedbackBloc>(
        param1: eventId,
        param2: event,
      ),
      child: child,
    );
  }
}
