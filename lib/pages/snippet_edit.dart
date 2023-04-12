import 'package:flutter/material.dart';
import 'package:handy_code/pages/home_factor.dart';

class SnippetScreen extends StatefulWidget {
  const SnippetScreen({Key? key}) : super(key: key);

  @override
  _SnippetScreenState createState() => _SnippetScreenState();
}

class _SnippetScreenState extends State<SnippetScreen> {
  bool isKeyboardVisible = false;
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _snippetFocusNode = FocusNode();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _snippetTextController = TextEditingController();
  TextEditingController mycontrol = TextEditingController();
  FocusNode myfocus = FocusNode();

  void updateTitleText(String value) {
    setState(() {
      _titleTextController.text += value;
    });
  }
  void updateSnippetText(String value) {
    setState(() {
      _snippetTextController.text += value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocus = _titleFocusNode;
    mycontrol = _titleTextController;
  }
  @override
  void dispose() {
    _titleFocusNode.dispose();
    _snippetFocusNode.dispose();
    _titleTextController.dispose();
    _snippetTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Snippet'),
        actions: [
          IconButton(
            icon: Icon(Icons.download_done_outlined),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                isKeyboardVisible = !isKeyboardVisible;
              });
            },
          ),
          Visibility(
            visible: isKeyboardVisible,
            child: IconButton(
              icon: Icon(Icons.keyboard_hide),
              onPressed: () {
                setState(() {
                  isKeyboardVisible = false;
                });
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    focusNode: _titleFocusNode,
                    controller: _titleTextController,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter title',
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      myfocus = _titleFocusNode;
                      mycontrol = _titleTextController;
                      updateTitleText;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Snippet card
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextField(
                                    focusNode: _snippetFocusNode,
                                    controller: _snippetTextController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your code snippet here',
                                      border: InputBorder.none,
                                    ),
                                    onTap: () {
                                      print("Changed");
                                      myfocus = _snippetFocusNode;
                                      mycontrol = _snippetTextController;
                                      updateSnippetText;
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  Divider(thickness: 2),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Custom keyboard card
              Visibility(
                visible: isKeyboardVisible,
                child: SizedBox(
                  height: 250.0,
                  child: CustomKeyboardCard(controller: mycontrol,focusNode: myfocus,),
                ),
              ),
              // Toggle keyboard button
            ],
          ),
        ),
      ),
    );
  }
}
