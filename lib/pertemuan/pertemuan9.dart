import 'package:flutter/material.dart';

class Pertemuan9Page extends StatefulWidget {
  const Pertemuan9Page({super.key});

  @override
  State<Pertemuan9Page> createState() => _Pertemuan9PageState();
}

class _Pertemuan9PageState extends State<Pertemuan9Page> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTimeRange? selectedRange;

  Future<void> pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Future<void> pickDateRange() async {
    final DateTimeRange? range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (range != null) {
      setState(() {
        selectedRange = range;
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Belum dipilih";
    return "${date.day}-${date.month}-${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 9"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: pickDate,
              child: const Text("Pilih Tanggal"),
            ),
            Text("Tanggal: ${formatDate(selectedDate)}"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickTime,
              child: const Text("Pilih Waktu"),
            ),
            Text(
              "Waktu: ${selectedTime == null ? 'Belum dipilih' : selectedTime!.format(context)}",
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickDateRange,
              child: const Text("Pilih Rentang Tanggal"),
            ),
            Text(
              selectedRange == null
                  ? "Rentang: Belum dipilih"
                  : "Rentang: ${formatDate(selectedRange!.start)} sampai ${formatDate(selectedRange!.end)}",
            ),
          ],
        ),
      ),
    );
  }
}
