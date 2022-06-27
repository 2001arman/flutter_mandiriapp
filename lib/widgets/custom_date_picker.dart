import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.controllerValue})
      : super(key: key);

  final String title, hint;
  final TextEditingController controller;
  final TextEditingController controllerValue;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(widget.title),
        SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: TextField(
                enabled: false,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2020, 3, 5),
                  maxTime: DateTime.now(),
                  onChanged: (date) {
                    String tanggal =
                        DateFormat("EEEE, d MMMM yyyy", "id_ID").format(date);
                    widget.controller.text = tanggal;
                    widget.controllerValue.text = date.toString();
                    setState(() {});
                  },
                  onConfirm: (date) {
                    String tanggal =
                        DateFormat("EEEE, d MMMM yyyy", "id_ID").format(date);
                    widget.controller.text = tanggal;
                    widget.controllerValue.text = date.toString();
                    setState(() {});
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.id,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/calendar.png"),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
