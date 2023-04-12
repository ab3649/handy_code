import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomKeyboard extends StatelessWidget {
  final TextEditingController textEditingController;

  CustomKeyboard({required this.textEditingController});

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
                incst(),
                boilercode(),
                ifst(),
                elsest(),
                forst(),
                whilest(),
                inpst(),
                outst(),
                switchst(),
                funcst(),
                strucst(),
                unionst(),
                classst(),
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
        textEditingController.text += """#include <iostream>
using namespace std;
  
int main( )
{
    return 0;
}
""";
      },
      child: Text('Boiler cd'),
    );
  }

  Widget ifst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """if ( ) {
  
}
""";
      },
      child: Text('if'),
    );
  }

  Widget elsest() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """else ( ) {
  
}
""";
      },
      child: Text('else'),
    );
  }

  Widget forst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """for( ; ; ){  
   
}
""";
      },
      child: Text('for'),
    );
  }

  Widget whilest() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """while () {  

} 
""";
      },
      child: Text('while'),
    );
  }

  Widget inpst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """cin>> ;
""";
      },
      child: Text('cin'),
    );
  }

  Widget outst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """cout<< ;
""";
      },
      child: Text('cout'),
    );
  }

  Widget switchst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """switch(conditional-expression){    
case value1:    
 // code    
 break;    
case value2:    
 // code    
 break; 
default:     
 ;    
} 
""";
      },
      child: Text('switch'),
    );
  }

  Widget funcst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text +=
            """return_type function_name(parameters) {  
 // code
}
""";
      },
      child: Text('function'),
    );
  }

  Widget incst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """#include< >
""";
      },
      child: Text('include'),
    );
  }

  Widget strucst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """struct structureName{
    member1;
    member2;
    member3;
};
""";
      },
      child: Text('struct'),
    );
  }

  Widget unionst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """union union_name {
   member definition;
};
""";
      },
      child: Text('union'),
    );
  }

  Widget classst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """class MyClass {
  public:             
    int myNum;        
    string myString;  
};
""";
      },
      child: Text('class'),
    );
  }

  Widget excepst() {
    return ElevatedButton(
      onPressed: () {
        textEditingController.text += """try {
  // Block of code to try
  throw exception; 
}
catch () {
  // Block of code to handle errors
}
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

class CustomKeyboardExample extends StatefulWidget {
  @override
  _CustomKeyboardExampleState createState() => _CustomKeyboardExampleState();
}

class _CustomKeyboardExampleState extends State<CustomKeyboardExample> {
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
          child: CustomKeyboard(textEditingController: _textEditingController)),
    );
  }
}
