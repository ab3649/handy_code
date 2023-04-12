import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model.dart';

class CustomKeyboardCard extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const CustomKeyboardCard({Key? key, required this.controller, required this.focusNode}) : super(key: key);

  @override
  _CustomKeyboardCardState createState() => _CustomKeyboardCardState();
}

class _CustomKeyboardCardState extends State<CustomKeyboardCard> {
  late List<List<dynamic>> keys;
  late String amount;
  double screenWidth = 0;

  late TextEditingController _controller;
  late FocusNode _focusNode; // Store the focus node in a member variable

  @override
  void initState() {
    super.initState();
    keys = [
      ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
      ['q', 'w', 'e', 'r', 't', 'y', 'i', 'o', 'p'],
      ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
      [
        const Icon(
          Icons.keyboard_capslock,
          color: Colors.black,
        ),
        'z',
        'x',
        'c',
        'v',
        'b',
        'n',
        'm',
        const Icon(
          Icons.backspace,
          color: Colors.black,
        )
      ],
      [
        const Icon(
          Icons.code_off_outlined,
          color: Colors.black,
        ),
        ',',
        const Icon(
          Icons.space_bar_outlined,
          color: Colors.black,
        ),
        '.',
        const Icon(
          Icons.transit_enterexit_outlined,
          color: Colors.black,
        )
      ],
    ];
    amount = widget.controller.text;
    _controller = widget.controller;
    _focusNode = widget.focusNode; // Initialize the member variables
  }

  onKeyTap(val) {
    if (val == '0' && amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount + val;
      _controller.text = amount; // Set the text of the controller
    });
  }

  onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount.substring(0, amount.length - 1);
      _controller.text = amount; // Set the text of the controller
    });
  }


  renderKeyboard() {
    return keys.map((x) =>
        Expanded(
          child: Row(
            children: x.map((y) =>
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: KeyboardKey(
                      label: y,
                      value: y,
                      onTap: (val) {
                        if (val is Widget) {
                          onBackspacePress();
                        } else {
                          onKeyTap(val);
                        }
                      },
                    ),
                  ),
                ),
            ).toList(),
          ),
        ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Card(
        child: Column(
          children: [
            ...renderKeyboard(),
          ],
        ),
      ),
    );
  }
}
