import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_event.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';
import 'package:booking/src/features/camera/presentation/components/camera_search_app_bar.dart';

class CameraSearchView extends StatefulWidget {
  final String initialQuery;
  final String heroTag;

  const CameraSearchView({super.key, required this.initialQuery, required this.heroTag});

  @override
  State<CameraSearchView> createState() => _CameraSearchViewState();
}

class _CameraSearchViewState extends State<CameraSearchView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    if (widget.initialQuery.isNotEmpty) {
      context.read<CameraBloc>().add(CameraSearchChanged(widget.initialQuery));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: CameraSearchAppBar(
          heroTag: widget.heroTag,
        ),
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            if (state.cameraSections == null) {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: context.colors.brand100,
                  ),
                ),
              );
            }
            // final result = state.se
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
