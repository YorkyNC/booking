import 'package:booking/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
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
import 'package:booking/src/features/seat/domain/requests/get_all_seat_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List<Map<String, dynamic>> _floorData = [
    {'id': '0', 'name': '0', 'available': 0},
    {'id': '1', 'name': '1', 'available': 0},
    {'id': '2', 'name': '2', 'available': 0},
  ];

  List<Map<String, dynamic>> _sectorData = [];

  final List<String> _startTimes = BookingDataExtractor.getStartTimes();
  final List<String> _endTimes = BookingDataExtractor.getEndTimes();

  final _formKey = GlobalKey<FormState>();
  String? _selectedFloor = '0';
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

    _selectedFloor = '0';
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _processSeatsData(List<SeatItemEntity> seats) {
    if (seats.isEmpty) return;

    _currentSeats = seats;
    final Map<String, int> floorAvailableCounts = {
      '0': 0,
      '1': 0,
      '2': 0,
    };

    for (var seat in seats) {
      if (seat.status == SeatStatus.available) {
        final floorKey = seat.floor.toString();
        if (floorAvailableCounts.containsKey(floorKey)) {
          floorAvailableCounts[floorKey] = (floorAvailableCounts[floorKey] ?? 0) + 1;
        }
      }
    }

    floorAvailableCounts.forEach((key, value) {
      debugPrint('Floor $key has $value available seats');
    });
    for (var floorData in _floorData) {
      final floorId = floorData['id'].toString();
      if (floorAvailableCounts.containsKey(floorId)) {
        floorData['available'] = floorAvailableCounts[floorId] ?? 0;
      }
    }
    final currentFloorSeats =
        seats.where((seat) => seat.floor.toString() == _selectedFloor && seat.status == SeatStatus.available).toList();

    debugPrint('Found ${currentFloorSeats.length} seats on floor $_selectedFloor');
    _loadSectorsForFloor(currentFloorSeats);

    // Mark seats as processed
    _seatsProcessed = true;
  }

  void _loadSectorsForFloor(List<SeatItemEntity> allSeats) {
    final seatsOnFloor = allSeats
        .where((seat) =>
            seat.floor.toString() == _selectedFloor && seat.status == SeatStatus.available && seat.number.isNotEmpty)
        .toList();

    debugPrint('Found ${seatsOnFloor.length} available seats on floor $_selectedFloor');
    final sectorSet = <String>{};
    for (var seat in seatsOnFloor) {
      sectorSet.add(seat.number.toUpperCase());
    }

    debugPrint('Found ${sectorSet.length} unique sectors on floor $_selectedFloor');

    // Create sector data for dropdown
    _sectorData = sectorSet.map((sector) {
      final available = seatsOnFloor.where((seat) => seat.number.toUpperCase() == sector.toUpperCase()).length;

      return {
        'id': sector,
        'name': sector,
        'available': available,
      };
    }).toList();

    _sectorData.sort((a, b) => a['id'].compareTo(b['id']));

    debugPrint('Sectors available: ${_sectorData.map((s) => s['name']).join(', ')}');
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

  void handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _dateController.text = DateFormat('dd-MM-yyyy').format(date);
    });
  }

  void handleFloorChanged(String? value, SeatBloc bloc) {
    if (value == null) return;

    setState(() {
      _selectedFloor = value;
      _selectedSector = null;
      _seatsProcessed = false;
    });

    bloc.add(SeatEvent.getAll(GetAllSeatRequest(floor: int.parse(value))));

    handleDeleteSeatSelection();
  }

  void handleSubmit() {
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

      // Here you would call your booking API or event
      // For example: bloc.add(SeatEvent.bookSeat(bookingRequest));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<SeatBloc, SeatEvent, SeatState>(
      bloc: getIt<SeatBloc>(),
      starterEvent: SeatEvent.getAll(GetAllSeatRequest(floor: _selectedFloor != null ? int.parse(_selectedFloor!) : 1)),
      builder: (context, state, bloc) {
        return state.maybeWhen(
          orElse: () {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
          error: (error) => Scaffold(
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
                      bloc.add(SeatEvent.getAll(
                          GetAllSeatRequest(floor: _selectedFloor != null ? int.parse(_selectedFloor!) : 1)));
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
                          onDateSelected: handleDateSelected,
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
          },
        );
      },
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
        child: Column(
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
