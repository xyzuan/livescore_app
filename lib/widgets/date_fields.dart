import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livescore/constant/fonts.dart';

Widget AppDateField({
  required String text,
  required IconData icon,
  required Color color,
  TextEditingController? controller,
  required BuildContext context,
}) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: SizedBox(
      height: 64,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: controller,
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (selectedDate != null) {
                controller?.text =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
              }
            },
            style: TextStyle(
                color: Colors.white, fontFamily: AppFonts().primaryFont),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: const Color(0xFF65656B),
                ),
                hintText: text,
                hintStyle: const TextStyle(color: Color(0xFF65656B)),
                border: InputBorder.none),
          ))
        ],
      ),
    ),
  );
}
