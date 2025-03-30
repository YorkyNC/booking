import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../core/theme/typography.dart';

class TermSortBySheetWidget extends StatefulWidget {
  final String title;
  final Function(int?) onTermSelected;
  final int? currentTerm;

  const TermSortBySheetWidget({
    super.key,
    required this.title,
    required this.onTermSelected,
    this.currentTerm,
  });

  @override
  SortBySheetState createState() => SortBySheetState();
}

class SortBySheetState extends State<TermSortBySheetWidget> {
  late int? selectedTerm = widget.currentTerm;
  BoxDecoration _getBoxDecoration(int? term) {
    return BoxDecoration(
      color: selectedTerm == term ? const Color(0xFFDBF0F1) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    );
  }

  late String selectedOption = context.loc.byAlphabet;

  void _onOptionSelected(int? term) {
    setState(() {
      selectedTerm = term;
    });
    widget.onTermSelected(term);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const FigmaTextStyles().typography4Medium.copyWith(
                    color: context.colors.black,
                  ),
            ),
            const SizedBox(height: 12),
            _buildOption(term: 1, label: 'I Четверть'),
            _buildOption(term: 2, label: 'II Четверть'),
            _buildOption(term: 3, label: 'III Четверть'),
            _buildOption(term: 4, label: 'IV Четверть'),
            _buildOption(term: null, label: 'Итоговые'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required int? term,
    required String label,
  }) {
    return GestureDetector(
      onTap: () => _onOptionSelected(term),
      child: Container(
        decoration: _getBoxDecoration(term),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: const FigmaTextStyles().typography3Medium.copyWith(
                    color: context.colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
