import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/booking/domain%20/validators.dart';
import 'package:booking/src/features/booking/presentation/booking_data_extractor.dart';
import 'package:booking/src/features/booking/presentation/components/booking_summary.dart';
import 'package:booking/src/features/booking/presentation/components/custom_date_picker.dart';
import 'package:booking/src/features/booking/presentation/components/custom_dropdown.dart';
import 'package:booking/src/features/booking/presentation/components/seat_map.dart';
import 'package:booking/src/features/booking/presentation/components/section_header.dart';
import 'package:booking/src/features/booking/presentation/components/submit_button.dart';
import 'package:booking/src/features/booking/presentation/components/time_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Data from extractor
  final List<Map<String, dynamic>> _floorData = BookingDataExtractor.getFloorData();
  final List<Map<String, dynamic>> _sectorData = BookingDataExtractor.getSectorData();
  final List<String> _startTimes = BookingDataExtractor.getStartTimes();
  final List<String> _endTimes = BookingDataExtractor.getEndTimes();

  // Form state
  final _formKey = GlobalKey<FormState>();
  String? _selectedFloor;
  String? _selectedSector;
  DateTime? _selectedDate;
  String? _selectedStartTime;
  String? _selectedEndTime;
  final TextEditingController _dateController = TextEditingController();

  // Seat selection state
  String? _selectedRow;
  String? _selectedPlace;
  bool _showBookingSummary = false;
  List<List<int>> _seatStatus = [];

  @override
  void initState() {
    super.initState();
    _seatStatus = BookingDataExtractor.initializeSeatMap();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _selectSeat(int rowIndex, int columnIndex) {
    if (_seatStatus[rowIndex][columnIndex] == 0 || _seatStatus[rowIndex][columnIndex] == 2) {
      setState(() {
        if (_seatStatus[rowIndex][columnIndex] == 2) {
          _seatStatus[rowIndex][columnIndex] = 0;
          _selectedRow = null;
          _selectedPlace = null;
          _showBookingSummary = false;
        } else {
          // Clear any previously selected seat
          for (int r = 0; r < _seatStatus.length; r++) {
            for (int c = 0; c < _seatStatus[r].length; c++) {
              if (_seatStatus[r][c] == 2) {
                _seatStatus[r][c] = 0;
              }
            }
          }

          // Select the new seat
          _seatStatus[rowIndex][columnIndex] = 2;
          _selectedRow = (rowIndex + 1).toString();
          _selectedPlace = (columnIndex + 1).toString();
          _showBookingSummary = true;
        }
      });
    }
  }

  void _handleDeleteSeatSelection() {
    setState(() {
      for (int r = 0; r < _seatStatus.length; r++) {
        for (int c = 0; c < _seatStatus[r].length; c++) {
          if (_seatStatus[r][c] == 2) {
            _seatStatus[r][c] = 0;
          }
        }
      }
      _showBookingSummary = false;
      _selectedRow = null;
      _selectedPlace = null;
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final bookingDetails = BookingDataExtractor.formatBookingDetails(
        floor: _selectedFloor,
        sector: _selectedSector,
        date: _dateController.text,
        startTime: _selectedStartTime,
        endTime: _selectedEndTime,
        row: _selectedRow,
        place: _selectedPlace,
      );

      debugPrint('Booking details: $bookingDetails');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => context.pop(),
        ),
        backgroundColor: context.colors.gray100,
        title: Text(
          'Book the place',
          style: context.typography.displayxsSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: context.colors.gray100,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SectionHeader(text: 'Choose floor'),
                const SizedBox(height: 10),
                CustomDropdown(
                  context: context,
                  items: _floorData,
                  hintText: 'Floor',
                  valueKey: 'id',
                  displayKey: 'name',
                  countKey: 'available',
                  value: _selectedFloor,
                  validator: Validators.requiredFieldValidator('floor'),
                  onChanged: (value) => setState(() => _selectedFloor = value),
                ),
                const SizedBox(height: 20),
                const SectionHeader(text: 'Choose sector'),
                const SizedBox(height: 10),
                CustomDropdown(
                  context: context,
                  items: _sectorData,
                  hintText: 'Sector',
                  valueKey: 'id',
                  displayKey: 'name',
                  countKey: 'available',
                  value: _selectedSector,
                  validator: Validators.requiredFieldValidator('sector'),
                  onChanged: (value) => setState(() => _selectedSector = value),
                ),
                const SizedBox(height: 20),
                const SectionHeader(text: 'Choose Date'),
                const SizedBox(height: 10),
                CustomDatePicker(
                  context: context,
                  controller: _dateController,
                  selectedDate: _selectedDate,
                  onDateSelected: (date) => setState(() => _selectedDate = date),
                ),
                const SizedBox(height: 20),
                const SectionHeader(text: 'Time Range'),
                const SizedBox(height: 10),
                TimeRangePicker(
                  context: context,
                  startTimes: _startTimes,
                  endTimes: _endTimes,
                  selectedStartTime: _selectedStartTime,
                  selectedEndTime: _selectedEndTime,
                  validator: Validators.requiredFieldValidator('time'),
                  onStartTimeChanged: (value) {
                    setState(() {
                      _selectedStartTime = value;
                      // Reset end time if needed
                      if (_selectedEndTime != null) {
                        final startIndex = _startTimes.indexOf(value!);
                        final endIndex = _endTimes.indexOf(_selectedEndTime!);
                        if (endIndex <= startIndex) {
                          _selectedEndTime = null;
                        }
                      }
                    });
                  },
                  onEndTimeChanged: (value) => setState(() => _selectedEndTime = value),
                ),
                const SizedBox(height: 30),
                const SectionHeader(text: 'Map'),
                const SizedBox(height: 20),
                SeatMap(
                  seatStatus: _seatStatus,
                  onSeatSelected: _selectSeat,
                ),
                const SizedBox(height: 10),
                if (_showBookingSummary)
                  BookingSummary(
                    selectedFloor: _selectedFloor,
                    selectedSector: _selectedSector,
                    selectedRow: _selectedRow,
                    selectedPlace: _selectedPlace,
                    date: _dateController.text,
                    selectedStartTime: _selectedStartTime,
                    selectedEndTime: _selectedEndTime,
                    onDelete: _handleDeleteSeatSelection,
                  ),
                const SizedBox(height: 30),
                SubmitButton(
                  onPressed: () {
                    _handleSubmit();
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
