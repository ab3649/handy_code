import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PythonKeyBoard extends StatelessWidget {
  final TextEditingController textEditingController;

  PythonKeyBoard({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    maxLines: 16,
                    controller: textEditingController,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: [
                imprt(),
                boilercode(),
                ifst(),
                elsest(),
                forst(),
                whilest(),
                inpst(),
                outst(),
                switchst(),
                funcst(),
                klaus(),
                intrfac(),
                absclas(),
                excepst(),
                copy(context, textEditingController),
                delete()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget boilercode() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """import sys
        import pyforest
        def main():
""";
      },
      child: Text('Boiler cd'),
    );
  }

  Widget ifst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """if( ) :
""";
      },
      child: Text('if'),
    );
  }

  Widget elsest() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """else :
""";
      },
      child: Text('else'),
    );
  }

  Widget forst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """for( in range ( ) ) : 
""";
      },
      child: Text('for'),
    );
  }

  Widget whilest() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """while () :
""";
      },
      child: Text('while'),
    );
  }

  Widget inpst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """
        sval = input().split("")
        my_list = [int(i) for i in imput().split(" ")]
""";
      },
      child: Text('input'),
    );
  }

  Widget outst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """print(" ",)
""";
      },
      child: Text('output'),
    );
  }

  Widget switchst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """if():
        
        elif():
        
        else:
""";
      },
      child: Text('if-elif'),
    );
  }

  Widget funcst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text +=
        """def _name_( ):
""";
      },
      child: Text('function'),
    );
  }

  Widget imprt() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """import pyforest
        """;
      },
      child: Text('import'),
    );
  }

  Widget klaus() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """class _name_ :
        def __init__(self, ):
""";
      },
      child: Text('class'),
    );
  }

  Widget intrfac() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """my_dict = {my_list: [] for my_list in range( )}
""";
      },
      child: Text('dictionary'),
    );
  }

  Widget absclas() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """my_tuple = ()([int(i) for i in imput().split(" ")])
""";
      },
      child: Text('tuple'),
    );
  }

  Widget excepst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """try:
  //try code
except:
  //except code
else:
  //else code
finally:
  //code
""";
      },
      child: Text('excption'),
    );
  }

  Widget copy(
      BuildContext context, TextEditingController textEditingController) {
    return ElevatedButton(
      style:
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
      onPressed: () {
        String text = textEditingController.text;
        Clipboard.setData(
            ClipboardData(text: text)); // Copy the text to clipboard
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Text copied to clipboard'),
              duration: Duration(seconds: 1)),
        ); // Show a snackbar to indicate the text was copied
      },
      child: Text('Copy Code'),
    );
  }

  Widget delete() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
      onPressed: () {
        textEditingController.clear(); // Clear the text in the TextField
      },
      child: Text('Clear'),
    );
  }
}

class PythonKeyboardExample extends StatefulWidget {
  @override
  _PythonKeyboardExampleState createState() => _PythonKeyboardExampleState();
}

class _PythonKeyboardExampleState extends State<PythonKeyboardExample> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            icon: Icon(Icons.arrow_back)),
        title: Text('CPP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: PythonKeyBoard(textEditingController: _textEditingController)),
    );
  }
}
