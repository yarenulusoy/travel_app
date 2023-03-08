import 'package:flutter/material.dart';
class CustomDropDown extends StatefulWidget {
  CustomDropDown(
      {Key? key,
        required this.items,
        required this.dropdownvalue

      })
      : super(key: key);

  late List<String> items;
  late String dropdownvalue;


  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 40,
      child: DropdownButton(
        value: widget.dropdownvalue,

        items: widget.items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}
