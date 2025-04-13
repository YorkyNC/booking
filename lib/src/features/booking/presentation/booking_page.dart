import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
    {'id': '1', 'name': '1', 'available': 54},
    {'id': '2', 'name': '2', 'available': 8},
    {'id': '3', 'name': '3', 'available': 21},
  ];

  final List<Map<String, dynamic>> _sectorData = [
    {'id': 'A', 'name': 'Sector A', 'available': 54},
    {'id': 'B', 'name': 'Sector B', 'available': 8},
    {'id': 'C', 'name': 'Sector C', 'available': 21},
  ];

  final List<String> _startTimes = ['08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00'];

  final List<String> _endTimes = ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'];

  final _formKey = GlobalKey<FormState>();
  String? _selectedFloor;
  String? _selectedSector;
  DateTime? _selectedDate;
  String? _selectedStartTime;
  String? _selectedEndTime;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  List<List<int>> _seatStatus = [];

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  String? _selectedRow;
  String? _selectedPlace;
  bool _showBookingSummary = false;

  void _initializeSeats() {
    _seatStatus = List.generate(
      6,
      (_) => List.generate(
        5,
        (_) => 0,
      ),
    );

    final List<List<int>> reservedSeats = [
      [0, 0],
      [0, 3],
      [1, 1],
      [1, 4],
      [2, 0],
      [2, 2],
      [3, 3],
      [3, 4],
      [4, 1],
      [4, 3],
      [5, 0],
      [5, 2]
    ];

    for (var seat in reservedSeats) {
      if (seat[0] < _seatStatus.length && seat[1] < _seatStatus[0].length) {
        _seatStatus[seat[0]][seat[1]] = 1;
      }
    }

    print('Initialized seat map with ${reservedSeats.length} reserved seats');
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
                _buildSectionHeader(context, 'Choose floor'),
                const SizedBox(height: 10),
                _buildDropdown(
                  context: context,
                  items: _floorData,
                  hintText: 'Floor',
                  valueKey: 'id',
                  displayKey: 'name',
                  countKey: 'available',
                  value: _selectedFloor,
                  validator: _requiredFieldValidator('floor'),
                  onChanged: (value) => setState(() => _selectedFloor = value),
                ),
                const SizedBox(height: 20),
                _buildSectionHeader(context, 'Choose sector'),
                const SizedBox(height: 10),
                _buildDropdown(
                  context: context,
                  items: _sectorData,
                  hintText: 'Sector',
                  valueKey: 'id',
                  displayKey: 'name',
                  countKey: 'available',
                  value: _selectedSector,
                  validator: _requiredFieldValidator('sector'),
                  onChanged: (value) => setState(() => _selectedSector = value),
                ),
                const SizedBox(height: 20),
                _buildSectionHeader(context, 'Choose Date'),
                const SizedBox(height: 10),
                _buildDatePicker(context),
                const SizedBox(height: 20),
                _buildSectionHeader(context, 'Time Range'),
                const SizedBox(height: 10),
                _buildTimeRangePicker(context),
                const SizedBox(height: 30),
                _buildSectionHeader(context, 'Map'),
                const SizedBox(height: 20),
                _buildSeatMap(context),
                const SizedBox(height: 10),
                _buildBookingSummary(context),
                const SizedBox(height: 30),
                _buildSubmitButton(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingSummary(BuildContext context) {
    if (!_showBookingSummary) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.gray300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You are booking',
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Floor: ${_selectedFloor ?? "1"}, Sector: ${_selectedSector ?? "'A'"}, Row: $_selectedRow, Place: $_selectedPlace',
                style: context.typography.textsmMedium.copyWith(
                  color: context.colors.blue800,
                ),
              ),
              GestureDetector(
                onTap: () {
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
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Date: ${_dateController.text.isNotEmpty ? _dateController.text : "17.02.2025"}',
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.black,
            ),
          ),
          Text(
            'Time: ${_selectedStartTime ?? "12:00"} - ${_selectedEndTime ?? "14:00"}',
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.black,
            ),
          ),
        ],
      ),
    );
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
          for (int r = 0; r < _seatStatus.length; r++) {
            for (int c = 0; c < _seatStatus[r].length; c++) {
              if (_seatStatus[r][c] == 2) {
                _seatStatus[r][c] = 0;
              }
            }
          }

          _seatStatus[rowIndex][columnIndex] = 2;
          _selectedRow = (rowIndex + 1).toString();
          _selectedPlace = (columnIndex + 1).toString();
          _showBookingSummary = true;
        }
      });
    }
  }

  Widget _buildSeatMap(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(10, (columnIndex) {
                      if (columnIndex % 2 == 0) {
                        return Container(
                          width: 12,
                          color: context.colors.gray600,
                        );
                      } else {
                        final seatColumn = (columnIndex ~/ 2);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (rowIndex) {
                            final status = _seatStatus[rowIndex][seatColumn];

                            final bool isReserved = status == 1;
                            final bool isSelected = status == 2;

                            return GestureDetector(
                              onTap: () {
                                if (isReserved) return;

                                _selectSeat(rowIndex, seatColumn);
                              },
                              child: Container(
                                width: 22,
                                height: 22,
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
                              ),
                            );
                          }),
                        );
                      }
                    }),
                  ),
                ),
                const SizedBox(height: 12),
                Divider(color: context.colors.gray400, height: 1),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSeatOptions(context, context.colors.white, 'Available'),
                    const SizedBox(width: 20),
                    _buildSeatOptions(context, Colors.red, 'Reserved'),
                    const SizedBox(width: 20),
                    _buildSeatOptions(context, Colors.blue, 'Selected'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeatOptions(BuildContext context, Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: context.colors.gray400,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.typography.textsmRegular.copyWith(
            color: context.colors.gray700,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String text) {
    return Text(
      text,
      style: context.typography.textmdMedium.copyWith(
        color: context.colors.black,
      ),
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required List<Map<String, dynamic>> items,
    required String hintText,
    required String valueKey,
    required String displayKey,
    required String countKey,
    required String? value,
    required String? Function(String?)? validator,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.buttonColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.error300),
        ),
      ),
      hint: Text(
        hintText,
        style: context.typography.textmdMedium.copyWith(
          color: context.colors.gray500,
        ),
      ),
      value: value,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item[valueKey],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item[displayKey],
                      style: context.typography.textmdMedium.copyWith(
                        color: context.colors.black,
                      ),
                    ),
                    Text(
                      item[countKey].toString(),
                      style: context.typography.textmdMedium.copyWith(
                        color: context.colors.gray700,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onChanged,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.buttonColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colors.error300),
        ),
        hintText: 'DD-MM-YYYY',
        hintStyle: context.typography.textmdMedium.copyWith(
          color: context.colors.gray500,
        ),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: context.colors.gray500,
          size: 20,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Widget _buildTimeRangePicker(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.gray300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.gray300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.buttonColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.error300),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            hint: Text(
              '12:00',
              style: context.typography.textmdMedium.copyWith(
                color: context.colors.gray500,
              ),
            ),
            value: _selectedStartTime,
            items: _startTimes
                .map((time) => DropdownMenuItem<String>(
                      value: time,
                      child: Text(
                        time,
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ))
                .toList(),
            validator: _requiredFieldValidator('start time'),
            onChanged: (value) {
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
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.arrow_forward,
            color: context.colors.gray700,
            size: 20,
          ),
        ),
        Expanded(
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            hint: Text(
              '14:00',
              style: context.typography.textmdMedium.copyWith(
                color: context.colors.gray500,
              ),
            ),
            value: _selectedEndTime,
            items: _endTimes
                .where((time) {
                  if (_selectedStartTime == null) return true;
                  final startIndex = _startTimes.indexOf(_selectedStartTime!);
                  final endIndex = _endTimes.indexOf(time);
                  return endIndex > startIndex;
                })
                .map((time) => DropdownMenuItem<String>(
                      value: time,
                      child: Text(
                        time,
                        style: context.typography.textmdMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ))
                .toList(),
            validator: _requiredFieldValidator('end time'),
            onChanged: (value) => setState(() => _selectedEndTime = value),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _handleSubmit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Book Now',
                style: context.typography.textmdMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? Function(String?) _requiredFieldValidator(String fieldName) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please select a $fieldName.';
      }
      return null;
    };
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      debugPrint('Booking details: Floor: $_selectedFloor, Sector: $_selectedSector, '
          'Date: ${_dateController.text}, Time: $_selectedStartTime - $_selectedEndTime');
    }
  }
}
