import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = '';

  List<String> options = ['Set', 'C++', 'Java', 'Python'];
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
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7.5,
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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7.5,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/snip'),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(width: 60),
                        Text(
                          "Customize snippet",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text(
                "feedback",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    color: Colors.blue.shade700),
              ),
            )
          ],
        ));
  }
}
