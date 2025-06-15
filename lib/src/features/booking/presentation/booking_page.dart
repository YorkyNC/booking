import 'dart:async';

import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/core/services/storage/storage_service_impl.dart';
import 'package:booking/src/features/booking/domain%20/validators.dart';
import 'package:booking/src/features/booking/presentation/booking_data_extractor.dart';
import 'package:booking/src/features/booking/presentation/components/booking_summary.dart';
import 'package:booking/src/features/booking/presentation/components/custom_date_picker.dart';
import 'package:booking/src/features/booking/presentation/components/custom_dropdown.dart';
import 'package:booking/src/features/booking/presentation/components/section_header.dart';
import 'package:booking/src/features/booking/presentation/components/submit_button.dart';
import 'package:booking/src/features/booking/presentation/components/time_range_picker.dart';
import 'package:booking/src/features/seat/bloc/bloc/seat_bloc.dart';
import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/get_all_seat_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final StorageServiceImpl st = StorageServiceImpl();

  final List<Map<String, dynamic>> _floorData = [
    {'id': '0', 'name': '0', 'available': 100},
    {'id': '1', 'name': '1', 'available': 50},
    {'id': '2', 'name': '2', 'available': 100},
  ];

  List<Map<String, dynamic>> _sectorData = [];

  final List<String> _startTimes = BookingDataExtractor.getStartTimes();
  final List<String> _endTimes = BookingDataExtractor.getEndTimes();

  final _formKey = GlobalKey<FormState>();
  String? _selectedFloor;
  String? _selectedSector;
  DateTime? _selectedDate;
  String? _selectedStartTime;
  String? _selectedEndTime;
  final TextEditingController _dateController = TextEditingController();

  String? _selectedRow;
  String? _selectedPlace;
  SeatItemEntity? _selectedSeat;
  bool _showBookingSummary = false;
  List<List<int>> _seatStatus = [];

  bool _seatsProcessed = false;
  List<SeatItemEntity> _currentSeats = [];

  @override
  void initState() {
    super.initState();
    _seatStatus = BookingDataExtractor.initializeSeatMap();

    // Initialize default date and time values
    _selectedDate = DateTime.now();
    _dateController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);

    // Default times (9:00 AM to 5:00 PM)
    _selectedStartTime = '09:00';
    _selectedEndTime = '17:00';
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  GetAllSeatRequest _createGetAllSeatRequest(String floorValue) {
    final date = _selectedDate ?? DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);

    // Use default times if not selected
    final startTimeStr = _selectedStartTime ?? '09:00';
    final endTimeStr = _selectedEndTime ?? '17:00';

    final startIsoString = _formatTimeAsIso8601(date, startTimeStr);
    final endIsoString = _formatTimeAsIso8601(date, endTimeStr);

    return GetAllSeatRequest(
      floor: int.parse(floorValue),
      date: formattedDate,
      startTime: startIsoString,
      endTime: endIsoString,
    );
  }

  String _formatTimeAsIso8601(DateTime baseDate, String timeStr) {
    final parts = timeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    final dateTime = DateTime(baseDate.year, baseDate.month, baseDate.day, hour, minute);

    return dateTime.toIso8601String();
  }

  void _processSeatsData(List<SeatItemEntity> seats) {
    if (seats.isEmpty) return;

    _currentSeats = seats;
    final Map<String, int> floorAvailableCounts = {
      '0': 0,
      '1': 0,
      '2': 0,
    };

    // Update available counts for each floor
    for (var seat in seats) {
      if (seat.status == SeatStatus.available) {
        final floor = seat.floor.toString();
        if (floorAvailableCounts.containsKey(floor)) {
          floorAvailableCounts[floor] = (floorAvailableCounts[floor] ?? 0) + 1;
        }
      }
    }

    // Only update floor counts if we have actual seat data
    if (seats.isNotEmpty) {
      for (var floor in _floorData) {
        final floorId = floor['id'] as String;
        floor['available'] = floorAvailableCounts[floorId] ?? 0;
      }
    }

    // Set initial floor if not set
    if (_selectedFloor == null && _floorData.isNotEmpty) {
      _selectedFloor = _floorData.first['id'];
    }

    final currentFloorSeats =
        seats.where((seat) => seat.floor.toString() == _selectedFloor && seat.status == SeatStatus.available).toList();

    _loadSectorsForFloor(currentFloorSeats);
    _seatsProcessed = true;
  }

  void _loadSectorsForFloor(List<SeatItemEntity> allSeats) {
    final seatsOnFloor = allSeats
        .where((seat) =>
            seat.floor.toString() == _selectedFloor && seat.status == SeatStatus.available && seat.number.isNotEmpty)
        .toList();

    final sectorSet = <String>{};
    for (var seat in seatsOnFloor) {
      sectorSet.add(seat.number.toUpperCase());
    }

    _sectorData = sectorSet.map((sector) {
      final available = seatsOnFloor.where((seat) => seat.number.toUpperCase() == sector.toUpperCase()).length;

      return {
        'id': sector,
        'name': sector,
        'available': available,
      };
    }).toList();

    _sectorData.sort((a, b) => a['id'].compareTo(b['id']));
  }

  // Update seat selection
  void selectSeat(int rowIndex, int columnIndex) {
    if (_seatStatus[rowIndex][columnIndex] == 0 || _seatStatus[rowIndex][columnIndex] == 2) {
      setState(() {
        if (_seatStatus[rowIndex][columnIndex] == 2) {
          _seatStatus[rowIndex][columnIndex] = 0;
          _selectedRow = null;
          _selectedPlace = null;
          _selectedSeat = null;
          _showBookingSummary = false;
        } else {
          BookingDataExtractor.clearSelectedSeat(_seatStatus);

          // Select the new seat
          _seatStatus[rowIndex][columnIndex] = 2;
          _selectedRow = (rowIndex + 1).toString();
          _selectedPlace = (columnIndex + 1).toString();
          _showBookingSummary = true;
        }
      });
    }
  }

  void _selectApiSeat(SeatItemEntity seat) {
    setState(() {
      _selectedSeat = seat;
      _selectedRow = seat.number;
      _selectedPlace = seat.location;
      _showBookingSummary = true;
      BookingDataExtractor.clearSelectedSeat(_seatStatus);

      debugPrint('Selected seat: ${seat.number}, id: ${seat.id}, location: ${seat.location}');
    });
  }

  void handleDeleteSeatSelection() {
    setState(() {
      BookingDataExtractor.clearSelectedSeat(_seatStatus);
      _showBookingSummary = false;
      _selectedRow = null;
      _selectedPlace = null;
      _selectedSeat = null;
    });
  }

  void handleDateSelected(DateTime date, SeatBloc bloc) {
    setState(() {
      _selectedDate = date;
      _dateController.text = DateFormat('dd-MM-yyyy').format(date);
    });
    bloc.add(SeatEvent.getAll(_createGetAllSeatRequest(_selectedFloor!)));
  }

  void handleFloorChanged(String? value, SeatBloc bloc) {
    if (value == null) return;

    setState(() {
      _selectedFloor = value;
      _selectedSector = null;
      _seatsProcessed = false;
    });

    bloc.add(SeatEvent.getAll(_createGetAllSeatRequest(value)));
    handleDeleteSeatSelection();
  }

  void handleSubmit() {
    final formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    final startIsoString = _formatTimeAsIso8601(_selectedDate!, _selectedStartTime!);
    final endIsoString = _formatTimeAsIso8601(_selectedDate!, _selectedEndTime!);

    final CreateReservationRequest request = CreateReservationRequest(
      seatId: _selectedSeat!.id,
      startTime: startIsoString,
      endTime: endIsoString,
      date: formattedDate,
    );

    debugPrint('Creating reservation: ${request.toJson()}');

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Creating reservation...'),
              ],
            ),
          ),
        );
      },
    );

    // Get the BLoC and dispatch the event
    final bookingBloc = getIt<SeatBloc>();
    bookingBloc.add(SeatEvent.createReservation(request));

    // Listen for state changes using a subscription to handle completion
    late final StreamSubscription subscription;
    subscription = bookingBloc.stream.listen((state) {
      state.maybeWhen(
        loaded: (data) {
          // Close loading dialog
          context.pop();

          // Cancel subscription to prevent memory leaks
          subscription.cancel();

          // Show success dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext dialogContext) {
              return ReservationDialog(
                isSuccess: true,
                message: 'Your reservation has been successfully created.',
                reservationDetails: {
                  'Floor': _selectedFloor ?? 'N/A',
                  'Sector': _selectedSector ?? 'N/A',
                  'Seat': '${_selectedSeat?.number ?? 'N/A'}, Location: ${_selectedSeat?.location ?? 'N/A'}',
                  'Date': _dateController.text,
                  'Time': '$_selectedStartTime - $_selectedEndTime',
                },
                buttonText: 'Done',
                onButtonPressed: () {
                  Navigator.of(dialogContext).pop();
                  // Optionally navigate back or reset form
                  setState(() {
                    // Reset form state after successful booking
                    _showBookingSummary = false;
                    _selectedSeat = null;
                    _selectedRow = null;
                    _selectedPlace = null;
                  });
                },
              );
            },
          );
        },
        error: (errorMessage) {
          // Close loading dialog
          context.pop();

          // Cancel subscription to prevent memory leaks
          subscription.cancel();

          // Show error dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext dialogContext) {
              return ReservationDialog(
                isSuccess: false,
                message: 'Unable to create reservation.',
                reservationDetails: {
                  'Error': errorMessage,
                },
                buttonText: 'Try Again',
                onButtonPressed: () {
                  dialogContext.pop();
                },
              );
            },
          );
        },
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<SeatBloc, SeatEvent, SeatState>(
      bloc: getIt<SeatBloc>(),
      starterEvent: SeatEvent.getAll(_createGetAllSeatRequest(_selectedFloor ?? '1')),
      builder: (context, state, bloc) {
        return state.maybeWhen(
          orElse: () {
            return Scaffold(
              backgroundColor: context.colors.gray100,
              body: const Center(child: CircularProgressIndicator()),
            );
          },
          error: (error) => Scaffold(
            backgroundColor: context.colors.gray100,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: $error',
                    style: context.typography.displayxsSemibold,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(SeatEvent.getAll(_createGetAllSeatRequest(_selectedFloor!)));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
          loaded: (viewModel) {
            final seats = viewModel.allSeat?.data ?? [];
            if (!_seatsProcessed && seats.isNotEmpty) {
              _processSeatsData(seats);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) setState(() {});
              });
            }

            return _buildMainScaffold(context, bloc, seats);
          },
        );
      },
    );
  }

  // Extract the main Scaffold to a separate method for better code organization
  Widget _buildMainScaffold(BuildContext context, SeatBloc bloc, List<SeatItemEntity> seats) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      bloc.add(SeatEvent.repeatLast(RepeatLastRequest(userId: st.getUserId()!)));
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: context.colors.error500,
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.replay),
                  label: const Text('Repeat last booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.buttonColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
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
                  onChanged: (value) {
                    if (value != null) {
                      handleFloorChanged(value, bloc);
                    }
                  },
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
                  onDateSelected: (date) => handleDateSelected(date, bloc),
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
                      if (_selectedEndTime != null) {
                        final startIndex = _startTimes.indexOf(value!);
                        final endIndex = _endTimes.indexOf(_selectedEndTime!);
                        if (endIndex <= startIndex) {
                          _selectedEndTime = null;
                        }
                      }
                    });
                    bloc.add(SeatEvent.getAll(_createGetAllSeatRequest(_selectedFloor!)));
                  },
                  onEndTimeChanged: (value) {
                    setState(() => _selectedEndTime = value);
                    bloc.add(SeatEvent.getAll(_createGetAllSeatRequest(_selectedFloor!)));
                  },
                ),
                const SizedBox(height: 30),
                const SectionHeader(text: 'Map'),
                const SizedBox(height: 20),
                _buildSeatList(seats),
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
                    onDelete: handleDeleteSeatSelection,
                  ),
                const SizedBox(height: 30),
                SubmitButton(
                  onPressed: handleSubmit,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSeatList(List<SeatItemEntity> seats) {
    if (seats.isEmpty) {
      return const SizedBox(
        height: 350,
        child: Center(
          child: Text('No seats available'),
        ),
      );
    }

    final filteredSeats = seats.where((seat) {
      if (seat.number.isEmpty) {
        return false;
      }

      // Check if seat is on the selected floor
      if (seat.floor.toString() != _selectedFloor) {
        return false;
      }
      if (_selectedSector != null && _selectedSector!.isNotEmpty) {
        return seat.number.toUpperCase() == _selectedSector!.toUpperCase();
      }
      return true;
    }).toList();
    if (filteredSeats.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('No available seats match your criteria'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedSector = null;
                  });
                },
                child: const Text('Show All Available Seats'),
              ),
            ],
          ),
        ),
      );
    }
    const int numColumns = 5;
    int totalSeats = filteredSeats.length;
    int numRows = (totalSeats / numColumns).ceil();
    numRows = numRows < 6 ? 6 : numRows;
    debugPrint('Creating seat map with $numColumns columns and $numRows rows for $totalSeats seats');

    List<List<int>> seatLayout = List.generate(numRows, (_) => List.filled(numColumns, -1)); // -1 = no seat

    Map<String, SeatItemEntity> seatsByPosition = {};

    for (int i = 0; i < filteredSeats.length; i++) {
      final seat = filteredSeats[i];
      final row = i ~/ numColumns;
      final col = i % numColumns;

      if (row >= numRows || col >= numColumns) continue;

      seatsByPosition["$row-$col"] = seat;

      // Set the seat status
      if (seat.status == SeatStatus.available) {
        seatLayout[row][col] = 0;
      } else {
        seatLayout[row][col] = 1;
      }

      // Mark selected seat
      if (_selectedSeat?.id == seat.id) {
        seatLayout[row][col] = 2;
      }
    }

    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: context.colors.gray200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.gray400,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: numRows <= 6
                  ? _buildFixedSeatGrid(numColumns, numRows, seatLayout, seatsByPosition)
                  : _buildScrollableSeatGrid(numColumns, numRows, seatLayout, seatsByPosition),
            ),
            const SizedBox(height: 12),
            Divider(color: context.colors.gray400, height: 1),
            const SizedBox(height: 12),
            // Legend for seat status
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSeatLegendItem(context.colors.white, 'Available'),
                const SizedBox(width: 20),
                _buildSeatLegendItem(Colors.red, 'Reserved'),
                const SizedBox(width: 20),
                _buildSeatLegendItem(Colors.blue, 'Selected'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedSeatGrid(
      int numColumns, int numRows, List<List<int>> seatLayout, Map<String, SeatItemEntity> seatsByPosition) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(numColumns * 2 - 1, (index) {
        if (index % 2 == 0) {
          final colIndex = index ~/ 2;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(numRows, (rowIndex) {
              final seatStatus = seatLayout[rowIndex][colIndex];
              final position = "$rowIndex-$colIndex";
              final seat = seatsByPosition[position];

              if (seatStatus == -1) {
                return const SizedBox(width: 30, height: 30);
              }

              final bool isReserved = seatStatus == 1;
              final bool isSelected = seatStatus == 2;

              // Render the seat
              return GestureDetector(
                onTap: () {
                  // Only allow selection of available seats
                  if (!isReserved && seat != null) {
                    _selectApiSeat(seat);
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: isReserved
                        ? Colors.red
                        : isSelected
                            ? Colors.blue
                            : context.colors.white,
                    border: Border.all(
                      color: context.colors.gray400,
                      width: 1,
                    ),
                  ),
                  child: seat != null
                      ? Center(
                          child: Text(
                            seat.number,
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected || isReserved ? Colors.white : context.colors.black,
                            ),
                          ),
                        )
                      : null,
                ),
              );
            }),
          );
        } else {
          return Container(
            width: 12,
            color: context.colors.gray600,
          );
        }
      }),
    );
  }

  Widget _buildScrollableSeatGrid(
      int numColumns, int numRows, List<List<int>> seatLayout, Map<String, SeatItemEntity> seatsByPosition) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(numRows, (rowIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(numColumns * 2 - 1, (index) {
                if (index % 2 == 0) {
                  final colIndex = index ~/ 2;

                  // Check if we have a valid position
                  if (rowIndex >= numRows || colIndex >= numColumns) {
                    return const SizedBox(width: 30, height: 30);
                  }

                  final seatStatus = seatLayout[rowIndex][colIndex];
                  final position = "$rowIndex-$colIndex";
                  final seat = seatsByPosition[position];
                  if (seatStatus == -1) {
                    return const SizedBox(width: 30, height: 30);
                  }

                  final bool isReserved = seatStatus == 1;
                  final bool isSelected = seatStatus == 2;

                  return GestureDetector(
                    onTap: () {
                      if (!isReserved && seat != null) {
                        _selectApiSeat(seat);
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isReserved
                            ? Colors.red
                            : isSelected
                                ? Colors.blue
                                : context.colors.white,
                        border: Border.all(
                          color: context.colors.gray400,
                          width: 1,
                        ),
                      ),
                      child: seat != null
                          ? Center(
                              child: Text(
                                seat.number,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected || isReserved ? Colors.white : context.colors.black,
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                } else {
                  return Container(
                    width: 12,
                    height: 30,
                    color: context.colors.gray600,
                  );
                }
              }),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSeatLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ReservationDialog extends StatelessWidget {
  final bool isSuccess;
  final String message;
  final Map<String, String>? reservationDetails;
  final VoidCallback onButtonPressed;
  final String buttonText;

  const ReservationDialog({
    Key? key,
    required this.isSuccess,
    required this.message,
    this.reservationDetails,
    required this.onButtonPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Icon
          _buildStatusIcon(),
          const SizedBox(height: 16),

          // Title
          Text(
            isSuccess ? 'Success!' : 'Failed',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isSuccess ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 16),

          // Message
          Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Details if available
          if (reservationDetails != null) ...[
            const Divider(),
            const SizedBox(height: 8),
            _buildReservationDetails(),
            const SizedBox(height: 16),
          ],

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isSuccess ? Colors.green : Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onButtonPressed,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSuccess ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isSuccess ? Icons.check_circle_outline : Icons.error_outline,
        size: 40,
        color: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _buildReservationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reservationDetails!.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${entry.key}: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Text(
                  entry.value,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
