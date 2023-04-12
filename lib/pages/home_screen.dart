import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _counter = "";
  static const platform = MethodChannel("flutter.native/helper");
  void _openKeyBoard() async {
    String res = "";
    try {
      final String result = await platform.invokeMethod("helloFromNative");
      res = result;
    } on PlatformException catch (e) {}
    setState(() {
      _counter = res;
    });
  }

  String _selectedOption = '';

  List<String> options = ['C++', 'Java', 'Python'];

  @override
  void initState() {
    super.initState();
    _selectedOption = options[0];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
            ),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: MediaQuery.of(context).size.width / 6,
            ),
            Center(
                child: Text(
              "SET   THE",
              style: TextStyle(fontSize: 30, color: Colors.blue.shade400),
            )),
            Center(
                child: Text("LANGUAGE",
                    style:
                        TextStyle(fontSize: 30, color: Colors.blue.shade400))),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: DropdownButton<String>(
                dropdownColor: Colors.lightBlue.shade200,
                value: _selectedOption,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                        ),
                        Text(option),
                      ],
                    ),
                    alignment: Alignment.center,
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
                borderRadius: BorderRadius.circular(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue.shade200,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 6,
            ),
            GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/snip'),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "Customize snippet",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_selectedOption == 'C++') {
                  Navigator.pushReplacementNamed(context, '/cpp');
                } else if (_selectedOption == 'Java') {
                  Navigator.pushReplacementNamed(context, '/java');
                } else if (_selectedOption == 'Python') {
                  Navigator.pushReplacementNamed(context, '/python');
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 12,
                child: Center(
                  child: Text(
                    "Open KeyBoard",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.shade400),
              ),
            )
          ],
        ));
  }
}
